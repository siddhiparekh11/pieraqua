using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
public partial class cms_ViewProductAttributes : System.Web.UI.Page
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

            if (item.Trim().CompareTo("ViewProductAttributes.aspx") == 0)
                result = true;

        }


        return result;
    }

    protected void ViewProductAttributeGrid_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        CheckBox ck=new CheckBox();
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            ck =(CheckBox) e.Row.FindControl("chkisactive");
            ck.Checked=Convert.ToBoolean(datast.Tables[0].Rows[e.Row.RowIndex].ItemArray[5].ToString());
        }

    }

    #region filling_gridview
    protected void Filling_Gridview()
    {
        try
        {

            sqlParams = new SqlParameter[1];
            sqlParams[0] = new SqlParameter("@productid",Request.QueryString["productid"]);
          


            datast = new DataSet();
            datast = accessclass.GetDataSet("GetProductAttributes", CommandType.StoredProcedure, sqlParams);

            if (datast.Tables[0].Rows.Count > 0)
            {

                ViewProductAttributeGrid.DataSourceID = null;
                ViewProductAttributeGrid.DataSource = datast;
                ViewProductAttributeGrid.DataBind();
                Lbl_rc.ForeColor = System.Drawing.Color.Black;
                Lbl_rc.Font.Bold = true;
                Lbl_rc.Text = "<font color='#009933'>Total no of records : " + datast.Tables[0].Rows.Count + "</font>";
                trP1.Visible = true;
                ViewProductAttributeGrid.Visible = true;


            }
            else
            {

                ViewProductAttributeGrid.DataSourceID = null;
                Lbl_rc.ForeColor = System.Drawing.Color.Black;
                Lbl_rc.Font.Bold = true;
                Lbl_rc.Text = "<font color='#FF0000'>No record in the list.</font>";
                trP1.Visible = false;
                ViewProductAttributeGrid.Visible = false;


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

        a = ViewProductAttributeGrid.PageIndex + 1;

        Lbl_paging.Text = "You are viewing page <font color='##008000' size='2'>" + a + "</font> of <font color='##008000' size='2'>" + ViewProductAttributeGrid.PageCount + "</font>";

        if (ViewProductAttributeGrid.PageCount == 1)
        {
            btnfirst.Enabled = false;
            btnlast.Enabled = false;
            btnnext.Enabled = false;
            btnprevious.Enabled = false;
        }


    }
    #endregion
   
    protected void ViewProductAttributeGrid_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        ViewProductAttributeGrid.PageIndex = e.NewPageIndex;
        this.Filling_Gridview();
    }
    protected void btnfirst_Click(object sender, ImageClickEventArgs e)
    {

        ViewProductAttributeGrid.PageIndex = 0;
        btnfirst.Enabled = false;
        btnprevious.Enabled = false;
        btnlast.Enabled = true;
        btnnext.Enabled = true;


        this.Filling_Gridview();
        this.Filling_Page_Count();

    }

    protected void btnprevious_Click(object sender, ImageClickEventArgs e)
    {
        int i = ViewProductAttributeGrid.PageCount;
        if (ViewProductAttributeGrid.PageIndex > 0)
        {
            ViewProductAttributeGrid.PageIndex = ViewProductAttributeGrid.PageIndex - 1;
            btnlast.Enabled = true;
        }
        if (ViewProductAttributeGrid.PageIndex == 0)
        {
            btnfirst.Enabled = false;
        }
        if (ViewProductAttributeGrid.PageCount - 1 == ViewProductAttributeGrid.PageIndex + 1)
        {
            btnnext.Enabled = true;
        }
        if (ViewProductAttributeGrid.PageIndex == 0)
        {
            btnprevious.Enabled = false;
        }


        this.Filling_Gridview();
        this.Filling_Page_Count();
    }
    protected void btnnext_Click(object sender, ImageClickEventArgs e)
    {
        int i = ViewProductAttributeGrid.PageIndex + 1;
        if (i <= ViewProductAttributeGrid.PageCount)
        {
            ViewProductAttributeGrid.PageIndex = i;
            btnlast.Enabled = true;
            btnprevious.Enabled = true;
            btnfirst.Enabled = true;
        }
        if (ViewProductAttributeGrid.PageCount - 1 == ViewProductAttributeGrid.PageIndex)
        {
            btnnext.Enabled = false;
            btnlast.Enabled = false;
        }



        this.Filling_Gridview();
        this.Filling_Page_Count();
    }
    protected void btnlast_Click(object sender, ImageClickEventArgs e)
    {
        ViewProductAttributeGrid.PageIndex = ViewProductAttributeGrid.PageCount;
        btnlast.Enabled = false;
        btnfirst.Enabled = true;
        btnnext.Enabled = false;
        btnprevious.Enabled = true;

        this.Filling_Gridview();
        this.Filling_Page_Count();
    }

   
    protected void chkSelectall_CheckedChanged(object sender, EventArgs e)
    {
        CheckBox ck=new CheckBox();
        if (chkSelectall.Checked)
        {
            if (ViewProductAttributeGrid.Rows.Count > 0)
            {
                foreach (GridViewRow dr in ViewProductAttributeGrid.Rows)
                {
                    ck=(CheckBox)(dr.Cells[4].FindControl("chkisactive"));
                    
                    ck.Checked = true;
                }
            }
        }
    }
    protected void btnUpdate_Click(object sender, ImageClickEventArgs e)
    {
        CheckBox ck=new CheckBox();
        HiddenField hd=new HiddenField();
        String temp;
        sqlParams = null;

        if (ViewProductAttributeGrid.Rows.Count > 0)
        {
            foreach (GridViewRow dr in ViewProductAttributeGrid.Rows)
            {
                ck =(CheckBox) dr.Cells[4].FindControl("chkisactive");
                hd=(HiddenField)dr.Cells[0].FindControl("hdnAttributeID");
                if (ck.Checked)
                {
                    temp = "1";
                }
                else
                {
                    temp = "0";
                }
                accessclass.ExecuteNonQuery("update ProductAttributes set IsActive=" + temp  + " where AttributeID=" + hd.Value.ToString(), CommandType.Text, sqlParams);
                
            }
        }

    }
    protected void btnBack_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("UpdateProduct.aspx?productid=" + Request.QueryString["productid"]);
    }
}
