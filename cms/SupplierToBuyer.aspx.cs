using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
public partial class cms_SupplierToBuyer : System.Web.UI.Page
{
    SqlParameter[] sqlParams;
    DataAccess accessclass = new DataAccess();
    DataSet datast;
    string planuniqueid;
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
                    sqlParams =new SqlParameter[1] ;
                    sqlParams[0] = new SqlParameter("@customerid", Request.QueryString["customerid"]);
                    datast = new DataSet();
                    datast = accessclass.GetDataSet("GetActivePlan", CommandType.StoredProcedure, sqlParams);
                    if (datast.Tables[0].Rows.Count > 0)
                    {
                        lblBuyerName.Text = datast.Tables[0].Rows[0]["CustomerName"].ToString();
                        lblPlanName.Text = datast.Tables[0].Rows[0]["PlanName"].ToString();
                        lblTotalBalance.Text = datast.Tables[0].Rows[0]["PlanBalanceLeft"].ToString();
                        lblActiveStatus.Text = datast.Tables[0].Rows[0]["IsActive"].ToString();
                        planuniqueid = datast.Tables[0].Rows[0]["PlanTransactionUniqueID"].ToString();
                    }
                    btnfirst.Enabled = false;
                    btnprevious.Enabled = false;
                    this.Filling_Gridview();
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

            if (item.Trim().CompareTo("SupplierToBuyer.aspx") == 0)
                result = true;

        }


        return result;
    }
    #region filling_gridview
    protected void Filling_Gridview()
    {
        try
        {

            sqlParams = new SqlParameter[2];
            sqlParams[0] = new SqlParameter("@flag",1);
            sqlParams[1] = new SqlParameter("@planuniqueid", planuniqueid);

            datast = new DataSet();
            datast = accessclass.GetDataSet("GetSellerToBuyer", CommandType.StoredProcedure, sqlParams);

            if (datast.Tables[0].Rows.Count > 0)
            {

                ViewBuyerToSupplierGrid.DataSourceID = null;
                ViewBuyerToSupplierGrid.DataSource = datast;
                ViewBuyerToSupplierGrid.DataBind();
                Lbl_rc.ForeColor = System.Drawing.Color.Black;
                Lbl_rc.Font.Bold = true;
                Lbl_rc.Text = "<font color='#009933'>Total no of records : " + datast.Tables[0].Rows.Count + "</font>";
                trP1.Visible = true;
                ViewBuyerToSupplierGrid.Visible = true;


            }
            else
            {

                ViewBuyerToSupplierGrid.DataSourceID = null;
                Lbl_rc.ForeColor = System.Drawing.Color.Black;
                Lbl_rc.Font.Bold = true;
                Lbl_rc.Text = "<font color='#FF0000'>No record in the list.</font>";
                trP1.Visible = false;
                ViewBuyerToSupplierGrid.Visible = false;


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

        a = ViewBuyerToSupplierGrid.PageIndex + 1;

        Lbl_paging.Text = "You are viewing page <font color='##008000' size='2'>" + a + "</font> of <font color='##008000' size='2'>" + ViewBuyerToSupplierGrid.PageCount + "</font>";

        if (ViewBuyerToSupplierGrid.PageCount == 1)
        {
            btnfirst.Enabled = false;
            btnlast.Enabled = false;
            btnnext.Enabled = false;
            btnprevious.Enabled = false;
        }


    }
    #endregion

    protected void ViewBuyerToSupplierGrid_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        ViewBuyerToSupplierGrid.PageIndex = e.NewPageIndex;
        this.Filling_Gridview();
    }
    protected void btnfirst_Click(object sender, ImageClickEventArgs e)
    {

        ViewBuyerToSupplierGrid.PageIndex = 0;
        btnfirst.Enabled = false;
        btnprevious.Enabled = false;
        btnlast.Enabled = true;
        btnnext.Enabled = true;


        this.Filling_Gridview();
        this.Filling_Page_Count();

    }

    protected void btnprevious_Click(object sender, ImageClickEventArgs e)
    {
        int i = ViewBuyerToSupplierGrid.PageCount;
        if (ViewBuyerToSupplierGrid.PageIndex > 0)
        {
            ViewBuyerToSupplierGrid.PageIndex = ViewBuyerToSupplierGrid.PageIndex - 1;
            btnlast.Enabled = true;
        }
        if (ViewBuyerToSupplierGrid.PageIndex == 0)
        {
            btnfirst.Enabled = false;
        }
        if (ViewBuyerToSupplierGrid.PageCount - 1 == ViewBuyerToSupplierGrid.PageIndex + 1)
        {
            btnnext.Enabled = true;
        }
        if (ViewBuyerToSupplierGrid.PageIndex == 0)
        {
            btnprevious.Enabled = false;
        }


        this.Filling_Gridview();
        this.Filling_Page_Count();
    }
    protected void btnnext_Click(object sender, ImageClickEventArgs e)
    {
        int i = ViewBuyerToSupplierGrid.PageIndex + 1;
        if (i <= ViewBuyerToSupplierGrid.PageCount)
        {
            ViewBuyerToSupplierGrid.PageIndex = i;
            btnlast.Enabled = true;
            btnprevious.Enabled = true;
            btnfirst.Enabled = true;
        }
        if (ViewBuyerToSupplierGrid.PageCount - 1 == ViewBuyerToSupplierGrid.PageIndex)
        {
            btnnext.Enabled = false;
            btnlast.Enabled = false;
        }



        this.Filling_Gridview();
        this.Filling_Page_Count();
    }
    protected void btnlast_Click(object sender, ImageClickEventArgs e)
    {
        ViewBuyerToSupplierGrid.PageIndex = ViewBuyerToSupplierGrid.PageCount;
        btnlast.Enabled = false;
        btnfirst.Enabled = true;
        btnnext.Enabled = false;
        btnprevious.Enabled = true;

        this.Filling_Gridview();
        this.Filling_Page_Count();
    }
}
