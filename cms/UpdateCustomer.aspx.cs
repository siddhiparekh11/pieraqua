using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
public partial class cms_UpdateCustomer : System.Web.UI.Page
{
    SqlParameter[] sqlParams;
    DataAccess accessclass = new DataAccess();
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

                    HiddenField hdntempfield = new HiddenField();
                    RadioButtonList rdntemplist = new RadioButtonList();
                    hdntempfield = (HiddenField)UpdateCustomerView.FindControl("hdnIsActive");
                    rdntemplist = (RadioButtonList)UpdateCustomerView.FindControl("rdlIsActive");
                    if (hdntempfield.Value.ToString().CompareTo("True") == 0)
                    {
                        rdntemplist.Items[0].Selected = true;
                    }
                    else
                    {
                        rdntemplist.Items[1].Selected = true;
                    }
                    hdntempfield = null;
                    hdntempfield = (HiddenField)UpdateCustomerView.FindControl("hdnGender");
                    rdntemplist = null;
                    rdntemplist = (RadioButtonList)UpdateCustomerView.FindControl("rdlCustomerGender");
                    if (hdntempfield.Value.ToString().CompareTo("False") == 0)
                    {
                        rdntemplist.Items[1].Selected = true;
                    }
                    else
                    {
                        rdntemplist.Items[0].Selected = true;
                    }
                    hdntempfield = null;
                    hdntempfield = (HiddenField)UpdateCustomerView.FindControl("hdnCustomerType");
                    rdntemplist = null;
                    rdntemplist = (RadioButtonList)UpdateCustomerView.FindControl("rdlCustomerType");
                    if (hdntempfield.Value.ToString().CompareTo("0") == 0)
                    {
                        rdntemplist.Items[0].Selected = true;
                    }
                    else if (hdntempfield.Value.ToString().CompareTo("1") == 0)
                    {
                        rdntemplist.Items[1].Selected = true;
                    }
                    else
                    {
                        rdntemplist.Items[2].Selected = true;
                    }
                    HyperLink tempcompany = new HyperLink();
                    tempcompany = (HyperLink)UpdateCustomerView.FindControl("companyhyperlink");
                    tempcompany.NavigateUrl = "UpdateCompany.aspx?customerid=" + Request.QueryString["customerid"];

                    if (rdntemplist.Items[1].Selected)
                    {
                        HyperLink tempbuyertosupplier = new HyperLink();
                        tempbuyertosupplier = (HyperLink)UpdateCustomerView.FindControl("buyertosupplierhyperlink");
                        tempbuyertosupplier.NavigateUrl = "BuyerToSupplier.aspx?customerid=" + Request.QueryString["customerid"];
                    }
                    else if (rdntemplist.Items[0].Selected)
                    {
                        HyperLink tempbuyertosupplier = new HyperLink();
                        tempbuyertosupplier = (HyperLink)UpdateCustomerView.FindControl("buyertosupplierhyperlink");
                        tempbuyertosupplier.NavigateUrl = "SupplierToBuyer.aspx?customerid=" + Request.QueryString["customerid"];
                    }
                    HyperLink tempplanhistory = new HyperLink();
                    tempplanhistory = (HyperLink)UpdateCustomerView.FindControl("planhistorylink");
                    tempplanhistory.NavigateUrl = "ViewPlanHistory.aspx?customerid=" + Request.QueryString["customerid"];

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

            if (item.Trim().CompareTo("UpdateCustomer.aspx") == 0)
                result = true;

        }


        return result;
    }
        protected void btnUpdate_Click(object sender, ImageClickEventArgs e)
        {
        sqlParams = null;
        string isactivevalue;
        int returnedrows;
        RadioButtonList rdntemplist = new RadioButtonList();
        rdntemplist = (RadioButtonList)UpdateCustomerView.FindControl("rdlIsActive");
        if (rdntemplist.Items[0].Selected)
            isactivevalue = rdntemplist.Items[0].Value.ToString();
        else
            isactivevalue = rdntemplist.Items[1].Value.ToString();
        returnedrows=accessclass.ExecuteNonQuery("update Customers set IsActive=" + isactivevalue + " where CustomerID=" +  Request.QueryString["customerid"], CommandType.Text, sqlParams);

        if (returnedrows > 0)
        {
            Response.Redirect("ViewCustomers.aspx");
        }
      
        
        }
        protected void btnCancel_Click(object sender, ImageClickEventArgs e)
        {
            
                Response.Redirect("ViewCustomers.aspx");
            
        }
}

