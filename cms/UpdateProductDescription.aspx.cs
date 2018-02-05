using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Text;
public partial class cms_UpdateProductDescription : System.Web.UI.Page
{
    SqlParameter[] sqlParams;
    DataAccess accessclass = new DataAccess();
    DataSet datast = new DataSet();
    protected void Page_Load(object sender, EventArgs e)
    {
      
        
            sqlParams = new SqlParameter[4];
            sqlParams[0] = new SqlParameter("@flag", "4");
            sqlParams[1] = null;
            sqlParams[2] = null;
            sqlParams[3] = new SqlParameter("@productid", Request.QueryString["productid"]);


            datast = new DataSet();
            datast = accessclass.GetDataSet("ViewProducts", CommandType.StoredProcedure, sqlParams);
            if (datast.Tables[0].Rows.Count > 0)
            {
                if (Request.QueryString["descriptionid"].ToString().CompareTo("1") == 0)
                {
                    //StringBuilder listingdescription = new StringBuilder();
                    //listingdescription.Append("<script type=\"text/javascript\">");
                    //listingdescription.Append("$(document).ready(function(){");
                    //listingdescription.Append("$('#mainarea').html(");
                    //listingdescription.Append(datast.Tables[0].Rows[0].ItemArray[6].ToString());
                    //listingdescription.Append("); });");
                    //listingdescription.Append("</script>");
                    //Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "listingdescriptionblock", listingdescription.ToString());
                    Response.Write( "<b>"  + datast.Tables[0].Rows[0].ItemArray[6].ToString() + "</b>");

                }
                else if (Request.QueryString["descriptionid"].ToString().CompareTo("2") == 0)
                {
                    //StringBuilder detaileddescription = new StringBuilder();
                    //detaileddescription.Append("<script type=\"text/javascript\">");
                    //detaileddescription.Append("$(document).ready(function(){");
                    //detaileddescription.Append("$('#mainarea').html(");
                    //detaileddescription.Append(datast.Tables[0].Rows[0].ItemArray[7].ToString());
                    //detaileddescription.Append("); });");
                    //detaileddescription.Append("</script>");
                    //Page.ClientScript.RegisterClientScriptBlock(this.GetType(),"detaileddescriptionblock", detaileddescription.ToString());
                    Response.Write(datast.Tables[0].Rows[0].ItemArray[7].ToString());
                }
            }

        }

    }

