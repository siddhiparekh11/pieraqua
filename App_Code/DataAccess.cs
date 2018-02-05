using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;
using System.Net.Mail;

/// <summary>
/// functions and procedures for datamanipulation
/// </summary>
public class DataAccess
{
      // variable declaration
        SqlConnection connection;
        SqlDataAdapter adapter;
        SqlCommand command ;
        DataSet datast;
        #region executenonquery
        //procedure for insert,update and delete
     public  int ExecuteNonQuery(String cmdText, CommandType cmdType, SqlParameter[] parameters)
    {
        connection = null;
        command = null;
        try
        {
            string connectionstring = ConfigurationManager.ConnectionStrings["PierAqua1ConnectionString"].ConnectionString;
            using (connection = new SqlConnection(connectionstring))
            {
                connection.Open();
                command = new SqlCommand(cmdText, connection);
                command.CommandType = cmdType;
                
                if (parameters != null)
                {
                    foreach (SqlParameter parameter in parameters)
                    {
                        if (null != parameter) 
                            command.Parameters.Add(parameter);
                    }
                }
                return command.ExecuteNonQuery();
            }
        }
        catch (Exception ex)
        {

            
        }
        finally
        {

            if (command != null)
            {
                command.Parameters.Clear();
                command.Dispose();
            }
            if (connection != null)
            {
                connection.Dispose();
            }

        }
        return -1;
    }
#endregion
        #region getdataset
        public  DataSet GetDataSet(String cmdText, CommandType cmdType, SqlParameter[] parameters)
     {
          datast = null;
          command = null;
         adapter = null;
         connection = null;
         try
         {

             string connectionstring = ConfigurationManager.ConnectionStrings["PierAqua1ConnectionString"].ConnectionString;
             using (connection = new SqlConnection(connectionstring))
             {
                 connection.Open();
                 using (command = new SqlCommand(cmdText, connection))
                 {
                     command.CommandType = cmdType;
                     if (parameters != null)
                     {
                         foreach (SqlParameter parameter in parameters)
                         {
                             if (null != parameter) command.Parameters.Add(parameter);
                         }
                     }
                     using (adapter = new SqlDataAdapter(command))
                     {
                         datast = new DataSet();
                        
                         adapter.Fill(datast,"Table1");
                         
                        
                     }
                 }
             }
         }
         catch (Exception ex)
         {
            
         }
         finally
         {
             if (datast != null)
             {
                 datast.Dispose();
             }
             if (adapter != null)
             {
                 adapter.Dispose();
             }
             if (command != null)
             {
                 command.Parameters.Clear();
                 command.Dispose();
             }
             if (connection != null)
             {
                 connection.Dispose();
             }

         }
         return datast;
     }
        #endregion
    #region sendemail

        public  int MailToSendSite(string tomail, string mailsubject, string frommail, string bodymail, string ccmail, string bccmail, string hostname, string musername, string mpass, string fromname)
        {

            try
            {
                SmtpClient smtpClientC = new SmtpClient();
                MailMessage objMailC = new MailMessage();
                MailAddress objMailC_fromaddress = new MailAddress(frommail);
                MailAddress objMailC_toaddress = new MailAddress(tomail);


                objMailC.From = objMailC_fromaddress;
                objMailC.To.Add(objMailC_toaddress);


                objMailC.IsBodyHtml = true;

                objMailC.Subject = mailsubject;

                objMailC.Body = bodymail;

                if (ccmail != null)
                {
                    objMailC.CC.Add(ccmail);
                }

                if (bccmail != null)
                {
                    objMailC.Bcc.Add(bccmail);
                }

                smtpClientC.Host = hostname;
                //smtpClientC.Port = 25;
                smtpClientC.Port = 587;
                smtpClientC.EnableSsl = true;
                smtpClientC.UseDefaultCredentials = false;
                smtpClientC.Credentials = new System.Net.NetworkCredential(musername, mpass);
                smtpClientC.Send(objMailC);
                return 1;

            }
            catch (Exception ex)
            {
                return 0;
            }


        }

#endregion



}
