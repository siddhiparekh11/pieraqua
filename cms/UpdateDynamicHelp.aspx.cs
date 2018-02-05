using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

using System.Data.SqlClient;
public partial class cms_UpdateDynamicHelp : System.Web.UI.Page
{
    DataAccess accessclass = new DataAccess();
    DataSet datast = new DataSet();
    string isactive;
    SqlParameter[] sqlparam ;
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

            if (item.Trim().CompareTo("UpdateDynamicHelp.aspx") == 0)
                result = true;

        }


        return result;
    }
    protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
    {
        
        sqlparam=null;
        datast = accessclass.GetDataSet("select HelpDescription,IsActive from DynamicHelp where HelpID=" + DropDownList2.SelectedValue, CommandType.Text, sqlparam);
        if (datast.Tables[0].Rows.Count > 0)
        {
            txtHelpName.Text = DropDownList2.SelectedItem.Text;
            txtHelpDescription.Text = datast.Tables[0].Rows[0].ItemArray[0].ToString();
            if (datast.Tables[0].Rows[0].ItemArray[1].ToString().CompareTo("True") == 0)
            {
                rdlIsActive.Items[0].Selected = true;

            }
            else
            {
                rdlIsActive.Items[1].Selected = true;
            }
        }
    }

    protected void btnCancel_Click(object sender, ImageClickEventArgs e)
    {
        txtHelpName.Text = "";
        txtHelpDescription.Text = "";
        rdlIsActive.Items[0].Selected = false;
        rdlIsActive.Items[1].Selected = false;
        DropDownList1.SelectedIndex = 0;
        DropDownList2.Items.Clear();
        DropDownList2.Items.Add(new ListItem("No Data", "-1"));

        
        DropDownList2.SelectedIndex = 0;
        lblmsg.Text = "";

    }
    protected void btnSave_Click(object sender, ImageClickEventArgs e)
    {
        int returnedrows=0;
        if (DropDownList2.SelectedIndex != 0)
        {
            returnedrows = accessclass.ExecuteNonQuery("update DynamicHelp set HelpName='" + txtHelpName.Text + "',HelpDescription='" + txtHelpDescription.Text + "',PageId='" + DropDownList1.SelectedValue + "',IsActive='" + isactive + "' where HelpID='" + DropDownList2.SelectedValue + "'", CommandType.Text, sqlparam);
            if (returnedrows > 0)
            {
                lblmsg.Text = "Help has been updated";
                txtHelpName.Text = "";
                txtHelpDescription.Text = "";
                rdlIsActive.Items[0].Selected = false;
                rdlIsActive.Items[1].Selected = false;

                DropDownList2.Items.Clear();
                DropDownList2.Items.Add(new ListItem("No Data", "-1"));

                DropDownList1.SelectedIndex = 0;
                DropDownList2.SelectedIndex = 0;

            }

        }
        else
        {
            lblmsg.Text = "Select a valid help name ";
            DropDownList2.Focus();
        }
    }
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        DropDownList2.Items.Clear();
        DropDownList2.Items.Add(new ListItem("No Data", "-1"));

        SqlDataSource2.ConnectionString = ConfigurationManager.ConnectionStrings["pieraquaconnectionstring"].ConnectionString;
        SqlDataSource2.SelectCommand = "select HelpID,HelpName from DynamicHelp where PageId='" + DropDownList1.SelectedValue + "'";
        SqlDataSource2.DataBind();

    }
    protected void rdlIsActive_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (rdlIsActive.Items[0].Selected)
        {
            isactive = "1";
        }
        else
        {
            isactive = "0";
        }
    }
}
