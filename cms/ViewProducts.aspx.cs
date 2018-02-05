using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
public partial class cms_ViewProducts : System.Web.UI.Page
{
    SqlParameter[] sqlParams;
    DataAccess accessclass = new DataAccess();
    DataSet datast;
    int searchflag = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        if ((Session["AdminUser_ID"] == null || Session["AdminUser_ID"].ToString().CompareTo("")==0))
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

            if (item.Trim().CompareTo("ViewProducts.aspx") == 0)
                result = true;

        }


        return result;
    }
    protected void ViewProductGrid_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        int index;
        String id;
        if (e.CommandName == "ProductEdit")
        {
            index = Convert.ToInt32(e.CommandArgument);

            HiddenField hiddenid = (HiddenField)ViewProductGrid.Rows[index].FindControl("hdnProductId");

            id = hiddenid.Value.ToString();
            Response.Redirect("UpdateProduct.aspx?productid=" + id );

        }
        else if (e.CommandName == "SupplierEdit")
        {
            index = Convert.ToInt32(e.CommandArgument);

            HiddenField hiddenid = (HiddenField)ViewProductGrid.Rows[index].FindControl("hdnSupplierId");

            id = hiddenid.Value.ToString();
            Response.Redirect("UpdateCustomer.aspx?customerid=" + id);

        }
    }
    #region filling_gridview
    protected void Filling_Gridview()
    {
        try
        {

            if ((Request.QueryString["categoryid"] != null) && searchflag==0)
            {
                sqlParams = new SqlParameter[3];
                sqlParams[0] = new SqlParameter("@flag", "1");
                sqlParams[1] = null;
                sqlParams[2] = new SqlParameter("@categoryid", Request.QueryString["categoryid"]);
            }
            else if ((Request.QueryString["customerid"] != null) && searchflag == 0)
            {
                sqlParams = new SqlParameter[2];
                sqlParams[0] = new SqlParameter("@flag", "5");
                sqlParams[1] = new SqlParameter("@customerid", Request.QueryString["customerid"].ToString());
            }
            else if (searchflag == 0)
            {
                sqlParams = new SqlParameter[1];
                sqlParams[0] = new SqlParameter("@flag", "3");
            }
            else if (searchflag == 7)
            {
                sqlParams = new SqlParameter[2];
                sqlParams[0] = new SqlParameter("@flag", "7");
                sqlParams[1] = new SqlParameter("@searchtext", txtSearch.Text);
            }
            else if (searchflag == 8)
            {
                sqlParams = new SqlParameter[2];
                sqlParams[0] = new SqlParameter("@flag", "8");
                sqlParams[1] = new SqlParameter("@searchtext", txtSearch.Text);
            }
            else if (searchflag == 9)
            {
                sqlParams = new SqlParameter[2];
                sqlParams[0] = new SqlParameter("@flag", "9");
                sqlParams[1] = new SqlParameter("@searchtext", txtSearch.Text);
            }


            datast = new DataSet();
            datast = accessclass.GetDataSet("ViewProducts", CommandType.StoredProcedure, sqlParams);

            if (datast.Tables[0].Rows.Count > 0)
            {

                ViewProductGrid.DataSourceID = null;
                ViewProductGrid.DataSource = datast;
                ViewProductGrid.DataBind();
                Lbl_rc.ForeColor = System.Drawing.Color.Black;
                Lbl_rc.Font.Bold = true;
                Lbl_rc.Text = "<font color='#009933'>Total no of records : " + datast.Tables[0].Rows.Count + "</font>";
                trP1.Visible = true;
                ViewProductGrid.Visible = true;


            }
            else
            {

                ViewProductGrid.DataSourceID = null;
                Lbl_rc.ForeColor = System.Drawing.Color.Black;
                Lbl_rc.Font.Bold = true;
                Lbl_rc.Text = "<font color='#FF0000'>No record in the list.</font>";
                trP1.Visible = false;
                ViewProductGrid.Visible = false;


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

        a = ViewProductGrid.PageIndex + 1;

        Lbl_paging.Text = "You are viewing page <font color='##008000' size='2'>" + a + "</font> of <font color='##008000' size='2'>" + ViewProductGrid.PageCount + "</font>";

        if (ViewProductGrid.PageCount == 1)
        {
            btnfirst.Enabled = false;
            btnlast.Enabled = false;
            btnnext.Enabled = false;
            btnprevious.Enabled = false;
        }


    }
    #endregion
    protected void ViewProductGrid_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        ViewProductGrid.PageIndex = e.NewPageIndex;
        this.Filling_Gridview();
    }
    protected void btnfirst_Click(object sender, ImageClickEventArgs e)
    {

        ViewProductGrid.PageIndex = 0;
        btnfirst.Enabled = false;
        btnprevious.Enabled = false;
        btnlast.Enabled = true;
        btnnext.Enabled = true;


        this.Filling_Gridview();
        this.Filling_Page_Count();

    }

    protected void btnprevious_Click(object sender, ImageClickEventArgs e)
    {
        int i = ViewProductGrid.PageCount;
        if (ViewProductGrid.PageIndex > 0)
        {
            ViewProductGrid.PageIndex = ViewProductGrid.PageIndex - 1;
            btnlast.Enabled = true;
        }
        if (ViewProductGrid.PageIndex == 0)
        {
            btnfirst.Enabled = false;
        }
        if (ViewProductGrid.PageCount - 1 == ViewProductGrid.PageIndex + 1)
        {
            btnnext.Enabled = true;
        }
        if (ViewProductGrid.PageIndex == 0)
        {
            btnprevious.Enabled = false;
        }


        this.Filling_Gridview();
        this.Filling_Page_Count();
    }
    protected void btnnext_Click(object sender, ImageClickEventArgs e)
    {
        int i = ViewProductGrid.PageIndex + 1;
        if (i <= ViewProductGrid.PageCount)
        {
            ViewProductGrid.PageIndex = i;
            btnlast.Enabled = true;
            btnprevious.Enabled = true;
            btnfirst.Enabled = true;
        }
        if (ViewProductGrid.PageCount - 1 == ViewProductGrid.PageIndex)
        {
            btnnext.Enabled = false;
            btnlast.Enabled = false;
        }



        this.Filling_Gridview();
        this.Filling_Page_Count();
    }
    protected void btnlast_Click(object sender, ImageClickEventArgs e)
    {
        ViewProductGrid.PageIndex = ViewProductGrid.PageCount;
        btnlast.Enabled = false;
        btnfirst.Enabled = true;
        btnnext.Enabled = false;
        btnprevious.Enabled = true;

        this.Filling_Gridview();
        this.Filling_Page_Count();
    }



    protected void btnSearch_Click(object sender, ImageClickEventArgs e)
    {
        if(Page.IsValid)
        {
            if (txtSearch.Text != null)
            {
                if (rdlSearchCriteria.Items[0].Selected)
                    searchflag = 7;
                else if (rdlSearchCriteria.Items[1].Selected)
                    searchflag = 8;
                else if (rdlSearchCriteria.Items[2].Selected)
                    searchflag = 9;
                Filling_Gridview();
                btnfirst.Enabled = false;
                btnprevious.Enabled = false;
                this.Filling_Page_Count();
            }
            
        }
    }
}

