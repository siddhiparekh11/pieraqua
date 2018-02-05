using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class cms_EditProductCategory : System.Web.UI.Page
{
    SqlParameter[] sqlParams;
    DataAccess accessclass = new DataAccess();
    DataSet datast;
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
                    Display_Data();
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

            if (item.Trim().CompareTo("EditProductCategory.aspx") == 0)
                result = true;

        }


        return result;
    }
    private void Display_Data()
    {
        sqlParams = new SqlParameter[3];
        sqlParams[0] = new SqlParameter("@parentid",null);
        sqlParams[1] = new SqlParameter("@flag", "1");
        sqlParams[2] = new SqlParameter("@categoryid", Request.QueryString["categoryid"]);
        datast = accessclass.GetDataSet("ViewProductCategories", CommandType.StoredProcedure, sqlParams);
        txtCategory_Name.Text = datast.Tables[0].Rows[0]["CategoryName"].ToString();
        if (datast.Tables[0].Rows[0]["ParentCategoryID"].ToString().CompareTo("0") == 0)
        {
            rdlParentChild.Items[0].Selected = true;
        }
        else
        {
            rdlParentChild.Items[1].Selected = true;
            dplParentCategory.Enabled = true;
            foreach (ListItem li in dplParentCategory.Items)
            {
                if (li.Value.ToString() ==datast.Tables[0].Rows[0]["ParentCategoryID"].ToString())
                {
                    li.Selected = true;
                }
            }
        }
        if (datast.Tables[0].Rows[0]["IsActive"].ToString().CompareTo("False") == 0)
        {
            rdlIsActive.Items[1].Selected = true;
        }
        else
        {
            rdlIsActive.Items[0].Selected = true;
        }


    }
    protected void btnUpdate_Click(object sender, ImageClickEventArgs e)
    {
        try
        {
            int returnedRows = 0;
            string parentid;
            
            
            if (rdlParentChild.Items[0].Selected)
            {
                parentid = "0";
            }
            else
            {
                parentid = dplParentCategory.SelectedItem.Value.ToString();
            }
            sqlParams = new SqlParameter[] {
                    new SqlParameter("@categoryid",Request.QueryString["categoryid"].ToString()),
                    new SqlParameter("@categoryname",txtCategory_Name.Text) ,
                    new SqlParameter("@parentcategoryid",parentid),
                    new SqlParameter("@isactive",rdlIsActive.SelectedValue)
            };

            returnedRows = accessclass.ExecuteNonQuery("UpdateProductCategories", CommandType.StoredProcedure, sqlParams);
            if (returnedRows > 0)
            {
                
                if (parentid.CompareTo("0") == 0)
                {
                    fill_dropdown();
                }
                Clear_Data();
                
                Response.Redirect("ViewProductCategory.aspx");

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
    private void Clear_Data()
    {
        txtCategory_Name.Text = "";
        rdlParentChild.Items[0].Selected = false;
        rdlParentChild.Items[1].Selected = false;
        dplParentCategory.Enabled = false;
        rdlIsActive.Items[0].Selected = false;
        rdlIsActive.Items[1].Selected = false;

    }
    protected void btnCancel_Click(object sender, ImageClickEventArgs e)
    {
        Clear_Data();
        Response.Redirect("ViewProductCategory.aspx");

    }
    protected void rdlParentChild_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (rdlParentChild.Items[0].Selected)
        {
            dplParentCategory.Enabled = false;
        }
        else
        {
            dplParentCategory.Enabled = true;
        }
    }
    private void fill_dropdown()
    {

        SqlDataSource1.ConnectionString = ConfigurationManager.ConnectionStrings["PierAqua1ConnectionString"].ConnectionString;

        SqlDataSource1.SelectCommand = "select CategoryName,CategoryID from ProductCategory where ParentCategoryID=0";
        SqlDataSource1.SelectCommandType = SqlDataSourceCommandType.Text;
        SqlDataSource1.DataBind();
        dplParentCategory.DataBind();

    }
}
