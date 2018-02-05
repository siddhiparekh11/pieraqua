using System;
using System.Data;
using System.Web.UI;
using System.Data.SqlClient;

public partial class cms_Login : System.Web.UI.Page
{
    SqlParameter[] sqlParams;
    DataAccess accessclass = new DataAccess();
    DataSet dsUserChk;
    

    protected void Page_Load(object sender, EventArgs e)
    {
        txtUser_Name.Focus();
    }


    protected void btnLogin_Click(object sender, ImageClickEventArgs e)
    {
        try
        {
            sqlParams = new SqlParameter[] {
                    new SqlParameter("@flag",3) ,
                    new SqlParameter("@username",txtUser_Name.Text),
                    new SqlParameter("@password",txtPassword.Text)
                    
            };
            dsUserChk = accessclass.GetDataSet("ViewUsers", CommandType.StoredProcedure, sqlParams);
            if (dsUserChk.Tables[0].Rows.Count > 0)
            {
                if (dsUserChk.Tables[0].Rows[0]["IsActive"].ToString().CompareTo("True") == 0)
                {
                    Session["AdminUser_ID"] = dsUserChk.Tables[0].Rows[0]["UserID"].ToString();
                    Session["AdminUser_Name"] = dsUserChk.Tables[0].Rows[0]["UserName"].ToString();
                    Session["AdminFull_Name"] = dsUserChk.Tables[0].Rows[0]["FullName"].ToString();
                    Session["Admin_Page_Rights"] = dsUserChk.Tables[0].Rows[0]["PagesPermitted"].ToString();
                    
                    Response.Redirect("Welcome.aspx");
                }
                else
                {

                    lblMsg.Text = "Oops...! Inactive User Name OR Password";
                    txtUser_Name.Focus();
                }
            }
            else
            {
                lblMsg.Text = "Oops...! Invalid User Name OR Password";
                txtUser_Name.Focus();
            }

        }
        catch (Exception ex)
        {
            Response.Write(ex);
        }
        finally
        {
            sqlParams = null;
        }
    }
    
}
