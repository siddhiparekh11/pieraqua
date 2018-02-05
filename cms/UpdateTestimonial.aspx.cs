using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
public partial class cms_UpdateTestimonial : System.Web.UI.Page
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

            if (item.Trim().CompareTo("UpdateTestimonial.aspx") == 0)
                result = true;

        }


        return result;
    }
    private void Display_Data()
    {
        sqlParams = new SqlParameter[5];
        sqlParams[0] = new SqlParameter("@flag", "2");
        sqlParams[1] = null;
        sqlParams[2] = null;
        sqlParams[3] = null;
        sqlParams[4] = new SqlParameter("@testimonialid", Request.QueryString["id"]);
        datast = accessclass.GetDataSet("ViewTestimonials", CommandType.StoredProcedure, sqlParams);
        txtTestimonialTitle.Text = datast.Tables[0].Rows[0].ItemArray[2].ToString();
        txtTestimonialText.Text = datast.Tables[0].Rows[0].ItemArray[3].ToString();
        lblcustomername.Text = datast.Tables[0].Rows[0].ItemArray[4].ToString();
        lblcompanyname.Text = datast.Tables[0].Rows[0].ItemArray[5].ToString();
        if (datast.Tables[0].Rows[0].ItemArray[6].ToString().CompareTo("False")==0)
        {
            rdlIsActive.Items[1].Selected = true;
        }
        else
        {
            rdlIsActive.Items[0].Selected = true;
        }
        if (Convert.ToInt32(datast.Tables[0].Rows[0].ItemArray[7].ToString())==0)
        {
            rdlCustomerType.Items[0].Selected = true;
        }
        else if (Convert.ToInt32(datast.Tables[0].Rows[0].ItemArray[7].ToString()) == 1)
        {
            rdlCustomerType.Items[1].Selected = true;
        }
        else if (Convert.ToInt32(datast.Tables[0].Rows[0].ItemArray[7].ToString()) == 2)
        {
            rdlCustomerType.Items[2].Selected = true;
        }

    }
    private void Clear_Data()
    {
        txtTestimonialTitle.Text = "";
        txtTestimonialText.Text = "";
        lblcompanyname.Text = "";
        lblcustomername.Text = "";
        rdlIsActive.Items[0].Selected = false;
        rdlIsActive.Items[1].Selected = false;
        rdlCustomerType.Items[0].Selected = false;
        rdlCustomerType.Items[1].Selected = false;
        rdlCustomerType.Items[2].Selected = false;
    }

    protected void btnUpdate_Click(object sender, ImageClickEventArgs e)
    {
        try
        {
            int returnedRows = 0;
            
           
            sqlParams = new SqlParameter[] {
                    new SqlParameter("@Testimonialtitle",txtTestimonialTitle.Text),
                    new SqlParameter("@Testimonialtext",txtTestimonialText.Text) ,
                    new SqlParameter("@IsActive",rdlIsActive.SelectedValue),
                    new SqlParameter("@TestimonialID",Request.QueryString["id"].ToString())
                    
            };

            returnedRows = accessclass.ExecuteNonQuery("UpdateTestimonial", CommandType.StoredProcedure, sqlParams);
            if (returnedRows > 0)
            {
               
               // Clear_Data();
                Response.Redirect("ViewTestimonial.aspx");

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
    protected void btnCancel_Click(object sender, ImageClickEventArgs e)
    {
        Clear_Data();
        lblmsg.Text = "";
        Response.Redirect("ViewTestimonial.aspx");
    }
}
