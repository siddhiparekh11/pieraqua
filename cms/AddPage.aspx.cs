using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
public partial class cms_UserControls_AddPage : System.Web.UI.Page
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

            if (item.Trim().CompareTo("AddPage.aspx") == 0)
                result = true;

        }


        return result;
    }
   protected void btnSave_Click(object sender, ImageClickEventArgs e)
    {
        try
        {
            if (checkpage())
            {
                if (Page.IsPostBack)
                {
                    int returnedRows = 0;
                    sqlParams = new SqlParameter[] {
                    new SqlParameter("@pagename",txtPageName.Text) ,
                    new SqlParameter("@pagetype",RadioButtonList1.SelectedValue)
                   
            };

                    returnedRows = accessclass.ExecuteNonQuery("InsertPage", CommandType.StoredProcedure, sqlParams);
                    if (returnedRows > 0)
                    {
                        lblmsg.Visible = true;
                        lblmsg.Text = "Page has been added successfully.";
                        clear();

                    }
                }
            }
            else
            {
                lblmsg.Text = "<font color=\"red\">Page Already exist</font>";
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
        
        txtPageName.Text = "";
        
        txtPageName.Focus();
       

    }
    protected void btnCancel_Click(object sender, ImageClickEventArgs e)
    {
        if (Page.IsPostBack)
        {
            clear();
            lblmsg.Text = "";
        }
    }
    private bool checkpage()
    {
        DataSet chkpage;
        chkpage = accessclass.GetDataSet("select * from PagesInPierAqua where PageName='" + txtPageName.Text + "' and Type='" + RadioButtonList1.SelectedValue + "'", CommandType.Text, null);
        if (chkpage.Tables[0].Rows.Count > 0)
        {
            return false;
        }
        return true;
    }
}



