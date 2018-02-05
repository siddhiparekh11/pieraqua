using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
public partial class cms_ViewFAQs : System.Web.UI.Page
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

            if (item.Trim().CompareTo("ViewFAQs.aspx") == 0)
                result = true;

        }


        return result;
    }
    #region filling_gridview
    protected void Filling_Gridview()
    {
        try
        {

            if (DropDownList1.SelectedValue != null)
            {
                sqlParams = new SqlParameter[2];
                if (DropDownList1.SelectedValue != "2")
                {
                    sqlParams[0] = new SqlParameter("@flag", "1");
                }
                else
                {
                    sqlParams[0] = new SqlParameter("@flag", "3");
                }
                sqlParams[1] = new SqlParameter("@faqtype", DropDownList1.SelectedValue.ToString());
                datast = new DataSet();
                datast = accessclass.GetDataSet("ViewFAQ", CommandType.StoredProcedure, sqlParams);

                if (datast.Tables[0].Rows.Count > 0)
                {

                    ViewFAQsGrid.DataSourceID = null;
                    ViewFAQsGrid.DataSource = datast;
                    ViewFAQsGrid.DataBind();
                    Lbl_rc.ForeColor = System.Drawing.Color.Black;
                    Lbl_rc.Font.Bold = true;
                    Lbl_rc.Text = "<font color='#009933'>Total no of records : " + datast.Tables[0].Rows.Count + "</font>";
                    trP1.Visible = true;
                    ViewFAQsGrid.Visible = true;

                }
                else
                {

                    ViewFAQsGrid.DataSourceID = null;
                    Lbl_rc.ForeColor = System.Drawing.Color.Black;
                    Lbl_rc.Font.Bold = true;
                    Lbl_rc.Text = "<font color='#FF0000'>No record in the list.</font>";
                    trP1.Visible = false;
                    ViewFAQsGrid.Visible = false;
                }

            }
            else
            {
                ViewFAQsGrid.Visible = false;
                lblmsg.Text = "Select a FAQ Type";
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

        a = ViewFAQsGrid.PageIndex + 1;

        Lbl_paging.Text = "You are viewing page <font color='##008000' size='2'>" + a + "</font> of <font color='##008000' size='2'>" + ViewFAQsGrid.PageCount + "</font>";

        if (ViewFAQsGrid.PageCount == 1)
        {
            btnfirst.Enabled = false;
            btnlast.Enabled = false;
            btnnext.Enabled = false;
            btnprevious.Enabled = false;
        }


    }
    #endregion
    protected void ViewFAQsGrid_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        int index;
        string id;
        if (e.CommandName == "FAQEdit")
        {
            index = Convert.ToInt32(e.CommandArgument);

            HiddenField hiddenid = (HiddenField)ViewFAQsGrid.Rows[index].FindControl("hdnFAQId");

            id = hiddenid.Value.ToString();
            Response.Redirect("UpdateFAQ.aspx?faqid=" + id);

        }
    }
    protected void ViewFAQsGrid_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        ViewFAQsGrid.PageIndex = e.NewPageIndex;
        this.Filling_Gridview();
    }
    protected void btnfirst_Click(object sender, ImageClickEventArgs e)
    {

        ViewFAQsGrid.PageIndex = 0;
        btnfirst.Enabled = false;
        btnprevious.Enabled = false;
        btnlast.Enabled = true;
        btnnext.Enabled = true;


        this.Filling_Gridview();
        this.Filling_Page_Count();

    }

    protected void btnprevious_Click(object sender, ImageClickEventArgs e)
    {
        int i = ViewFAQsGrid.PageCount;
        if (ViewFAQsGrid.PageIndex > 0)
        {
            ViewFAQsGrid.PageIndex = ViewFAQsGrid.PageIndex - 1;
            btnlast.Enabled = true;
        }
        if (ViewFAQsGrid.PageIndex == 0)
        {
            btnfirst.Enabled = false;
        }
        if (ViewFAQsGrid.PageCount - 1 == ViewFAQsGrid.PageIndex + 1)
        {
            btnnext.Enabled = true;
        }
        if (ViewFAQsGrid.PageIndex == 0)
        {
            btnprevious.Enabled = false;
        }


        this.Filling_Gridview();
        this.Filling_Page_Count();
    }
    protected void btnnext_Click(object sender, ImageClickEventArgs e)
    {
        int i = ViewFAQsGrid.PageIndex + 1;
        if (i <= ViewFAQsGrid.PageCount)
        {
            ViewFAQsGrid.PageIndex = i;
            btnlast.Enabled = true;
            btnprevious.Enabled = true;
            btnfirst.Enabled = true;
        }
        if (ViewFAQsGrid.PageCount - 1 == ViewFAQsGrid.PageIndex)
        {
            btnnext.Enabled = false;
            btnlast.Enabled = false;
        }



        this.Filling_Gridview();
        this.Filling_Page_Count();
    }
    protected void btnlast_Click(object sender, ImageClickEventArgs e)
    {
        ViewFAQsGrid.PageIndex = ViewFAQsGrid.PageCount;
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
