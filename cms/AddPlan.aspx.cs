using System;
using System.Data;
using System.Web.UI;
using System.Data.SqlClient;


public partial class cms_AddPlan : System.Web.UI.Page
{
    SqlParameter[] sqlParams ;
    DataAccess accessclass = new DataAccess();
    static bool isvalid = false;
    protected void Page_Load(object sender, EventArgs e)
    {
        if ((Session["AdminUser_ID"] == null || Session["AdminUser_ID"].ToString().CompareTo("")==0))
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
    private bool  page_right_check()
    {
        bool result=false;
        GlobalArrays.fillarray(Session["Admin_Page_Rights"].ToString(), ',');
         foreach (string item in GlobalArrays.returnarray())
        {
            
                if(item.Trim().CompareTo("AddPlan.aspx")==0)
                    result = true;
            
        }            

        
        return result;
    }
    protected void btnSave_Click(object sender, ImageClickEventArgs e)
    {
        try
        {
            if (Page.IsPostBack)
            {
                if (isvalid)
                {
                    int returnedRows = 0;
                    sqlParams = new SqlParameter[] {
                        new SqlParameter("@planName",txtPlan_Name.Text) ,
                        new SqlParameter("@planValidity",txtPlan_Validity.Text),
                        new SqlParameter("@planDescription ",txtPlanDescription.Text),
                        new SqlParameter("@inrPrice",txtINRPrice.Text),
                        new SqlParameter("@usdPrice",txtUSDPrice.Text),
                        new SqlParameter("@userId",Session["AdminUser_ID"]),
                        new SqlParameter("@pricepercontact",txtPricePerSupplier.Text),
                        new SqlParameter("@contactcount",txtSupplierCount.Text),
                        new SqlParameter("@plantype",rblPlan_Type.SelectedValue)

                };

                    returnedRows = accessclass.ExecuteNonQuery("InsertPlan", CommandType.StoredProcedure, sqlParams);
                    if (returnedRows > 0)
                    {
                        lblmsg.Visible = true;
                        lblmsg.Text = "Plan has been added successfully.";
                        clear();

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
    

    private void clear()
    {
        txtPlan_Validity.Text = "";
        txtPlanDescription.Text = "";
        txtPlan_Name.Text = "";
        txtUSDPrice.Text = "";
        txtINRPrice.Text = "";
        txtPricePerSupplier.Text = "";
        txtSupplierCount.Text = "";
        txtPlan_Name.Focus();
        rblPlan_Type.ClearSelection();

       

    }
    protected void btnCancel_Click(object sender, ImageClickEventArgs e)
    {
        if (Page.IsPostBack)
        {
            clear();
            lblmsg.Text = "";
        }
    }
    protected void imgbtnCheck_Availibility_Click(object sender, ImageClickEventArgs e)
    {
        DataSet checkplanname;
        if (Page.IsPostBack)
        {
            if ((txtPlan_Name.Text != null || txtPlan_Name.Text != "") && (rblPlan_Type.SelectedValue != null))
            {
                checkplanname = accessclass.GetDataSet("Select PlanName from BuyingSellingPlans where PlanName='" + txtPlan_Name.Text + "' and PlanType=" + rblPlan_Type.SelectedValue, CommandType.Text, null);
                if (checkplanname.Tables[0].Rows.Count > 0)
                {
                    lblmsg.Text = "<font color=\"red\">The Plan name is not available</font>";

                }
                else
                {
                    lblmsg.Text = "The Plan name is available";
                    isvalid = true;
                }
            }
            else
            {
                lblmsg.Text = "<font color=\"red\">Select Plan type and Enter a plan name</font>";
            }
        }
    }
}

