using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class cms_ViewPlanHistory : System.Web.UI.Page
{
    DataSet datast = new DataSet();
    DataAccess access = new DataAccess();
    SqlParameter[] sqlParams = null;
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
                    this.Filling_Gridview();
                    btnfirst.Enabled = false;
                    btnprevious.Enabled = false;
                    this.Filling_Page_Count();

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

            if (item.Trim().CompareTo("ViewPlanHistory.aspx") == 0)
                result = true;

        }


        return result;
    }
    #region filling_gridview
    protected void Filling_Gridview()
    {
        try
        {

            


            datast = new DataSet();
            datast = access.GetDataSet("select * from PlanTransactions where CustomerID=" + Request.QueryString["customerid"], CommandType.Text, sqlParams);

            if (datast.Tables[0].Rows.Count > 0)
            {

                ViewPlanHistory.DataSourceID = null;
                ViewPlanHistory.DataSource = datast;
                ViewPlanHistory.DataBind();
                Lbl_rc.ForeColor = System.Drawing.Color.Black;
                Lbl_rc.Font.Bold = true;
                Lbl_rc.Text = "<font color='#009933'>Total no of records : " + datast.Tables[0].Rows.Count + "</font>";
                trP1.Visible = true;
                ViewPlanHistory.Visible = true;



            }
            else
            {

                ViewPlanHistory.DataSourceID = null;
                Lbl_rc.ForeColor = System.Drawing.Color.Black;
                Lbl_rc.Font.Bold = true;
                Lbl_rc.Text = "<font color='#FF0000'>No record in the list.</font>";
                trP1.Visible = false;
                ViewPlanHistory.Visible = false;


            }

        }
        catch (Exception ex)
        {

            lblmsg.Visible = true;
            lblmsg.Text = "Error : " + ex.Message;

        }
        finally
        {
            sqlParams = null;
            datast.Dispose();

        }
    }
    #endregion
    #region filling_page_count
    protected void Filling_Page_Count()
    {
        int a = 0;

        a = ViewPlanHistory.PageIndex + 1;

        Lbl_paging.Text = "You are viewing page <font color='##008000' size='2'>" + a + "</font> of <font color='##008000' size='2'>" + ViewPlanHistory.PageCount + "</font>";

        if (ViewPlanHistory.PageCount == 1)
        {
            btnfirst.Enabled = false;
            btnlast.Enabled = false;
            btnnext.Enabled = false;
            btnprevious.Enabled = false;
        }


    }
    #endregion
    
    protected void ViewPlanHistory_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        ViewPlanHistory.PageIndex = e.NewPageIndex;
        this.Filling_Gridview();
    }
    protected void btnfirst_Click(object sender, ImageClickEventArgs e)
    {

        ViewPlanHistory.PageIndex = 0;
        btnfirst.Enabled = false;
        btnprevious.Enabled = false;
        btnlast.Enabled = true;
        btnnext.Enabled = true;


        this.Filling_Gridview();
        this.Filling_Page_Count();

    }

    protected void btnprevious_Click(object sender, ImageClickEventArgs e)
    {
        int i = ViewPlanHistory.PageCount;
        if (ViewPlanHistory.PageIndex > 0)
        {
            ViewPlanHistory.PageIndex = ViewPlanHistory.PageIndex - 1;
            btnlast.Enabled = true;
        }
        if (ViewPlanHistory.PageIndex == 0)
        {
            btnfirst.Enabled = false;
        }
        if (ViewPlanHistory.PageCount - 1 == ViewPlanHistory.PageIndex + 1)
        {
            btnnext.Enabled = true;
        }
        if (ViewPlanHistory.PageIndex == 0)
        {
            btnprevious.Enabled = false;
        }


        this.Filling_Gridview();
        this.Filling_Page_Count();
    }
    protected void btnnext_Click(object sender, ImageClickEventArgs e)
    {
        int i = ViewPlanHistory.PageIndex + 1;
        if (i <= ViewPlanHistory.PageCount)
        {
            ViewPlanHistory.PageIndex = i;
            btnlast.Enabled = true;
            btnprevious.Enabled = true;
            btnfirst.Enabled = true;
        }
        if (ViewPlanHistory.PageCount - 1 == ViewPlanHistory.PageIndex)
        {
            btnnext.Enabled = false;
            btnlast.Enabled = false;
        }



        this.Filling_Gridview();
        this.Filling_Page_Count();
    }
    protected void btnlast_Click(object sender, ImageClickEventArgs e)
    {
        ViewPlanHistory.PageIndex = ViewPlanHistory.PageCount;
        btnlast.Enabled = false;
        btnfirst.Enabled = true;
        btnnext.Enabled = false;
        btnprevious.Enabled = true;

        this.Filling_Gridview();
        this.Filling_Page_Count();
    }
    
}
