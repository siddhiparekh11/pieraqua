using System;
using System.Web.UI;

public partial class smsadmin_Controls_Header : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["AdminUser_ID"] == null || Session["AdminUser_ID"] == "")
        {
            lblDate.Text = DateTime.Now.ToString("dd-MMM-yyyy");
            lblUserName.Text = "Guest";
        }
        else
        {
            lblDate.Text = DateTime.Now.ToString("dd-MMM-yyyy");
            lblUserName.Text = Session["AdminFull_Name"].ToString();
        }
        
    }
   
    protected void btnLogout_Click(object sender, ImageClickEventArgs e)
    {

        Session.Abandon();
        Session.RemoveAll();
        Response.Redirect("Login.aspx");
    }
    protected void imgbtnHome_Click(object sender, ImageClickEventArgs e)
    {
        if (Session["AdminUser_ID"] == null || Session["AdminUser_ID"] == "")
        {
            Response.Redirect("Login.aspx");
        }
        else
        {
            Response.Redirect("Welcome.aspx");
        }
    }
}
