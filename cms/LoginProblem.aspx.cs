using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Text;
using System.Security.Cryptography;
using System.IO;
using System.Data.SqlClient;
using System.Net.Mail;

public partial class psadmin_LoginProblem : System.Web.UI.Page
{
   SqlParameter[] sqlparam=null  ;
    DataSet dsUserChk,dsAdminEmail;
    
    DataAccess access=new DataAccess();

    string mhost = "", musername = "", mpass = "", contactemail = "";
    string UserName, Password;
    protected void Page_Load(object sender, EventArgs e)
    {
        txtEmail_ID.Focus();
    }
    protected void btnSend_Click(object sender, ImageClickEventArgs e)
    {
        try
        {
            
            dsUserChk = new DataSet();
            string sql="select UserName,Password from Admin where UserName='" + txtEmail_ID.Text + "'";
            dsUserChk=access.GetDataSet(sql,CommandType.Text,sqlparam);

    
            
   

            if (dsUserChk.Tables[0].Rows.Count > 0)
            {
                 UserName = dsUserChk.Tables[0].Rows[0]["UserName"].ToString();
                 Password = dsUserChk.Tables[0].Rows[0]["Password"].ToString();

                SendMail();
              }
            else
            {
                lblMsg.Text = "Oops...! Email ID Not Exist";
                txtEmail_ID.Text = "";
            }

        }
        catch (Exception ex)
        {
            
        }
        finally
        {
            
        }   
    }

    public void SendMail()
    {

        #region //Mail authentication details

        try
        {
            
            dsAdminEmail = new DataSet();
            dsAdminEmail = access.GetDataSet("select HostName,UserName,Password,ContactEmail from AdminEmails where ID=1", CommandType.Text, sqlparam);
            if (dsAdminEmail.Tables[0].Rows.Count > 0)
            {
                mhost = dsAdminEmail.Tables[0].Rows[0]["HostName"].ToString();
                musername = dsAdminEmail.Tables[0].Rows[0]["UserName"].ToString();
                mpass = dsAdminEmail.Tables[0].Rows[0]["Password"].ToString();
                contactemail = dsAdminEmail.Tables[0].Rows[0]["ContactEmail"].ToString();
            }

        }
        catch (Exception ex)
        {
            Response.Write(ex.Message);
        }
        finally
        {
        }

        #endregion

        

        #region //mail sending process

        string Cust = "hi" + "<br/>" + "<Table ><tr><tdstyle=\"border:solid 1px black;\">UserName</td><td style=\"border:solid 1px black;\">" + UserName + "</td></tr><tr><td style=\"border:solid 1px black;\">Password</td><td style=\"border:solid 1px black;\">" + Password + "</td></tr></Table>";
    
        if ((!string.IsNullOrEmpty(mhost)) && (!string.IsNullOrEmpty(musername)) && (!string.IsNullOrEmpty(mpass)) && (!string.IsNullOrEmpty(txtEmail_ID.Text)) && (!string.IsNullOrEmpty(contactemail)))
        {
            int mailSucessC = 0;

            string consubject = "Your Password Details - Pier Aqua " + System.DateTime.Today.ToString("dd-MMM-yyyy");
            mailSucessC = access.MailToSendSite(txtEmail_ID.Text, consubject, contactemail, Cust, null, null, mhost, musername, mpass, "Hi");

            if (mailSucessC == 1)
            {
                lblMsg.Text = "Email Send Sucessfully";
                string ToRedirectURL = "Login.aspx";
                Response.AppendHeader("REFRESH", "5;URL=" + ToRedirectURL);
            }
            else
            {
                lblMsg.Text = "Email Sending Fail, Please try later";
            }
        }


        #endregion

    
    }
    
}
