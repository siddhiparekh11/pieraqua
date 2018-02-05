using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
public partial class cms_UpdatePlan : System.Web.UI.Page
{
    SqlParameter[] sqlParams;
    DataAccess accessclass = new DataAccess();
    DataSet datast;
    string planID;
    static bool chkavailstatus = false;
    int chkavailstatusflag;
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
                    Display_Data();

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

            if (item.Trim().CompareTo("UpdatePlan.aspx") == 0)
                result = true;

        }


        return result;
    }
    private void Display_Data()
    {
       sqlParams=new SqlParameter[4];
       sqlParams[0]=new SqlParameter("@flag","3");
       sqlParams[1] = null;
       sqlParams[2] = null;
       sqlParams[3] = new SqlParameter("@id", Request.QueryString["id"]);
       datast=accessclass.GetDataSet("ViewPlan",CommandType.StoredProcedure,sqlParams);
       txtPlan_Name.Text=datast.Tables[0].Rows[0]["PlanName"].ToString();
       txtPlan_Validity.Text=datast.Tables[0].Rows[0]["PlanValidity"].ToString();
       txtINRPrice.Text=datast.Tables[0].Rows[0]["INRPrice"].ToString();
       txtUSDPrice.Text=datast.Tables[0].Rows[0]["USDPrice"].ToString();
       txtPlanDescription.Text = datast.Tables[0].Rows[0]["PlanDescription"].ToString();
       txtSupplierCount.Text = datast.Tables[0].Rows[0]["ContactsCount"].ToString();
        txtPricePerSupplier.Text = datast.Tables[0].Rows[0]["PricePerContactUSD"].ToString();
       if (Convert.ToBoolean(datast.Tables[0].Rows[0]["IsActive"].ToString()))
       {
           IsActiveTrue.Checked = true;
       }
       else
       {
           IsActiveFalse.Checked = true;
       }
       if (datast.Tables[0].Rows[0]["PlanType"].ToString().CompareTo("0") == 0)
       {
           rdlPlan_Type.SelectedIndex = 0;
       }
       else if (datast.Tables[0].Rows[0]["PlanType"].ToString().CompareTo("1") == 0)
       {
           rdlPlan_Type.SelectedIndex = 1;
       }
       else
       {
           rdlPlan_Type.SelectedIndex = 2;
       }

    }
    private void Clear_Data()
    {
        txtPlan_Name.Text ="";
        txtPlan_Validity.Text = "";
        txtINRPrice.Text = "";
        txtUSDPrice.Text = "";
        txtPlanDescription.Text = "";
        txtSupplierCount.Text = "";
        txtPricePerSupplier.Text = "";
        IsActiveTrue.Checked = false;
        IsActiveFalse.Checked = false;
        rdlPlan_Type.ClearSelection(); 
        
    }

    protected void btnCancel_Click(object sender, ImageClickEventArgs e)
    {
        Clear_Data();   
        lblmsg.Text = "";
        Response.Redirect("ViewPlan.aspx");
    }
    protected void btnUpdate_Click(object sender, ImageClickEventArgs e)
    {
        try
        {
            if (Page.IsPostBack)
            {
                if ((chkavailstatus && chkavailstatusflag==1) || (chkavailstatusflag==0))
                {
                    int returnedRows = 0;
                    bool? isvalid = null;
                    if (IsActiveTrue.Checked)
                    {
                        isvalid = true;
                    }
                    else
                    {
                        isvalid = false;
                    }

                    sqlParams = new SqlParameter[] {
                        new SqlParameter("@planid",Request.QueryString["id"].ToString()),
                        new SqlParameter("@planname",txtPlan_Name.Text) ,
                        new SqlParameter("@planvalidity",txtPlan_Validity.Text),
                        new SqlParameter("@plandescription ",txtPlanDescription.Text),
                        new SqlParameter("@usdprice",txtUSDPrice.Text),
                        new SqlParameter("@inrPrice",txtINRPrice.Text),
                        new SqlParameter("@isvalid",isvalid),
                        new SqlParameter("@pricepercontact",txtPricePerSupplier.Text),
                        new SqlParameter("@contactscount",txtSupplierCount.Text),
                        new SqlParameter("@plantype",rdlPlan_Type .SelectedValue)
                };

                    returnedRows = accessclass.ExecuteNonQuery("UpdatePlan", CommandType.StoredProcedure, sqlParams);
                    if (returnedRows > 0)
                    {

                        Clear_Data();
                        Response.Redirect("ViewPlan.aspx");

                    }
                    else
                    {
                        lblmsg.Visible = true;
                        lblmsg.Text = "<font color=\"red\">Plan update FAIL.</font>";
                    }
                }
                else
                {
                    lblmsg.Text = "<font color=\"red\">Check the availability of plan</font>";
                }
            }
        }
        catch (Exception ex)
        {
            lblmsg.Visible = true;
            lblmsg.Text = "Error :" + ex.Message;

        }
        finally
        {
            sqlParams = null;

        }
    }
    protected void imgbtnCheck_Availability_Click(object sender, ImageClickEventArgs e)
    {
        DataSet checkplanname;
        if (Page.IsPostBack)
        {
            if ((txtPlan_Name.Text != null || txtPlan_Name.Text != "") && (rdlPlan_Type.SelectedValue != null))
            {
                checkplanname = accessclass.GetDataSet("Select PlanName from BuyingSellingPlans where PlanName='" + txtPlan_Name.Text + "' and PlanType=" + rdlPlan_Type.SelectedValue, CommandType.Text, null);
                if (checkplanname.Tables[0].Rows.Count > 0)
                {
                    lblmsg.Text = "<font color=\"red\">The Plan name is not available</font>";
                    chkavailstatusflag = 1;
                }
                else
                {
                    lblmsg.Text = "The Plan name is available";
                    chkavailstatus = true;
                    chkavailstatusflag = 1;
                }
            }
            else
            {
                lblmsg.Text = "<font color=\"red\">Select Plan type and Enter a plan name</font>";
            }
        }
    }
}
