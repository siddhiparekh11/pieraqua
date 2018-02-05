using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
public partial class SearchResult : System.Web.UI.Page
{
    DataAccess access = new DataAccess();
    SqlParameter[] sqlparam;
    DataSet ds,dsattribute;
    protected void Page_Load(object sender, EventArgs e)
    {
        sqlparam = new SqlParameter[] {
                        new SqlParameter("@flag",1) ,
                        new SqlParameter("@categoryid",15)
        };
        ds = access.GetDataSet("Frontsearchproduct", CommandType.StoredProcedure, sqlparam);
        repsearchproduct.DataSource = ds;
        repsearchproduct.DataBind();
                    
            
        
    }

    protected void repsearchproduct_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        HiddenField hdnattribute = new HiddenField();
        hdnattribute = (HiddenField)e.Item.FindControl("hdnproductid");
        dsattribute = access.GetDataSet("select AttributeName,AttributeValue from ProductAttributes where ProductID='" + hdnattribute.Value.ToString() + "' and IsActive=1", CommandType.Text, null);
        Repeater repattr = new Repeater();
        if (dsattribute.Tables[0].Rows.Count > 0)
        {
            repattr = (Repeater)e.Item.FindControl("repproductattribute");
            repattr.DataSource = dsattribute;
            repattr.DataBind();
        }

    }
}