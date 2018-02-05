using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
public partial class cms_ViewCustomers : System.Web.UI.Page
{
    SqlParameter[] sqlParams;
    DataAccess accessclass = new DataAccess();
    DataSet datast;
    int searchflag = 0;
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

            if (item.Trim().CompareTo("ViewCustomers.aspx") == 0)
                result = true;

        }


        return result;
    }
    protected void ViewCustomerGrid_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        int index= Convert.ToInt32(e.CommandArgument); 
        String id,type;
        HiddenField hiddentype = (HiddenField)ViewCustomerGrid.Rows[index].FindControl("hdnCustomerType");

        type= hiddentype.Value.ToString();
        
        if (e.CommandName == "CustomerEdit")
        {
            index = Convert.ToInt32(e.CommandArgument);

            HiddenField hiddenid = (HiddenField)ViewCustomerGrid.Rows[index].FindControl("hdnCustomerId");

            id = hiddenid.Value.ToString();
            Response.Redirect("UpdateCustomer.aspx?customerid=" + id);

        }
        else if (e.CommandName == "SupplierProducts")
        {
            if ((type.CompareTo("0") == 0) || (type.CompareTo("2") == 0))
            {
                index = Convert.ToInt32(e.CommandArgument);

                HiddenField hiddenid = (HiddenField)ViewCustomerGrid.Rows[index].FindControl("hdnCustomerId");

                id = hiddenid.Value.ToString();
                Response.Redirect("ViewProducts.aspx?customerid=" + id);
            }
            else
            {
                string alertmsg = "<script type='text/javascript'> alert('Sorry the Customer is Buyer');</script>";
                ClientScript.RegisterClientScriptBlock(GetType(),"alert", alertmsg);
            }


        }
        else if (e.CommandName == "BuyingLeads")
        {
            if ((type.CompareTo("1") == 0) || (type.CompareTo("2") == 0))
            {

                index = Convert.ToInt32(e.CommandArgument);

                HiddenField hiddenid = (HiddenField)ViewCustomerGrid.Rows[index].FindControl("hdnCustomerId");

                id = hiddenid.Value.ToString();
                Response.Redirect("ViewBuyingLead.aspx?customerid=" + id);
            }
            else
            {
                string alertmsg = "<script type='text/javascript'> alert('Sorry the Customer is Seller');</script>";
                ClientScript.RegisterClientScriptBlock(GetType(),"alert", alertmsg);
            }

        }
    }
    #region filling_gridview
    protected void Filling_Gridview()
    {
        try
        {

            if (searchflag == 0)
            {
                sqlParams = new SqlParameter[2];
                sqlParams[0] = new SqlParameter("@flag", "1");
                sqlParams[1] = null;
            }
            else if (searchflag == 1)
            {
                sqlParams = new SqlParameter[2];
                sqlParams[0] = new SqlParameter("@flag", "2");
                sqlParams[1] = new SqlParameter("@searchtext",txtSearch.Text);
            }
            else if (searchflag == 2)
            {
                sqlParams = new SqlParameter[2];
                sqlParams[0] = new SqlParameter("@flag", "3");
                sqlParams[1] = new SqlParameter("@searchtext", txtSearch.Text); ;
            }
            else if (searchflag == 3)
            {
                sqlParams = new SqlParameter[2];
                sqlParams[0] = new SqlParameter("@flag", "4");
                sqlParams[1] = new SqlParameter("@searchtext",txtSearch.Text);
            }

            datast = new DataSet();
            datast = accessclass.GetDataSet("ViewCustomers", CommandType.StoredProcedure, sqlParams);

            if (datast.Tables[0].Rows.Count > 0)
            {

                ViewCustomerGrid.DataSourceID = null;
                ViewCustomerGrid.DataSource = datast;
                ViewCustomerGrid.DataBind();
                Lbl_rc.ForeColor = System.Drawing.Color.Black;
                Lbl_rc.Font.Bold = true;
                Lbl_rc.Text = "<font color='#009933'>Total no of records : " + datast.Tables[0].Rows.Count + "</font>";
                trP1.Visible = true;
                ViewCustomerGrid.Visible = true;


            }
            else
            {

                ViewCustomerGrid.DataSourceID = null;
                Lbl_rc.ForeColor = System.Drawing.Color.Black;
                Lbl_rc.Font.Bold = true;
                Lbl_rc.Text = "<font color='#FF0000'>No record in the list.</font>";
                trP1.Visible = false;
                ViewCustomerGrid.Visible = false;


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

        a = ViewCustomerGrid.PageIndex + 1;

        Lbl_paging.Text = "You are viewing page <font color='##008000' size='2'>" + a + "</font> of <font color='##008000' size='2'>" + ViewCustomerGrid.PageCount + "</font>";

        if (ViewCustomerGrid.PageCount == 1)
        {
            btnfirst.Enabled = false;
            btnlast.Enabled = false;
            btnnext.Enabled = false;
            btnprevious.Enabled = false;
        }


    }
    #endregion
    protected void ViewCustomerGrid_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        ViewCustomerGrid.PageIndex = e.NewPageIndex;
        this.Filling_Gridview();
    }
    protected void btnfirst_Click(object sender, ImageClickEventArgs e)
    {

        ViewCustomerGrid.PageIndex = 0;
        btnfirst.Enabled = false;
        btnprevious.Enabled = false;
        btnlast.Enabled = true;
        btnnext.Enabled = true;


        this.Filling_Gridview();
        this.Filling_Page_Count();

    }

    protected void btnprevious_Click(object sender, ImageClickEventArgs e)
    {
        int i = ViewCustomerGrid.PageCount;
        if (ViewCustomerGrid.PageIndex > 0)
        {
            ViewCustomerGrid.PageIndex = ViewCustomerGrid.PageIndex - 1;
            btnlast.Enabled = true;
        }
        if (ViewCustomerGrid.PageIndex == 0)
        {
            btnfirst.Enabled = false;
        }
        if (ViewCustomerGrid.PageCount - 1 == ViewCustomerGrid.PageIndex + 1)
        {
            btnnext.Enabled = true;
        }
        if (ViewCustomerGrid.PageIndex == 0)
        {
            btnprevious.Enabled = false;
        }


        this.Filling_Gridview();
        this.Filling_Page_Count();
    }
    protected void btnnext_Click(object sender, ImageClickEventArgs e)
    {
        int i = ViewCustomerGrid.PageIndex + 1;
        if (i <= ViewCustomerGrid.PageCount)
        {
            ViewCustomerGrid.PageIndex = i;
            btnlast.Enabled = true;
            btnprevious.Enabled = true;
            btnfirst.Enabled = true;
        }
        if (ViewCustomerGrid.PageCount - 1 == ViewCustomerGrid.PageIndex)
        {
            btnnext.Enabled = false;
            btnlast.Enabled = false;
        }



        this.Filling_Gridview();
        this.Filling_Page_Count();
    }
    protected void btnlast_Click(object sender, ImageClickEventArgs e)
    {
        ViewCustomerGrid.PageIndex = ViewCustomerGrid.PageCount;
        btnlast.Enabled = false;
        btnfirst.Enabled = true;
        btnnext.Enabled = false;
        btnprevious.Enabled = true;

        this.Filling_Gridview();
        this.Filling_Page_Count();
    }



    protected void btnSearch_Click(object sender, ImageClickEventArgs e)
    {
        if (Page.IsPostBack)
        {
            if (rdlSearchCriteria.Items[0].Selected)
            {
                searchflag = 1;
            }
            else if(rdlSearchCriteria.Items[1].Selected)
            {
                searchflag = 2;
            }
            else if (rdlSearchCriteria.Items[2].Selected)
            {
                searchflag = 3;
            }
            this.Filling_Gridview();
            btnfirst.Enabled = false;
            btnprevious.Enabled = false;
            this.Filling_Page_Count();
        }
    }
}
