using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
public partial class cms_ViewTestimonial : System.Web.UI.Page
{
    SqlParameter[] sqlParams;
    DataAccess accessclass = new DataAccess();
    DataSet datast;
    
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

            if (item.Trim().CompareTo("ViewTestimonial.aspx") == 0)
                result = true;

        }


        return result;
    }

    protected void ViewTestimonialGrid_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        string id;
        if (e.CommandName == "TestimonialEdit")
        {
            HiddenField hdncustomerid = new HiddenField();
            hdncustomerid = (HiddenField)ViewTestimonialGrid.Rows[Convert.ToInt32(e.CommandArgument)].FindControl("hdnTestimonialId");
            id = hdncustomerid.Value.ToString();
            Response.Redirect("UpdateTestimonial.aspx?id=" + id);
        }  
    }
    protected void ViewTestimonialGrid_SelectedIndexChanged(object sender, EventArgs e)
    {
        HiddenField hdncustomerid = new HiddenField();
        hdncustomerid = (HiddenField)ViewTestimonialGrid.SelectedRow.FindControl("hdnCustomerId");
        HyperLink hypcustomerid = new HyperLink();
        hypcustomerid = (HyperLink)ViewTestimonialGrid.SelectedRow.FindControl("customernamelink");
        hypcustomerid.NavigateUrl = "UpdateCustomer.aspx?customerid=" + hdncustomerid.Value.ToString();
        

    }




    protected void btnView_Click(object sender, ImageClickEventArgs e)
    {
        if (Page.IsPostBack)
        {
            if ((drpTestimonialType.SelectedValue != null) && (txtStartDate.Text != null && txtEndDate.Text != null))
            {

                this.Filling_Gridview();
                btnfirst.Enabled = false;
                btnprevious.Enabled = false;
                this.Filling_Page_Count();
            }
        }
    }

    #region filling_gridview
    protected void Filling_Gridview()
    {
        try
        {

            sqlParams = new SqlParameter[4];
            sqlParams[0] = new SqlParameter("@flag", "1");
            sqlParams[1] = new SqlParameter("@testimonialtype",drpTestimonialType.SelectedValue.ToString());
            sqlParams[2] = new SqlParameter("@startdate",txtStartDate.Text);
            sqlParams[3] = new SqlParameter("@enddate",txtEndDate.Text);


            datast = new DataSet();
            datast = accessclass.GetDataSet("ViewTestimonials", CommandType.StoredProcedure, sqlParams);

            if (datast.Tables[0].Rows.Count > 0)
            {

                ViewTestimonialGrid.DataSourceID = null;
                ViewTestimonialGrid.DataSource = datast;
                ViewTestimonialGrid.DataBind();
                Lbl_rc.ForeColor = System.Drawing.Color.Black;
                Lbl_rc.Font.Bold = true;
                Lbl_rc.Text = "<font color='#009933'>Total no of records : " + datast.Tables[0].Rows.Count + "</font>";
                trP1.Visible = true;
                ViewTestimonialGrid.Visible = true;



            }
            else
            {

                ViewTestimonialGrid.DataSourceID = null;
                Lbl_rc.ForeColor = System.Drawing.Color.Black;
                Lbl_rc.Font.Bold = true;
                Lbl_rc.Text = "<font color='#FF0000'>No record in the list.</font>";
                trP1.Visible = false;
                ViewTestimonialGrid.Visible = false;


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

        a = ViewTestimonialGrid.PageIndex + 1;

        Lbl_paging.Text = "You are viewing page <font color='##008000' size='2'>" + a + "</font> of <font color='##008000' size='2'>" + ViewTestimonialGrid.PageCount + "</font>";

        if (ViewTestimonialGrid.PageCount == 1)
        {
            btnfirst.Enabled = false;
            btnlast.Enabled = false;
            btnnext.Enabled = false;
            btnprevious.Enabled = false;
        }


    }
    #endregion

    protected void ViewTestimonialGrid_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        ViewTestimonialGrid.PageIndex = e.NewPageIndex;
        this.Filling_Gridview();
    }
    protected void btnfirst_Click(object sender, ImageClickEventArgs e)
    {

        ViewTestimonialGrid.PageIndex = 0;
        btnfirst.Enabled = false;
        btnprevious.Enabled = false;
        btnlast.Enabled = true;
        btnnext.Enabled = true;


        this.Filling_Gridview();
        this.Filling_Page_Count();

    }

    protected void btnprevious_Click(object sender, ImageClickEventArgs e)
    {
        int i = ViewTestimonialGrid.PageCount;
        if (ViewTestimonialGrid.PageIndex > 0)
        {
            ViewTestimonialGrid.PageIndex = ViewTestimonialGrid.PageIndex - 1;
            btnlast.Enabled = true;
        }
        if (ViewTestimonialGrid.PageIndex == 0)
        {
            btnfirst.Enabled = false;
        }
        if (ViewTestimonialGrid.PageCount - 1 == ViewTestimonialGrid.PageIndex + 1)
        {
            btnnext.Enabled = true;
        }
        if (ViewTestimonialGrid.PageIndex == 0)
        {
            btnprevious.Enabled = false;
        }


        this.Filling_Gridview();
        this.Filling_Page_Count();
    }
    protected void btnnext_Click(object sender, ImageClickEventArgs e)
    {
        int i = ViewTestimonialGrid.PageIndex + 1;
        if (i <= ViewTestimonialGrid.PageCount)
        {
            ViewTestimonialGrid.PageIndex = i;
            btnlast.Enabled = true;
            btnprevious.Enabled = true;
            btnfirst.Enabled = true;
        }
        if (ViewTestimonialGrid.PageCount - 1 == ViewTestimonialGrid.PageIndex)
        {
            btnnext.Enabled = false;
            btnlast.Enabled = false;
        }



        this.Filling_Gridview();
        this.Filling_Page_Count();
    }
    protected void btnlast_Click(object sender, ImageClickEventArgs e)
    {
        ViewTestimonialGrid.PageIndex = ViewTestimonialGrid.PageCount;
        btnlast.Enabled = false;
        btnfirst.Enabled = true;
        btnnext.Enabled = false;
        btnprevious.Enabled = true;

        this.Filling_Gridview();
        this.Filling_Page_Count();
    }



}
