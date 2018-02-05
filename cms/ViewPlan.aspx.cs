using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class cms_ViewPlan : System.Web.UI.Page
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

            if (item.Trim().CompareTo("ViewPlan.aspx") == 0)
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
            sqlParams[1] = null;
            sqlParams[2] = null;
           
            
            datast = new DataSet();
            datast = accessclass.GetDataSet("ViewPlan", CommandType.StoredProcedure, sqlParams);

            if (datast.Tables[0].Rows.Count > 0)
            {

                ViewPlanGrid.DataSourceID = null;
                ViewPlanGrid.DataSource = datast;
                ViewPlanGrid.DataBind();
                Lbl_rc.ForeColor = System.Drawing.Color.Black;
                Lbl_rc.Font.Bold = true;
                Lbl_rc.Text = "<font color='#009933'>Total no of records : " + datast.Tables[0].Rows.Count + "</font>";
                trP1.Visible = true;
                ViewPlanGrid.Visible = true;
               
               

            }
            else
            {

                ViewPlanGrid.DataSourceID = null;
                Lbl_rc.ForeColor = System.Drawing.Color.Black;
                Lbl_rc.Font.Bold = true;
                Lbl_rc.Text = "<font color='#FF0000'>No record in the list.</font>";
                trP1.Visible = false;
                ViewPlanGrid.Visible = false;


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

        a = ViewPlanGrid.PageIndex + 1;

        Lbl_paging.Text = "You are viewing page <font color='##008000' size='2'>" + a + "</font> of <font color='##008000' size='2'>" + ViewPlanGrid.PageCount + "</font>";

        if (ViewPlanGrid.PageCount == 1)
        {
            btnfirst.Enabled = false;
            btnlast.Enabled = false;
            btnnext.Enabled = false;
            btnprevious.Enabled = false;
        }


    }
#endregion
    protected void ViewPlanGrid_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        int index;
        string id;
        if (e.CommandName == "PlanEdit")
        {
            index = Convert.ToInt32(e.CommandArgument);

           HiddenField hiddenid = (HiddenField)ViewPlanGrid.Rows[index].FindControl("hdnPlanId");

          id = hiddenid.Value.ToString();
            Response.Redirect("UpdatePlan.aspx?id=" + id );

        }
    }
    protected void ViewPlanGrid_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        ViewPlanGrid.PageIndex = e.NewPageIndex;
        this.Filling_Gridview();
    }
    protected void btnfirst_Click(object sender, ImageClickEventArgs e)
    {
         
        ViewPlanGrid.PageIndex = 0;
        btnfirst.Enabled = false;
        btnprevious.Enabled = false;
        btnlast.Enabled = true;
        btnnext.Enabled = true;


        this.Filling_Gridview();
        this.Filling_Page_Count();

    }

    protected void btnprevious_Click(object sender, ImageClickEventArgs e)
    {
        int i = ViewPlanGrid.PageCount;
        if (ViewPlanGrid.PageIndex > 0)
        {
            ViewPlanGrid.PageIndex = ViewPlanGrid.PageIndex - 1;
            btnlast.Enabled = true;
        }
        if (ViewPlanGrid.PageIndex == 0)
        {
            btnfirst.Enabled = false;
        }
        if (ViewPlanGrid.PageCount - 1 == ViewPlanGrid.PageIndex + 1)
        {
            btnnext.Enabled = true;
        }
        if (ViewPlanGrid.PageIndex == 0)
        {
            btnprevious.Enabled = false;
        }


        this.Filling_Gridview();
        this.Filling_Page_Count();
    }
    protected void btnnext_Click(object sender, ImageClickEventArgs e)
    {
        int i = ViewPlanGrid.PageIndex + 1;
        if (i <= ViewPlanGrid.PageCount)
        {
            ViewPlanGrid.PageIndex = i;
            btnlast.Enabled = true;
            btnprevious.Enabled = true;
            btnfirst.Enabled = true;
        }
        if (ViewPlanGrid.PageCount - 1 == ViewPlanGrid.PageIndex)
        {
            btnnext.Enabled = false;
            btnlast.Enabled = false;
        }



        this.Filling_Gridview();
        this.Filling_Page_Count();
    }
    protected void btnlast_Click(object sender, ImageClickEventArgs e)
    {
        ViewPlanGrid.PageIndex = ViewPlanGrid.PageCount;
        btnlast.Enabled = false;
        btnfirst.Enabled = true;
        btnnext.Enabled = false;
        btnprevious.Enabled = true;

        this.Filling_Gridview();
        this.Filling_Page_Count();
    }
    //protected void btnDateSearch_Click(object sender, ImageClickEventArgs e)
    //{
    //    if (txtStartDate.Text != "" && txtEndDate.Text != "")
    //    {
    //        try
    //        {
    //            sqlParams = new SqlParameter[3];
    //            sqlParams[0] = new SqlParameter("@flag", "2");
    //            sqlParams[1] = new SqlParameter("@startdate", Convert.ToDateTime(txtStartDate.Text.ToString()));
    //            sqlParams[2] = new SqlParameter("@enddate", Convert.ToDateTime(txtEndDate.Text.ToString()));
    //            datast = new DataSet();
    //            datast = accessclass.GetDataSet("ViewPlan", CommandType.StoredProcedure, sqlParams);

    //            if (datast.Tables[0].Rows.Count > 0)
    //            {
    //                ViewPlanGrid.DataSourceID = null;
    //                ViewPlanGrid.DataSource = datast;
    //                ViewPlanGrid.DataBind();
    //                Lbl_rc.ForeColor = System.Drawing.Color.Black;
    //                Lbl_rc.Font.Bold = true;
    //                Lbl_rc.Text = "<font color='#009933'>Total no of records : " + datast.Tables[0].Rows.Count + "</font>";
    //                trP1.Visible = true;
    //                ViewPlanGrid.Visible = true;
    //            }
    //            else
    //            {
    //                ViewPlanGrid.DataSourceID = null;
    //                Lbl_rc.ForeColor = System.Drawing.Color.Black;
    //                Lbl_rc.Font.Bold = true;
    //                Lbl_rc.Text = "<font color='#FF0000'>No member record in the list.</font>";
    //                trP1.Visible = false;
    //                ViewPlanGrid.Visible = false;
    //            }
    //        }
    //        catch (Exception ex)
    //        {
    //            lblmsg.Visible = true;
    //            lblmsg.Text = "Error : " + ex.Message;

    //        }
    //        finally
    //        {
    //            sqlParams = null;
    //            datast.Dispose();

    //        }
    //    }
    //}
}
