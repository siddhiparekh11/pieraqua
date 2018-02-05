using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class cms_UpdateCompanyDescription : System.Web.UI.Page
{
    SqlParameter[] sqlParams;
    DataAccess accessclass = new DataAccess();
    DataSet datast = new DataSet();
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
                sqlParams = null;
                datast = new DataSet();
                datast = accessclass.GetDataSet("select BriefIntroduction from Companies where CompanyID=" + Request.QueryString["companyid"], CommandType.Text, sqlParams);
                if (datast.Tables[0].Rows.Count > 0)
                {
                    Response.Write(datast.Tables[0].Rows[0].ItemArray[0].ToString());
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

            if (item.Trim().CompareTo("UpdateCompanyDescription.aspx") == 0)
                result = true;

        }


        return result;
    }
}
