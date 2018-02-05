using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
public partial class Index : System.Web.UI.Page
{
    DataAccess access = new DataAccess();
    DataSet ds,dsfeatured;
    string[] featurephotopath;
    public int CurrentPage
    {
        get
        {
            // look for current page in ViewState
            object o = this.ViewState["_CurrentPage"];
            if (o == null)
                return 1; // default page index of 0
            else
                return (int)o;
        }

        set
        {
            this.ViewState["_CurrentPage"] = value;
        }
    } 
    protected void Page_Load(object sender, EventArgs e)
    {
        
        if (!Page.IsPostBack)
        {
            fill_featured();
        }
         
    }

    private void fill_featured()
    {
        int k = 0;
     
        dsfeatured = access.GetDataSet("select  * from dbo.FrontFeaturedProduct(1)", CommandType.Text, null);
        if (dsfeatured.Tables[0].Rows.Count > 0)
        {
            featurephotopath = new string[dsfeatured.Tables[0].Rows.Count];
            foreach (DataRow d in dsfeatured.Tables[0].Rows)
            {
                featurephotopath[k] = d["items"].ToString();
                k++;
            }
            PagedDataSource pgdtsrc = new PagedDataSource();
            pgdtsrc.DataSource = featurephotopath;
            pgdtsrc.AllowPaging = true;
            pgdtsrc.PageSize = 3;
            pgdtsrc.CurrentPageIndex = CurrentPage - 1;
            imgbtnlft.Enabled = !pgdtsrc.IsFirstPage;
            imgbtnright.Enabled = !pgdtsrc.IsLastPage;
            dtlstFeatured.DataSource = pgdtsrc;
            dtlstFeatured.DataBind();
        }
    }
   

    protected void imgbtnlft_Click(object sender, ImageClickEventArgs e)
    {
        CurrentPage -= 1;
        fill_featured();
    }
    protected void imgbtnright_Click(object sender, ImageClickEventArgs e)
    {
        CurrentPage += 1;
        fill_featured();
    }
}