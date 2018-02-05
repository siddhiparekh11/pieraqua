using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
public partial class cms_UpdateUsers : System.Web.UI.Page
{
    SqlParameter[] sqlParams;
    DataAccess accessclass = new DataAccess();
    DataSet datast;
    string pageids;
    string []ids=new string[500];
    
   
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
                    sqlParams = null;
                    datast = accessclass.GetDataSet("select PageRights from Admin where UserID=" + Request.QueryString["id"], CommandType.Text, sqlParams);
                    pageids = datast.Tables[0].Rows[0].ItemArray[0].ToString();
                    fill_pageid_array();
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

            if (item.Trim().CompareTo("UpdateUsers.aspx") == 0)
                result = true;

        }


        return result;
    }
    protected void Page_SaveStateComplete(object sender, EventArgs e)
    {
        for (int i = 0; i < chkPageRights.Items.Count; ++i)
        {
            for (int j = 0; j < ids.Length; ++j)
            {
                if (chkPageRights.Items[i].Value == ids[j])
                {
                    chkPageRights.Items[i].Selected = true;
                }
            }
        }

    }
    private void fill_pageid_array()
    {
        ids = pageids.Split(',');
       
        
    }
    private void Display_Data()
    {
        sqlParams = new SqlParameter[2];
        sqlParams[0] = new SqlParameter("@flag", "2");
        sqlParams[1] = new SqlParameter("@userid", Request.QueryString["id"]);
        datast = accessclass.GetDataSet("ViewUsers", CommandType.StoredProcedure, sqlParams);
        txtUserName.Text = datast.Tables[0].Rows[0].ItemArray[0].ToString();
       
        txtFullName.Text = datast.Tables[0].Rows[0].ItemArray[1].ToString();
      

        if (Convert.ToBoolean(datast.Tables[0].Rows[0].ItemArray[2].ToString()))
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
        txtUserName.Text = "";
        txtFullName.Text = "";
        rdlIsActive.Items[0].Selected = true;
        rdlIsActive.Items[0].Selected = true;
        chkPageRights.Items.Clear();

    }
    protected void btnCancel_Click(object sender, ImageClickEventArgs e)
    {
        Clear_Data();
        lblmsg.Text = "";
        Response.Redirect("ViewUsers.aspx");
    }
    protected void btnUpdate_Click(object sender, ImageClickEventArgs e)
    {
        
        string pagesid=null;
        try
        {
            int returnedRows = 0;
            bool? isvalid = null;
            if (rdlIsActive.Items[0].Selected)
            {
                isvalid = true;
            }
            else if(rdlIsActive.Items[1].Selected)
            {
                isvalid = false;
            }
            sqlParams=null;
            for(int i=0;i<=chkPageRights.Items.Count-1;i++)
            {
                if (chkPageRights.Items[i].Selected)
                {
                    datast = accessclass.GetDataSet("select PageId from PagesInPierAqua where PageId=" + chkPageRights.Items[i].Value  , CommandType.Text, sqlParams);
                    pagesid = pagesid + datast.Tables[0].Rows[0].ItemArray[0].ToString() + "," ;
                }
            }
            sqlParams = new SqlParameter[] {
                    new SqlParameter("@username",txtUserName.Text),
                    new SqlParameter("@userid",Request.QueryString["id"].ToString()) ,
                    new SqlParameter("@fullname",txtFullName.Text),
                    new SqlParameter("@pagerights",pagesid),
                    new SqlParameter("@isactive",isvalid),
                    
            };
            
            returnedRows = accessclass.ExecuteNonQuery("UpdateUsers", CommandType.StoredProcedure, sqlParams);
            if (returnedRows > 0)
            {
                //lblmsg.Visible = true;
                //lblmsg.Text="Plan has been updated successfully.";
                Clear_Data();
                Response.Redirect("ViewUsers.aspx");

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

    protected void CheckBox1_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox1.Checked)
        {
            foreach (ListItem li in chkPageRights.Items)
            {
                li.Selected = true;
            }

        }
       
    }
}
