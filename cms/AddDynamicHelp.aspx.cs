using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
public partial class cms_InsertTestimonial : System.Web.UI.Page
{

    SqlParameter[] sqlParams;
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

            if (item.Trim().CompareTo("AddDynamicHelp.aspx") == 0)
                result = true;

        }


        return result;
    }
    protected void btnSave_Click(object sender, ImageClickEventArgs e)
    {
        try
        {
            if (Page.IsPostBack)
            {
                int returnedRows = 0;
                sqlParams = new SqlParameter[] {
                    new SqlParameter("@helpname",txtHelpName.Text) ,
                    new SqlParameter("@helpdescription",txtHelpDescription.Text),
                    new SqlParameter("@pageid ",DropDownList1.SelectedValue),
                    
            };

                returnedRows = accessclass.ExecuteNonQuery("InsertDynamicHelp", CommandType.StoredProcedure, sqlParams);
                if (returnedRows > 0)
                {
                    lblmsg.Visible = true;
                    lblmsg.Text = "Help has been added successfully";
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
        txtHelpName.Text = "";
        txtHelpDescription.Text = "";
        DropDownList1.SelectedIndex = 0;


    }
    protected void btnCancel_Click(object sender, ImageClickEventArgs e)
    {
        if (Page.IsPostBack)
        {
            clear();
            lblmsg.Text = "";
        }
    }
    
}
