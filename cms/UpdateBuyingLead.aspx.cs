using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
public partial class cms_UpdateBuyingLead : System.Web.UI.Page
{
    SqlParameter[] sqlParams;
    DataAccess accessclass = new DataAccess();
    protected void Page_Load(object sender, EventArgs e)
    {
        if ((Session["AdminUser_ID"] == null || Session["AdminUser_ID"].ToString().CompareTo("") == 0))
        {
            Response.Redirect("Login.aspx");
        }
        else{ if (page_right_check())
        {
            if (!Page.IsPostBack)
            {

                HiddenField hdntempfield = new HiddenField();
                RadioButtonList rdntemplist = new RadioButtonList();
                hdntempfield = (HiddenField)UpdateBuyingLeadView.FindControl("hdnIsActive");
                rdntemplist = (RadioButtonList)UpdateBuyingLeadView.FindControl("RadioButtonList1");
                if (hdntempfield.Value.ToString().CompareTo("True") == 0)
                {
                    rdntemplist.Items[0].Selected = true;
                }
                else
                {
                    rdntemplist.Items[1].Selected = true;
                }
            }
            HyperLink tempbuyingdescription = new HyperLink();
            tempbuyingdescription = (HyperLink)UpdateBuyingLeadView.FindControl("briefdescriptionhyperlink");
            tempbuyingdescription.NavigateUrl = "UpdateBuyingDescription.aspx?fieldno=1&buyingleadid=" + Request.QueryString["buyingleadid"];

            HyperLink temprequiredcertification = new HyperLink();
            temprequiredcertification = (HyperLink)UpdateBuyingLeadView.FindControl("requiredcertificationhyperlink");
            temprequiredcertification.NavigateUrl = "UpdateBuyingDescription.aspx?fieldno=2&buyingleadid=" + Request.QueryString["buyingleadid"];
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

            if (item.Trim().CompareTo("UpdateBuyingLead.aspx") == 0)
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
        rdntemplist = (RadioButtonList)UpdateBuyingLeadView.FindControl("RadioButtonList1");
        if (rdntemplist.Items[0].Selected)
            isactivevalue = rdntemplist.Items[0].Value.ToString();
        else
            isactivevalue = rdntemplist.Items[1].Value.ToString();
        returnedrows = accessclass.ExecuteNonQuery("update BuyingLeads set IsActive=" + isactivevalue + " where BuyingLeadID=" + Request.QueryString["buyingleadid"], CommandType.Text, sqlParams);
        if (returnedrows > 0)
        {
            Response.Redirect("ViewBuyingLead.aspx");
        }
    }
    protected void btnCancel_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("ViewBuyingLead.aspx");
    }
}
