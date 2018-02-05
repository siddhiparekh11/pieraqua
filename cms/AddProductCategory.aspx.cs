using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
public partial class cms_AddProductCategory : System.Web.UI.Page
{
    SqlParameter[] sqlParams;
    DataAccess accessclass= new DataAccess();

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
                    fill_dropdown();
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

            if (item.Trim().CompareTo("AddProductCategory.aspx") == 0)
                result = true;

        }


        return result;
    }
    protected void btnCancel_Click(object sender, ImageClickEventArgs e)
    {
        if (Page.IsPostBack)
        {
            clear();
            lblmsg.Text = "";
            rdlParentChild.Items.Clear();
            rdlParentChild.Items.Add(new ListItem("Parent","Parent"));
            rdlParentChild.Items.Add(new ListItem("Child","Child"));
            rdlParentChild.Items[0].Selected = true;
           
        }
        
    }
    protected void btnSave_Click(object sender, ImageClickEventArgs e)
    {
        try
        {
            if (Page.IsValid)
            {
                int returnedRows = 0;
                int tempvalue;
                if (rdlParentChild.Items[0].Selected)
                {
                    tempvalue = 0;
                }
                else
                {
                    tempvalue = Convert.ToInt32(dplParentCategory.SelectedValue.ToString());
                }
                sqlParams = new SqlParameter[] {
                    new SqlParameter("@CategoryName",txtCategory_Name.Text) ,
                    new SqlParameter("@ParentCategoryID",tempvalue),
                   
                    
                };

                returnedRows = accessclass.ExecuteNonQuery("InsertProductCategory", CommandType.StoredProcedure, sqlParams);
                if (returnedRows > 0)
                {
                    lblmsg.Visible = true;
                    lblmsg.Text = "Product category has been added successfully.";
                    if (tempvalue == 0)
                    {
                        fill_dropdown();
                    }

                    clear();

                }
            }
        }
        catch (Exception ex)
        {
            lblmsg.Visible = true;
            lblmsg.Text = "Error :" + ex.Message;

        }
        finally
        {
            sqlParams = null;

        }
    }
    private void clear()
    {
        txtCategory_Name.Text = "";
        rdlParentChild.SelectedIndex = 0;
        dplParentCategory.Enabled = false;
        dplParentCategory.SelectedIndex = dplParentCategory.Items.Count - 1;
        
    }
    protected void rdlParentChild_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (rdlParentChild.SelectedIndex == 1)
        {
            dplParentCategory.Enabled = true;
        }
        else
        {
            dplParentCategory.Enabled=false;
        }


    }
    private void fill_dropdown()
    {

        SqlDataSource1.ConnectionString = ConfigurationManager.ConnectionStrings["PierAqua1ConnectionString"].ConnectionString;
        
        SqlDataSource1.SelectCommand = "select CategoryName,CategoryID from ProductCategory where ParentCategoryID=0";
        SqlDataSource1.SelectCommandType = SqlDataSourceCommandType.Text;
        SqlDataSource1.DataBind();
        dplParentCategory.DataBind();
        dplParentCategory.Items.Add(new ListItem("Select a category", "0"));
        dplParentCategory.SelectedValue = "0";
        
    }
    protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
    {
        if (rdlParentChild.SelectedIndex == 1)
        {
            if (dplParentCategory.SelectedValue.CompareTo("0") == 0)
                args.IsValid = false;
            else
                args.IsValid = true;
        }
        else
        {
            args.IsValid = true;
        }
    }
}
