using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
public partial class cms_AddUsers : System.Web.UI.Page
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

            if (item.Trim().CompareTo("AddUsers.aspx") == 0)
                result = true;

        }


        return result;
    }
    protected void btnSave_Click(object sender, ImageClickEventArgs e)
    {
        string pagerights=null;
        try
        {
            if (Page.IsPostBack)
            {
                foreach (ListItem li in chklPages.Items)
                {
                    if (li.Selected)
                        pagerights = pagerights + li.Value + ",";
                }
                if (pagerights != null)
                {
                    int returnedRows = 0;
                   
                    sqlParams = new SqlParameter[] {
                    new SqlParameter("@username",txtUserName.Text) ,
                    new SqlParameter("@password",txtPassword.Text),
                    new SqlParameter("@fullname",txtFullName.Text),
                    new SqlParameter("@pagerights",pagerights)
                    
            };

                    returnedRows = accessclass.ExecuteNonQuery("InsertAdmin", CommandType.StoredProcedure, sqlParams);
                    if (returnedRows > 0)
                    {
                        lblmsg.Visible = true;
                        lblmsg.Text = "User has been added successfully.";
                        clear();

                    }
                }
                else
                {
                    lblmsg.Text = "<font color=\"red\">Select Pages</font>";
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
        txtUserName.Text = "";
        txtPassword.Text = "";
        txtFullName.Text = "";
        foreach(ListItem li in chklPages.Items)
        {
            li.Selected = false;
        }


    }
    protected void btnCancel_Click(object sender, ImageClickEventArgs e)
    {
        if (Page.IsPostBack)
        {
            clear();
            lblmsg.Text = "";
        }
    }

    protected void CheckBox1_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox1.Checked)
        {
            foreach (ListItem li in chklPages.Items)
            {
                li.Selected = true;
            }
        }
    }
}
