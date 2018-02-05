using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class cms_ViewPhotoBank : System.Web.UI.Page
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

            if (item.Trim().CompareTo("ViewPhotoBank.aspx") == 0)
                result = true;

        }


        return result;
    }
    protected void ViewPhotoBankGrid_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        CheckBox ck = new CheckBox();
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            ck = (CheckBox)e.Row.FindControl("chkisactive");
            ck.Checked = Convert.ToBoolean(datast.Tables[0].Rows[e.Row.RowIndex].ItemArray[2].ToString());
        }

    }


    #region filling_gridview
    protected void Filling_Gridview()
    {
        try
        {

            sqlParams = new SqlParameter[2];
            sqlParams[0] = new SqlParameter("@flag", "1");
            sqlParams[1] = new SqlParameter("@photobankgroupid", Request.QueryString["id"]);


            datast = new DataSet();
            datast = accessclass.GetDataSet("ViewPhotoBankDetail", CommandType.StoredProcedure, sqlParams);

            if (datast.Tables[0].Rows.Count > 0)
            {

                ViewPhotoBankGrid.DataSourceID = null;
                ViewPhotoBankGrid.DataSource = datast;
                ViewPhotoBankGrid.DataBind();
                Lbl_rc.ForeColor = System.Drawing.Color.Black;
                Lbl_rc.Font.Bold = true;
                Lbl_rc.Text = "<font color='#009933'>Total no of records : " + datast.Tables[0].Rows.Count + "</font>";
                trP1.Visible = true;
                ViewPhotoBankGrid.Visible = true;



            }
            else
            {

                ViewPhotoBankGrid.DataSourceID = null;
                Lbl_rc.ForeColor = System.Drawing.Color.Black;
                Lbl_rc.Font.Bold = true;
                Lbl_rc.Text = "<font color='#FF0000'>No record in the list.</font>";
                trP1.Visible = false;
                ViewPhotoBankGrid.Visible = false;


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

        a = ViewPhotoBankGrid.PageIndex + 1;

        Lbl_paging.Text = "You are viewing page <font color='##008000' size='2'>" + a + "</font> of <font color='##008000' size='2'>" + ViewPhotoBankGrid.PageCount + "</font>";

        if (ViewPhotoBankGrid.PageCount == 1)
        {
            btnfirst.Enabled = false;
            btnlast.Enabled = false;
            btnnext.Enabled = false;
            btnprevious.Enabled = false;
        }


    }
    #endregion
    protected void ViewPhotoBankGrid_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        int index;
        string id;
        if (e.CommandName == "ViewPhoto")
        {
            index = Convert.ToInt32(e.CommandArgument);

            HiddenField hiddenid = (HiddenField)ViewPhotoBankGrid.Rows[index].FindControl("hdnPhotoBankId");
            
            id = hiddenid.Value.ToString();
            Response.Write("<script> window.open('" + ViewPhotoBankGrid.SelectedRow.Cells[2].Text.ToString()  + "'); </script>");
            Response.End();
  

        }
    }
    protected void ViewPhotoBankGrid_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        ViewPhotoBankGrid.PageIndex = e.NewPageIndex;
        this.Filling_Gridview();
    }
    protected void btnfirst_Click(object sender, ImageClickEventArgs e)
    {

        ViewPhotoBankGrid.PageIndex = 0;
        btnfirst.Enabled = false;
        btnprevious.Enabled = false;
        btnlast.Enabled = true;
        btnnext.Enabled = true;


        this.Filling_Gridview();
        this.Filling_Page_Count();

    }

    protected void btnprevious_Click(object sender, ImageClickEventArgs e)
    {
        int i = ViewPhotoBankGrid.PageCount;
        if (ViewPhotoBankGrid.PageIndex > 0)
        {
            ViewPhotoBankGrid.PageIndex = ViewPhotoBankGrid.PageIndex - 1;
            btnlast.Enabled = true;
        }
        if (ViewPhotoBankGrid.PageIndex == 0)
        {
            btnfirst.Enabled = false;
        }
        if (ViewPhotoBankGrid.PageCount - 1 == ViewPhotoBankGrid.PageIndex + 1)
        {
            btnnext.Enabled = true;
        }
        if (ViewPhotoBankGrid.PageIndex == 0)
        {
            btnprevious.Enabled = false;
        }


        this.Filling_Gridview();
        this.Filling_Page_Count();
    }
    protected void btnnext_Click(object sender, ImageClickEventArgs e)
    {
        int i = ViewPhotoBankGrid.PageIndex + 1;
        if (i <= ViewPhotoBankGrid.PageCount)
        {
            ViewPhotoBankGrid.PageIndex = i;
            btnlast.Enabled = true;
            btnprevious.Enabled = true;
            btnfirst.Enabled = true;
        }
        if (ViewPhotoBankGrid.PageCount - 1 == ViewPhotoBankGrid.PageIndex)
        {
            btnnext.Enabled = false;
            btnlast.Enabled = false;
        }



        this.Filling_Gridview();
        this.Filling_Page_Count();
    }
    protected void btnlast_Click(object sender, ImageClickEventArgs e)
    {
        ViewPhotoBankGrid.PageIndex = ViewPhotoBankGrid.PageCount;
        btnlast.Enabled = false;
        btnfirst.Enabled = true;
        btnnext.Enabled = false;
        btnprevious.Enabled = true;

        this.Filling_Gridview();
        this.Filling_Page_Count();
    }
    
    protected void btnUpdate_Click(object sender, ImageClickEventArgs e)
    {
        CheckBox ck = new CheckBox();
        HiddenField hd = new HiddenField();
        String temp;
        sqlParams = null;
        
        if (ViewPhotoBankGrid.Rows.Count > 0)
        {
            foreach (GridViewRow dr in ViewPhotoBankGrid.Rows)
            {
                ck = (CheckBox)dr.Cells[4].FindControl("chkisactive");
                hd = (HiddenField)dr.Cells[0].FindControl("hdnPhotoBankId");
                if (ck.Checked)
                {
                    temp = "1";
                }
                else
                {
                    temp = "0";
                }
                accessclass.ExecuteNonQuery("update PhotoBankDetail set IsActive=" + temp + " where PhotoBankID=" + hd.Value.ToString(), CommandType.Text, sqlParams);
                
            }
            
        }

    }
    protected void chkselectall_CheckedChanged(object sender, EventArgs e)
    {
        CheckBox ck = new CheckBox();
        if (chkselectall.Checked)
        {
            if (ViewPhotoBankGrid.Rows.Count > 0)
            {
                foreach (GridViewRow dr in ViewPhotoBankGrid.Rows)
                {
                    ck = (CheckBox)(dr.Cells[4].FindControl("chkisactive"));

                    ck.Checked = true;
                }
            }
        }

    }
    protected void btnBack_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("ViewPhotoBankGroups.aspx");
    }
}
