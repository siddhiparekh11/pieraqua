using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Text;
public partial class cms_UpdateProduct : System.Web.UI.Page
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
                    hdntempfield = (HiddenField)UpdateProductView.FindControl("hdnIsActive");
                    if (hdntempfield.Value.ToString().CompareTo("True") == 0)
                    {
                        RadioButtonList1.Items[0].Selected = true;
                    }
                    else
                    {
                        RadioButtonList1.Items[1].Selected = true;
                    }


                    HyperLink templisting = new HyperLink();
                    templisting = (HyperLink)UpdateProductView.FindControl("listinghyperlink");
                    templisting.NavigateUrl = "UpdateProductDescription.aspx?productid=" + Request.QueryString["productid"] + "&descriptionid=1";
                    HyperLink tempdetailed = new HyperLink();
                    tempdetailed = (HyperLink)UpdateProductView.FindControl("detailedhyperlink");
                    tempdetailed.NavigateUrl = "UpdateProductDescription.aspx?productid=" + Request.QueryString["productid"] + "&descriptionid=2";
                    HyperLink tempproductattributes = new HyperLink();
                    tempproductattributes = (HyperLink)UpdateProductView.FindControl("productattributeslink");
                    tempproductattributes.NavigateUrl = "ViewProductAttributes.aspx?productid=" + Request.QueryString["productid"];
                    HyperLink tempproductphoto = new HyperLink();
                    tempproductphoto = (HyperLink)UpdateProductView.FindControl("productphotohyperlink");
                    tempproductphoto.NavigateUrl = "ViewPhoto.aspx?productid=" + Request.QueryString["productid"];
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

            if (item.Trim().CompareTo("UpdateProduct.aspx") == 0)
                result = true;

        }


        return result;
    }
    protected void btnUpdate_Click(object sender, ImageClickEventArgs e)
    {
        sqlParams = null;
        string isactivevalue;
        int returnedrows;
        if(RadioButtonList1.Items[0].Selected)
            isactivevalue="1";
        else
            isactivevalue="0";
        returnedrows=accessclass.ExecuteNonQuery("update Products set IsActive=" + isactivevalue + " where ProductID=" +  Request.QueryString["productid"], CommandType.Text, sqlParams);
        if (returnedrows > 0)
        {
            lblmsg.Text = "record has been updated";
            Response.Redirect("ViewProducts.aspx");
        }
        
    }
    protected void btnCancel_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("ViewProducts.aspx");
    }
    
}
