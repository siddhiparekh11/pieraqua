using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
public partial class cms_UpdateFAQ : System.Web.UI.Page
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

            if (item.Trim().CompareTo("UpdateFAQ.aspx") == 0)
                result = true;

        }


        return result;
    }
    private void Display_Data()
    {
        sqlParams = new SqlParameter[3];
        sqlParams[2] = new SqlParameter("@FAQID",Request.QueryString["faqid"]);
        sqlParams[1] = null;
        sqlParams[0] = new SqlParameter("@flag","2");
        
        datast = accessclass.GetDataSet("ViewFAQ", CommandType.StoredProcedure, sqlParams);
        txtFAQ_Question.Text = datast.Tables[0].Rows[0].ItemArray[1].ToString();
        txtFAQ_Anwer.Text = datast.Tables[0].Rows[0].ItemArray[2].ToString();
        if (datast.Tables[0].Rows[0].ItemArray[3].ToString().CompareTo("0") == 0)
        {
            rdlFAQType.Items[0].Selected = true;
        }
        else if (datast.Tables[0].Rows[0].ItemArray[3].ToString().CompareTo("1") == 0)
        {
            rdlFAQType.Items[1].Selected = true;
        }
        else if (datast.Tables[0].Rows[0].ItemArray[3].ToString().CompareTo("2") == 0)
        {
            rdlFAQType.Items[2].Selected = true;
        }
        if (Convert.ToBoolean(datast.Tables[0].Rows[0].ItemArray[4].ToString()))
        {
            rdlIsActive.Items[0].Selected = true;
        }
        else
        {
            rdlIsActive.Items[1].Selected = true;
        }

    }
    private void Clear_Data()
    {
        txtFAQ_Question.Text = "";
        txtFAQ_Anwer.Text = "";
        rdlIsActive.Items[0].Selected = false;
        rdlIsActive.Items[1].Selected = false;
        rdlFAQType.Items[0].Selected = false;
        rdlFAQType.Items[1].Selected = false;
        rdlFAQType.Items[2].Selected = false;

    }
    protected void btnUpdate_Click(object sender, ImageClickEventArgs e)
    {
        try
        {
            int returnedRows = 0;
            bool? isvalid = null;
            if (rdlIsActive.Items[0].Selected)
            {
                isvalid = true;
            }
            else
            {
                isvalid = false;
            }
            sqlParams = new SqlParameter[] {
                    new SqlParameter("@FAQID",Request.QueryString["faqid"].ToString()),
                    new SqlParameter("@FAQQuestion",txtFAQ_Question.Text) ,
                    new SqlParameter("@FAQAnswer",txtFAQ_Anwer.Text),
                    new SqlParameter("@FAQType",rdlFAQType.SelectedValue.ToString()),
                    new SqlParameter("@IsActive",isvalid)
            };

            returnedRows = accessclass.ExecuteNonQuery("UpdateFAQ", CommandType.StoredProcedure, sqlParams);
            if (returnedRows > 0)
            {
                //lblmsg.Visible = true;
                //lblmsg.Text="Plan has been updated successfully.";
                Clear_Data();
                Response.Redirect("ViewFAQs.aspx");

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
        Response.Redirect("ViewFAQs.aspx");
    }
}
