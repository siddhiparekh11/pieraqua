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
                if (!Page.IsPostBack)
                {
                    DropDownList1.SelectedIndex = 0;
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

            if (item.Trim().CompareTo("ViewCompanies.aspx") == 0)
                result = true;

        }


        return result;
    }
    protected void ViewCompanyGrid_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        string id;
        if (e.CommandName == "CustomerEdit")
        {
            HiddenField hdncustomerid = new HiddenField();
            hdncustomerid = (HiddenField)ViewCompanyGrid.Rows[Convert.ToInt32(e.CommandArgument)].FindControl("hdnCustomerId");
            id = hdncustomerid.Value.ToString();
            Response.Redirect("UpdateCustomer.aspx?customerid=" + id);
        }  
    }
    protected void ViewCompanyGrid_SelectedIndexChanged(object sender, EventArgs e)
    {
        
        

    }




    protected void btnView_Click(object sender, ImageClickEventArgs e)
    {
        if (Page.IsPostBack)
        {
           

                this.Filling_Gridview();
                btnfirst.Enabled = false;
                btnprevious.Enabled = false;
                this.Filling_Page_Count();
            
        }
    }

    #region filling_gridview
    protected void Filling_Gridview()
    {
        try
        {

            sqlParams = null;
         

            datast = new DataSet();
            datast = accessclass.GetDataSet("select a.CompanyID,a.CustomerID,a.CompanyName,a.IsActive from Companies a,Customers b where a.CustomerID=b.CustomerID and b.CustomerType=" + DropDownList1.SelectedValue, CommandType.Text, sqlParams);

            if (datast.Tables[0].Rows.Count > 0)
            {

                ViewCompanyGrid.DataSourceID = null;
                ViewCompanyGrid.DataSource = datast;
                ViewCompanyGrid.DataBind();
                Lbl_rc.ForeColor = System.Drawing.Color.Black;
                Lbl_rc.Font.Bold = true;
                Lbl_rc.Text = "<font color='#009933'>Total no of records : " + datast.Tables[0].Rows.Count + "</font>";
                trP1.Visible = true;
                ViewCompanyGrid.Visible = true;



            }
            else
            {

                ViewCompanyGrid.DataSourceID = null;
                Lbl_rc.ForeColor = System.Drawing.Color.Black;
                Lbl_rc.Font.Bold = true;
                Lbl_rc.Text = "<font color='#FF0000'>No record in the list.</font>";
                trP1.Visible = false;
                ViewCompanyGrid.Visible = false;


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

        a = ViewCompanyGrid.PageIndex + 1;

        Lbl_paging.Text = "You are viewing page <font color='##008000' size='2'>" + a + "</font> of <font color='##008000' size='2'>" + ViewCompanyGrid.PageCount + "</font>";

        if (ViewCompanyGrid.PageCount == 1)
        {
            btnfirst.Enabled = false;
            btnlast.Enabled = false;
            btnnext.Enabled = false;
            btnprevious.Enabled = false;
        }


    }
    #endregion

    protected void ViewCompanyGrid_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        ViewCompanyGrid.PageIndex = e.NewPageIndex;
        this.Filling_Gridview();
    }
    protected void btnfirst_Click(object sender, ImageClickEventArgs e)
    {

        ViewCompanyGrid.PageIndex = 0;
        btnfirst.Enabled = false;
        btnprevious.Enabled = false;
        btnlast.Enabled = true;
        btnnext.Enabled = true;


        this.Filling_Gridview();
        this.Filling_Page_Count();

    }

    protected void btnprevious_Click(object sender, ImageClickEventArgs e)
    {
        int i = ViewCompanyGrid.PageCount;
        if (ViewCompanyGrid.PageIndex > 0)
        {
            ViewCompanyGrid.PageIndex = ViewCompanyGrid.PageIndex - 1;
            btnlast.Enabled = true;
        }
        if (ViewCompanyGrid.PageIndex == 0)
        {
            btnfirst.Enabled = false;
        }
        if (ViewCompanyGrid.PageCount - 1 == ViewCompanyGrid.PageIndex + 1)
        {
            btnnext.Enabled = true;
        }
        if (ViewCompanyGrid.PageIndex == 0)
        {
            btnprevious.Enabled = false;
        }


        this.Filling_Gridview();
        this.Filling_Page_Count();
    }
    protected void btnnext_Click(object sender, ImageClickEventArgs e)
    {
        int i = ViewCompanyGrid.PageIndex + 1;
        if (i <= ViewCompanyGrid.PageCount)
        {
            ViewCompanyGrid.PageIndex = i;
            btnlast.Enabled = true;
            btnprevious.Enabled = true;
            btnfirst.Enabled = true;
        }
        if (ViewCompanyGrid.PageCount - 1 == ViewCompanyGrid.PageIndex)
        {
            btnnext.Enabled = false;
            btnlast.Enabled = false;
        }



        this.Filling_Gridview();
        this.Filling_Page_Count();
    }
    protected void btnlast_Click(object sender, ImageClickEventArgs e)
    {
        ViewCompanyGrid.PageIndex = ViewCompanyGrid.PageCount;
        btnlast.Enabled = false;
        btnfirst.Enabled = true;
        btnnext.Enabled = false;
        btnprevious.Enabled = true;

        this.Filling_Gridview();
        this.Filling_Page_Count();
    }



    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        this.Filling_Gridview();
        btnfirst.Enabled = false;
        btnprevious.Enabled = false;
        this.Filling_Page_Count();
    }
}
