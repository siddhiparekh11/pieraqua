using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
public partial class cms_AddFAQ : System.Web.UI.Page
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

            if (item.Trim().CompareTo("AddFAQ.aspx") == 0)
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
                    new SqlParameter("@FAQQuestion",txtFAQ_Question.Text) ,
                    new SqlParameter("@FAQAnswer",txtFAQ_Anwer.Text),
                    new SqlParameter("@FAQType",rdlFAQType.SelectedValue.ToString()),
                    new SqlParameter("@userid",Session["AdminUser_ID"].ToString())
                   
            };

                returnedRows = accessclass.ExecuteNonQuery("InsertFAQ", CommandType.StoredProcedure, sqlParams);
                if (returnedRows > 0)
                {
                    lblmsg.Visible = true;
                    lblmsg.Text = "FAQ has been added successfully.";
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
        txtFAQ_Question.Text = "";
        txtFAQ_Anwer.Text = "";
        foreach (ListItem li in rdlFAQType.Items)
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
}
