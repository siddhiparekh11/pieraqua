using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
public partial class UserControl_FrontLeftPane : System.Web.UI.UserControl
{
    DataAccess access = new DataAccess();
    DataSet ds;
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void menuouterrepeater_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {

        HiddenField hdnparent = new HiddenField();
        hdnparent = (HiddenField)e.Item.FindControl("hdnParentCategoryid");
        ds = access.GetDataSet("Select CategoryID,CategoryName from ProductCategory where IsActive=1 and ParentCategoryID=" + hdnparent.Value, CommandType.Text, null);
        if (ds.Tables[0].Rows.Count > 0)
        {
            e.Item.FindControl("innerul").Visible = true;
        }
        Repeater repchild = new Repeater();
        repchild = (Repeater)e.Item.FindControl("menuinnerrepeater");
        repchild.DataSource = ds.Tables[0].DefaultView;
        repchild.DataBind();

    }

}