using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
public partial class cms_ChangePassword : System.Web.UI.Page
{
    DataAccess accessclass = new DataAccess();
    DataSet datast=new DataSet();
    SqlParameter[] sqlparam ;
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

            if (item.Trim().CompareTo("ChangePassword.aspx") == 0)
                result = true;

        }


        return result;
    }
    protected void btnSave_Click(object sender, ImageClickEventArgs e)
    {
        int returnedrow;
        datast = accessclass.GetDataSet("select Password from Admin where UserID=" + Session["AdminUser_ID"], CommandType.Text, sqlparam);
        if (datast.Tables[0].Rows.Count > 0)
        {
            if (datast.Tables[0].Rows[0]["Password"].ToString().CompareTo(txtOldPassword.Text) == 0)
            {
                returnedrow = accessclass.ExecuteNonQuery("Update Admin set Password='" + txtNewPassword.Text + "' where UserID=" + Session["AdminUser_ID"], CommandType.Text, sqlparam);
                if (returnedrow > 0)
                {
                    lblmsg.Text = "Your Password has been changed successfully";
                    txtNewPassword.Text = "";
                    txtOldPassword.Text = "";

                }
            }
            else
            {
                lblmsg.Text = "<font color=\"red\">Old Password is incorrect</font>";
            }
        }

    }
    protected void btnCancel_Click(object sender, ImageClickEventArgs e)
    {
        txtNewPassword.Text = "";
        txtOldPassword.Text = "";
        lblmsg.Text = "";
    }
}
