using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
public partial class cms_UpdateBuyingDescription : System.Web.UI.Page
{
    SqlParameter[] sqlParams;
    DataAccess accessclass = new DataAccess();
    DataSet datast = new DataSet();
    protected void Page_Load(object sender, EventArgs e)
    {
        sqlParams = null;
        datast = new DataSet();
       
        datast = accessclass.GetDataSet("select BriefDescription,RequiredCertification from BuyingLeads where buyingleadid=" + Request.QueryString["buyingleadid"], CommandType.Text, sqlParams);
        
        if (datast.Tables[0].Rows.Count > 0)
        {
            if(Request.QueryString["fieldno"].ToString().CompareTo("1")==0)
                Response.Write(datast.Tables[0].Rows[0].ItemArray[0].ToString());
            else if (Request.QueryString["fieldno"].ToString().CompareTo("2") == 0)
                Response.Write(datast.Tables[0].Rows[0].ItemArray[1].ToString());
        }

    }
}
