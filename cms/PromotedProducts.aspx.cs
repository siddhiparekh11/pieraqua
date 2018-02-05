using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
public partial class cms_PromotedProducts : System.Web.UI.Page
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

            if (item.Trim().CompareTo("PromotedProducts.aspx") == 0)
                result = true;

        }


        return result;
    }
    protected void ViewPromotedGrid_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        CheckBox ck = new CheckBox();
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            ck = (CheckBox)e.Row.FindControl("chkisactive");

            ck.Checked = Convert.ToBoolean(datast.Tables[0].Rows[e.Row.RowIndex].ItemArray[8].ToString());
            
        }
    }

    protected void ViewPromotedGrid_SelectedIndexChanged(object sender, EventArgs e)
    {
        HiddenField hdncustomerid = new HiddenField();
        hdncustomerid = (HiddenField)ViewPromotedGrid.SelectedRow.FindControl("hdnCustomerId");
        HyperLink hypcustomerid = new HyperLink();
        hypcustomerid = (HyperLink)ViewPromotedGrid.SelectedRow.FindControl("customernamelink");
        hypcustomerid.NavigateUrl = "UpdateCustomer.aspx?customerid=" + hdncustomerid.Value.ToString();
        HiddenField hdnproductid = new HiddenField();
        hdnproductid = (HiddenField)ViewPromotedGrid.SelectedRow.FindControl("hdnProductId");
        HyperLink hypproductid = new HyperLink();
        hypcustomerid = (HyperLink)ViewPromotedGrid.SelectedRow.FindControl("productnamelink");
        hypcustomerid.NavigateUrl = "UpdateProduct.aspx?productid=" + hdnproductid.Value.ToString();

    }




    protected void btnViewProducts_Click(object sender, ImageClickEventArgs e)
    {
        if (Page.IsPostBack)
        {
            if ((DropDownList1.SelectedValue != null) && (txtStartDate.Text != null) && (txtEndDate.Text!=null) )
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
            sqlParams[1] = new SqlParameter("@categoryid",DropDownList1.SelectedValue.ToString());
            sqlParams[2] =new SqlParameter("@fromdate",Convert.ToDateTime(txtStartDate.Text));
            sqlParams[3] = new SqlParameter("@todate", Convert.ToDateTime(txtEndDate.Text));


            datast = new DataSet();
            datast = accessclass.GetDataSet("ViewPromotions", CommandType.StoredProcedure, sqlParams);

            if (datast.Tables[0].Rows.Count > 0)
            {

                ViewPromotedGrid.DataSourceID = null;
                ViewPromotedGrid.DataSource = datast;
                ViewPromotedGrid.DataBind();
                Lbl_rc.ForeColor = System.Drawing.Color.Black;
                Lbl_rc.Font.Bold = true;
                Lbl_rc.Text = "<font color='#009933'>Total no of records : " + datast.Tables[0].Rows.Count + "</font>";
                trP1.Visible = true;
                ViewPromotedGrid.Visible = true;



            }
            else
            {

                ViewPromotedGrid.DataSourceID = null;
                Lbl_rc.ForeColor = System.Drawing.Color.Black;
                Lbl_rc.Font.Bold = true;
                Lbl_rc.Text = "<font color='#FF0000'>No record in the list.</font>";
                trP1.Visible = false;
                ViewPromotedGrid.Visible = false;


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

        a = ViewPromotedGrid.PageIndex + 1;

        Lbl_paging.Text = "You are viewing page <font color='##008000' size='2'>" + a + "</font> of <font color='##008000' size='2'>" + ViewPromotedGrid.PageCount + "</font>";

        if (ViewPromotedGrid.PageCount == 1)
        {
            btnfirst.Enabled = false;
            btnlast.Enabled = false;
            btnnext.Enabled = false;
            btnprevious.Enabled = false;
        }


    }
    #endregion
    
    protected void ViewPromotedGrid_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        ViewPromotedGrid.PageIndex = e.NewPageIndex;
        this.Filling_Gridview();
    }
    protected void btnfirst_Click(object sender, ImageClickEventArgs e)
    {

        ViewPromotedGrid.PageIndex = 0;
        btnfirst.Enabled = false;
        btnprevious.Enabled = false;
        btnlast.Enabled = true;
        btnnext.Enabled = true;


        this.Filling_Gridview();
        this.Filling_Page_Count();

    }

    protected void btnprevious_Click(object sender, ImageClickEventArgs e)
    {
        int i = ViewPromotedGrid.PageCount;
        if (ViewPromotedGrid.PageIndex > 0)
        {
            ViewPromotedGrid.PageIndex = ViewPromotedGrid.PageIndex - 1;
            btnlast.Enabled = true;
        }
        if (ViewPromotedGrid.PageIndex == 0)
        {
            btnfirst.Enabled = false;
        }
        if (ViewPromotedGrid.PageCount - 1 == ViewPromotedGrid.PageIndex + 1)
        {
            btnnext.Enabled = true;
        }
        if (ViewPromotedGrid.PageIndex == 0)
        {
            btnprevious.Enabled = false;
        }


        this.Filling_Gridview();
        this.Filling_Page_Count();
    }
    protected void btnnext_Click(object sender, ImageClickEventArgs e)
    {
        int i = ViewPromotedGrid.PageIndex + 1;
        if (i <= ViewPromotedGrid.PageCount)
        {
            ViewPromotedGrid.PageIndex = i;
            btnlast.Enabled = true;
            btnprevious.Enabled = true;
            btnfirst.Enabled = true;
        }
        if (ViewPromotedGrid.PageCount - 1 == ViewPromotedGrid.PageIndex)
        {
            btnnext.Enabled = false;
            btnlast.Enabled = false;
        }



        this.Filling_Gridview();
        this.Filling_Page_Count();
    }
    protected void btnlast_Click(object sender, ImageClickEventArgs e)
    {
        ViewPromotedGrid.PageIndex = ViewPromotedGrid.PageCount;
        btnlast.Enabled = false;
        btnfirst.Enabled = true;
        btnnext.Enabled = false;
        btnprevious.Enabled = true;

        this.Filling_Gridview();
        this.Filling_Page_Count();
    }
    protected void chkselectall_CheckedChanged(object sender, EventArgs e)
    {

        CheckBox ck = new CheckBox();
        if (chkselectall.Checked)
        {
            if (ViewPromotedGrid.Rows.Count > 0)
            {
                foreach (GridViewRow dr in ViewPromotedGrid.Rows)
                {
                    ck = (CheckBox)(dr.Cells[4].FindControl("chkisactive"));

                    ck.Checked = true;
                }
            }
        }
    }
    protected void btnUpdate_Click(object sender, ImageClickEventArgs e)
    {
        CheckBox ck = new CheckBox();
        HiddenField tempromotedid = new HiddenField();
        string temp;
        sqlParams = new SqlParameter[3];
        sqlParams[0] = new SqlParameter("@flag", 1);
        foreach (GridViewRow dr in ViewPromotedGrid.Rows)
        {
            ck = (CheckBox)dr.Cells[8].FindControl("chkisactive");
            if(ck.Checked)
            {
                    temp="1";
            }
            else
            {
                temp="0";
            }
            tempromotedid =(HiddenField) dr.Cells[2].FindControl("hdnPromotionId");
            sqlParams[1] = new SqlParameter("@promotedid", tempromotedid.Value.ToString());
            sqlParams[2] = new SqlParameter("@isactive",Convert.ToInt32(temp));
            accessclass.ExecuteNonQuery("UpdatePromotions", CommandType.StoredProcedure, sqlParams);
        }
        this.Filling_Gridview();
        this.Filling_Page_Count();
    }
}
