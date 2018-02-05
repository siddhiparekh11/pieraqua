using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
public partial class cms_ViewPhotoBankGroups : System.Web.UI.Page
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

            if (item.Trim().CompareTo("ViewPhotoBankGroups.aspx") == 0)
                result = true;

        }


        return result;
    }
    #region filling_gridview
    protected void Filling_Gridview()
    {
        try
        {

            sqlParams = new SqlParameter[3];
            sqlParams[0] = new SqlParameter("@flag", "1");
            sqlParams[1] = new SqlParameter("@customerid", null);
            sqlParams[2] = new SqlParameter("@searchtext", txtcustomername.Text);
           


            datast = new DataSet();
            datast = accessclass.GetDataSet("ViewPhotoBankGroups", CommandType.StoredProcedure, sqlParams);

            if (datast.Tables[0].Rows.Count > 0)
            {

                ViewPhotoBankGroupGrid.DataSourceID = null;
                ViewPhotoBankGroupGrid.DataSource = datast;
                ViewPhotoBankGroupGrid.DataBind();
                Lbl_rc.ForeColor = System.Drawing.Color.Black;
                Lbl_rc.Font.Bold = true;
                Lbl_rc.Text = "<font color='#009933'>Total no of records : " + datast.Tables[0].Rows.Count + "</font>";
                trP1.Visible = true;
                ViewPhotoBankGroupGrid.Visible = true;



            }
            else
            {

                ViewPhotoBankGroupGrid.DataSourceID = null;
                Lbl_rc.ForeColor = System.Drawing.Color.Black;
                Lbl_rc.Font.Bold = true;
                Lbl_rc.Text = "<font color='#FF0000'>No record in the list.</font>";
                trP1.Visible = false;
                ViewPhotoBankGroupGrid.Visible = false;


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

        a = ViewPhotoBankGroupGrid.PageIndex + 1;

        Lbl_paging.Text = "You are viewing page <font color='##008000' size='2'>" + a + "</font> of <font color='##008000' size='2'>" + ViewPhotoBankGroupGrid.PageCount + "</font>";

        if (ViewPhotoBankGroupGrid.PageCount == 1)
        {
            btnfirst.Enabled = false;
            btnlast.Enabled = false;
            btnnext.Enabled = false;
            btnprevious.Enabled = false;
        }


    }
    #endregion
    protected void ViewPhotoBankGroupGrid_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        int index;
        string id;
        if (e.CommandName == "ViewPhotos")
        {
            index = Convert.ToInt32(e.CommandArgument);

            HiddenField hiddenid = (HiddenField)ViewPhotoBankGroupGrid.Rows[index].FindControl("hdnPhotoBankGroupId");

            id = hiddenid.Value.ToString();
            Response.Redirect("ViewPhotoBank.aspx?id=" + id);

        }
    }
    protected void ViewPhotoBankGroupGrid_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        ViewPhotoBankGroupGrid.PageIndex = e.NewPageIndex;
        this.Filling_Gridview();
    }
    protected void btnfirst_Click(object sender, ImageClickEventArgs e)
    {

        ViewPhotoBankGroupGrid.PageIndex = 0;
        btnfirst.Enabled = false;
        btnprevious.Enabled = false;
        btnlast.Enabled = true;
        btnnext.Enabled = true;


        this.Filling_Gridview();
        this.Filling_Page_Count();

    }

    protected void btnprevious_Click(object sender, ImageClickEventArgs e)
    {
        int i = ViewPhotoBankGroupGrid.PageCount;
        if (ViewPhotoBankGroupGrid.PageIndex > 0)
        {
            ViewPhotoBankGroupGrid.PageIndex = ViewPhotoBankGroupGrid.PageIndex - 1;
            btnlast.Enabled = true;
        }
        if (ViewPhotoBankGroupGrid.PageIndex == 0)
        {
            btnfirst.Enabled = false;
        }
        if (ViewPhotoBankGroupGrid.PageCount - 1 == ViewPhotoBankGroupGrid.PageIndex + 1)
        {
            btnnext.Enabled = true;
        }
        if (ViewPhotoBankGroupGrid.PageIndex == 0)
        {
            btnprevious.Enabled = false;
        }


        this.Filling_Gridview();
        this.Filling_Page_Count();
    }
    protected void btnnext_Click(object sender, ImageClickEventArgs e)
    {
        int i = ViewPhotoBankGroupGrid.PageIndex + 1;
        if (i <= ViewPhotoBankGroupGrid.PageCount)
        {
            ViewPhotoBankGroupGrid.PageIndex = i;
            btnlast.Enabled = true;
            btnprevious.Enabled = true;
            btnfirst.Enabled = true;
        }
        if (ViewPhotoBankGroupGrid.PageCount - 1 == ViewPhotoBankGroupGrid.PageIndex)
        {
            btnnext.Enabled = false;
            btnlast.Enabled = false;
        }



        this.Filling_Gridview();
        this.Filling_Page_Count();
    }
    protected void btnlast_Click(object sender, ImageClickEventArgs e)
    {
        ViewPhotoBankGroupGrid.PageIndex = ViewPhotoBankGroupGrid.PageCount;
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
            this.Filling_Gridview();
            btnfirst.Enabled = false;
            btnprevious.Enabled = false;
            this.Filling_Page_Count();

        }
    }
}
