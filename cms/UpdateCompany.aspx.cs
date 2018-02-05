using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
public partial class cms_UpdateCompany : System.Web.UI.Page
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
                    hdntempfield = (HiddenField)UpdateCompanyView.FindControl("hdnIsActive");
                    rdntemplist = (RadioButtonList)UpdateCompanyView.FindControl("RadioButtonList1");
                    if (hdntempfield.Value.ToString().CompareTo("True") == 0)
                    {
                        rdntemplist.Items[0].Selected = true;
                    }
                    else
                    {
                        rdntemplist.Items[1].Selected = true;
                    }
                    hdntempfield = null;
                    hdntempfield = (HiddenField)UpdateCompanyView.FindControl("hdnCompanyID");
                    HyperLink tempbriefintroduction = new HyperLink();
                    tempbriefintroduction = (HyperLink)UpdateCompanyView.FindControl("introductionhyperlink");
                    tempbriefintroduction.NavigateUrl = "UpdateCompanyDescription.aspx?companyid=" + hdntempfield.Value.ToString();
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

            if (item.Trim().CompareTo("UpdateCompany.aspx") == 0)
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
        rdntemplist = (RadioButtonList)UpdateCompanyView.FindControl("RadioButtonList1");
        if (rdntemplist.Items[0].Selected)
            isactivevalue = rdntemplist.Items[0].Value.ToString();
        else
            isactivevalue = rdntemplist.Items[1].Value.ToString();
        returnedrows = accessclass.ExecuteNonQuery("update Companies set IsActive=" + isactivevalue + " where CustomerID=" + Request.QueryString["customerid"], CommandType.Text, sqlParams);
        if (returnedrows > 0)
        {
            Response.Redirect("UpdateCustomer.aspx?CustomerID=" + Request.QueryString["customerid"]);
        }
    }
    protected void btnCancel_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("UpdateCustomer.aspx?CustomerID=" + Request.QueryString["customerid"]);
    }
}
