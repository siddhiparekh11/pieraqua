<%@ Page Language="C#" AutoEventWireup="true" CodeFile="EditProductCategory.aspx.cs" Inherits="cms_EditProductCategory" StylesheetTheme="SkinFile" Theme="SkinFile" %>

<%@ Register Src="UserControls/LeftMenu.ascx" TagName="LeftMenu" TagPrefix="uc1" %>
<%@ Register src="UserControls/Header.ascx" tagname="Header" tagprefix="uc2" %>
<%@ Register src="UserControls/Footer.ascx" tagname="Footer" tagprefix="uc3" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Edit Product Category - Pier Aqua Admin Panel</title>
     <link rel="stylesheet" type="text/css" href="style/style.css" />
    <link rel="stylesheet" type="text/css" href="style/colour1.css" />
     <style type="text/css">
        .style1
        {
            width: 18px;
        }
        .style3
        {
            width: 35px;
        }
        .style4
        {
            width: 100px;
        }
        .style5
        {
            width: 65px;
        }
    </style>

   
    <script src="../js/ddaccordion.js" type="text/javascript"></script>
    
</head>
<body>
    <form id="form1" runat="server">
    <div id="main">
      <uc2:Header ID="Header1" runat="server" />
      <div id="site_content">
            <uc1:LeftMenu ID="LeftMenu1" runat="server" />
            <div id="content">
                <h1>
                    Edit a Product Category</h1>
                    <table width="100%">
                    <tr>
                        <td class="style3">
                            &nbsp;
                        </td>
                        <td class="style4">
                            &nbsp;
                            <asp:ScriptManager ID="ScriptManager1" runat="server">
                            </asp:ScriptManager>
                        </td>
                        <td class="style1">
                            &nbsp;
                        </td>
                        <td colspan="2">
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" 
                                ValidationGroup="valgrpupdate" />
                            <asp:Label ID="lblmsg" runat="server"></asp:Label>
                        </td>
                    </tr>
                    
                    <tr>
                        <td class="style3">
                            &nbsp;
                        </td>
                        <td class="style4">
                            Category Name</td>
                        <td class="style1">
                            :
                        </td>
                        <td class="style5">
                            <asp:TextBox ID="txtCategory_Name" runat="server" CssClass="textbox" Width="186px" 
                                TabIndex="1"></asp:TextBox>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                ControlToValidate="txtCategory_Name" Display="None" ErrorMessage="Enter Category Name" 
                                SetFocusOnError="True" ValidationGroup="valgrpupdate"></asp:RequiredFieldValidator>
                            &nbsp;Ex : Furniture,Chemicals&nbsp; etc...</td>
                    </tr>
                    <tr>
                        <td class="style3">
                            &nbsp;
                        </td>
                        <td class="style4">
                            Category Type</td>
                        <td class="style1">
                            :
                        </td>
                        <td class="style5">
                        <asp:UpdatePanel ID="UpdatePanel1" runat="server" ChildrenAsTriggers="true" UpdateMode="Always">
                        <ContentTemplate>
                            <asp:RadioButtonList TabIndex="2" ID="rdlParentChild" runat="server" 
                                RepeatDirection="Horizontal" 
                                
                                AutoPostBack="True" 
                                onselectedindexchanged="rdlParentChild_SelectedIndexChanged" 
                                style="width: 117px"   >

                                <asp:ListItem  Text="Parent" Value="Parent"  ></asp:ListItem>

                            <asp:ListItem Text="Child" Value="Child" ></asp:ListItem>

                            </asp:RadioButtonList>
                            </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                ControlToValidate="rdlParentChild" Display="None" 
                                ErrorMessage="Enter Category Type" SetFocusOnError="True" 
                                ValidationGroup="valgrpupdate"></asp:RequiredFieldValidator>
                            &nbsp;Ex : Parent or Child</td>
                    </tr>
                    <tr>
                        <td class="style3">
                            &nbsp;</td>
                        <td class="style4">
                            Parent Categories</td>
                        <td class="style1">
                            :</td>
                        <td >
                        <asp:UpdatePanel ID="UpdatePanel2" runat="server" ChildrenAsTriggers="true" UpdateMode="Always">
                        <ContentTemplate>                           
                         <asp:DropDownList ID="dplParentCategory" TabIndex="3" runat="server" 
                                DataSourceID="SqlDataSource1" DataTextField="CategoryName" 
                                DataValueField="CategoryID" Width="186px" Enabled="False">
                            </asp:DropDownList> 
                            </ContentTemplate>

                            </asp:UpdatePanel>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                                
                               ></asp:SqlDataSource> 
                            </td>
                        <td>
                            &nbsp;Ex : Furniture,Apparel etc...</td>
                    </tr>
                    
                     <tr>
                        <td class="style3">
                            &nbsp;</td>
                        <td class="style4">
                            IsActive</td>
                        <td class="style1">
                            :</td>
                        <td align="left">
                            <asp:RadioButtonList ID="rdlIsActive" runat="server" 
                                RepeatDirection="Horizontal">
                                <asp:ListItem Value="1">True</asp:ListItem>
                                <asp:ListItem Value="0">False</asp:ListItem>
                            </asp:RadioButtonList>
                         </td>
                                <td>&nbsp;</td>
                        
                    </tr>
                   
                    
                   
                    <tr>
                        <td class="style3">
                            &nbsp;</td>
                        <td class="style4">
                            &nbsp;</td>
                        <td class="style1">
                            &nbsp;</td>
                        <td align="left" colspan="2">
                            <asp:ImageButton ID="btnUpdate" runat="server" 
                                ImageUrl="images/btnUpdate.jpg"  TabIndex="4" onclick="btnUpdate_Click" ValidationGroup="valgrpupdate" 
                                />
                                <asp:ImageButton ID="btnCancel" runat="server" 
                                ImageUrl="images/btnCencel.jpg"  TabIndex="5" CausesValidation="false" onclick="btnCancel_Click"  
                                />
                        </td>
                      
                    </tr>
                    
                    <tr>
                        <td class="style3">
                            &nbsp;</td>
                        <td class="style4">
                            &nbsp;</td>
                        <td class="style1">
                            &nbsp;</td>
                        <td align="center">
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    </table>
            </div>
        </div>
        <uc3:Footer ID="Footer1" runat="server" />
        </div>
    </form>
</body>
</html>
