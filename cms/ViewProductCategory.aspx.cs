using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Text;
public partial class cms_ViewProductCategory : System.Web.UI.Page
{
    SqlParameter[] sqlParams;
    DataSet datast;
    DataAccess accessclass = new DataAccess();
    
    protected void Page_Load(object sender, EventArgs e)
    {
        if ((Session["AdminUser_ID"] == null || Session["AdminUser_ID"].ToString().CompareTo("") == 0))
        {
            Response.Redirect("Login.aspx");
        }
        else
        {
            if (page_right_check())
            {
                if (!Page.IsPostBack)
                {
                    rootlevel(0);
                }
            }
            else
            {
                Response.Redirect("Welcome.aspx");
            }
        }
    }
    private bool page_right_check()
    {
        bool result = false;
        GlobalArrays.fillarray(Session["Admin_Page_Rights"].ToString(), ',');
        foreach (string item in GlobalArrays.returnarray())
        {

            if (item.Trim().CompareTo("ViewProductCategory.aspx") == 0)
                result = true;

        }


        return result;
    }
    protected void ViewCategoryTreeview_TreeNodePopulate(object sender, TreeNodeEventArgs e)
    {
        sublevel(Convert.ToInt32(e.Node.Value), e.Node);

    }
    private void rootlevel(int parentid)
    {

        sqlParams = new SqlParameter[2];
        sqlParams[0] = new SqlParameter("@parentid", Convert.ToString(parentid));
        sqlParams[1] = new SqlParameter("@flag", "0");
        datast = accessclass.GetDataSet("ViewProductCategories", CommandType.StoredProcedure, sqlParams);
        populatenodes(ViewCategoryTreeview.Nodes);
    }
    private void populatenodes(TreeNodeCollection nodes)
    {
        foreach(DataRow dr in datast.Tables[0].Rows)
        {
            TreeNode tn=new TreeNode();
            tn.Text = dr["CategoryName"].ToString() ;
            tn.ToolTip = dr["IsActive"].ToString();
            tn.Value = dr["CategoryID"].ToString();
            nodes.Add(tn);
            //If node has child nodes, then enable on-demand populating
            tn.PopulateOnDemand = (Convert.ToInt32(dr["ChildCounts"]) > 0);
        }
    }
    private void sublevel(int rootparentid, TreeNode parentnode)
    {
        sqlParams = new SqlParameter[2];
        sqlParams[0] = new SqlParameter("@parentid", Convert.ToString(rootparentid));
        sqlParams[1] = new SqlParameter("@flag", "0");
        datast = accessclass.GetDataSet("ViewProductCategories", CommandType.StoredProcedure, sqlParams);
        populatenodes(parentnode.ChildNodes);
    }


    protected void ViewCategoryTreeview_SelectedNodeChanged(object sender, EventArgs e)
    {
       

        if (ViewCategoryTreeview.SelectedNode.Parent!=null)
        {
            txtMultiPurpose.Text = ViewCategoryTreeview.SelectedNode.Parent.Text.ToString() + "->" + ViewCategoryTreeview.SelectedNode.Text.ToString();
        }
        else
        {
            txtMultiPurpose.Text = ViewCategoryTreeview.SelectedNode.Text.ToString();
        }
      
    }

    protected void btnEdit_Click(object sender, EventArgs e)
    {
        Response.Redirect("EditProductCategory.aspx?categoryid=" +  ViewCategoryTreeview.SelectedNode.Value.ToString());
        
    }
    protected void btnSearch_Click(object sender, ImageClickEventArgs e)
    {
        sqlParams =new SqlParameter[2];
        sqlParams[0] = new SqlParameter("@searchtext", txtMultiPurpose.Text);
        sqlParams[1] = new SqlParameter("@flag", "2");
        datast = accessclass.GetDataSet("ViewProductCategories", CommandType.StoredProcedure, sqlParams);
       
        ViewCategoryTreeview.Nodes.Clear();
        populatenodes(ViewCategoryTreeview.Nodes);
       
    }
    protected void btnViewProducts_Click(object sender, EventArgs e)
    {
        if (ViewCategoryTreeview.SelectedNode.Parent != null)
            Response.Redirect("ViewProducts.aspx?categoryid=" + ViewCategoryTreeview.SelectedNode.Value.ToString());
    }

  
}
