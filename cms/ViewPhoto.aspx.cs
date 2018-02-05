using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class cms_ViewPhoto : System.Web.UI.Page
{
    DataSet ds=new DataSet();
    SqlParameter[] sqlParams;
    DataAccess access=new DataAccess();
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
                if (!Page.IsPostBack)
                {
                    if (Request.QueryString["productid"] != null || Request.QueryString["buyingleadid"] != null)
                    {
                        sqlParams = new SqlParameter[2];
                        sqlParams[0] = new SqlParameter("@flag", "1");
                        if (Request.QueryString["productid"] != null)
                        {
                            sqlParams[1] = new SqlParameter("@productid", Request.QueryString["productid"]);
                        }
                        else if (Request.QueryString["buyingleadid"] != null)
                        {
                            sqlParams[1] = new SqlParameter("@buyingleadid", Request.QueryString["buyingleadid"]);
                        }

                        ds = access.GetDataSet("AdminViewPhoto", CommandType.StoredProcedure, sqlParams);
                        
                        
                        if (ds.Tables[0].Rows.Count > 0)
                        {
                            ImageRepeater.DataSource = ds;
                            ImageRepeater.DataBind();
                            
                        }
                        else
                        {
                            Response.Write("<font color=\"red\">There are images uploaded for the current context</font>");
                        }
                    }
                    else
                    {
                        Response.Write("<font color=\"red\">There are images uploaded for the current context</font>");
                    }
                    
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

            if (item.Trim().CompareTo("ViewPhoto.aspx") == 0)
                result = true;

        }


        return result;
    }
}
