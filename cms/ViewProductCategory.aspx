<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ViewProductCategory.aspx.cs" Inherits="cms_ViewProductCategory" StylesheetTheme="SkinFile" Theme="SkinFile" %>

<%@ Register Src="UserControls/LeftMenu.ascx" TagName="LeftMenu" TagPrefix="uc1" %>
<%@ Register src="UserControls/Header.ascx" tagname="Header" tagprefix="uc2" %>
<%@ Register src="UserControls/Footer.ascx" tagname="Footer" tagprefix="uc3" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head id="Head1" runat="server">
    <title>View Product Categories - Pier Aqua Admin Panel</title>
    <meta http-equiv="content-type" content="text/html; charset=iso-8859-1" />
    <link rel="stylesheet" type="text/css" href="style/style.css" />
    <link rel="stylesheet" type="text/css" href="style/colour1.css" />
   
   
    <style type="text/css">
        .style8
        {
            width: 102px;
        }
        .style9
        {
            width: 105px;
        }
        .style10
        {
            width: 338px;
        }
       
    </style>
    </head>
<body>
    <form id="form1" runat="server" name="form1">
    
       
    
    <div id="main">
      <uc2:Header ID="Header1" runat="server" />
      <div id="site_content">
            <uc1:LeftMenu ID="LeftMenu1" runat="server" />
            <div id="content">
                <h1>View Product Categories</h1>
                <table width="100%">
                <tr>
                <td class="style10"  >
                    <asp:ScriptManager ID="ScriptManager1" runat="server">
                    </asp:ScriptManager>
                    </td>
                
                <td class="style8"  >
                
                    &nbsp;</td>
                <td class="style9"  >
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                </tr>
                <tr>
                <td class="style10"  >
                <asp:UpdatePanel ID="UpdatePanel1" runat="server" ChildrenAsTriggers="true" UpdateMode="Always">
                <ContentTemplate>
                    <asp:TextBox ID="txtMultiPurpose" runat="server" Width="331px" 
                        ForeColor="Black"> Category Name</asp:TextBox></ContentTemplate></asp:UpdatePanel></td>
                
                <td class="style8"  >
                
                    <asp:ImageButton ID="ImageButton2" runat="server" 
                        ImageUrl="~/cms/images/btnUpdate.jpg"
                        onclick="btnEdit_Click" />
                </td>
                <td class="style9"  >
                    <asp:ImageButton ID="ImageButton1" runat="server" 
                        ImageUrl="~/cms/images/search.jpg" OnClick="btnSearch_Click" /> 
                </td>
                <td>
                    <asp:ImageButton ID="ImageButton3" runat="server" 
                        ImageUrl="~/cms/images/viewproducts.jpg" 
                        onclick="btnViewProducts_Click" />
                </td>
                </tr>
                <tr>
                
                <td colspan="4" >
                 <asp:Panel ID="Panel1" runat="server" ScrollBars="Auto" height="300" 
                        BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" >
                        <asp:UpdatePanel ID="UpdatePanel2" runat="server" ChildrenAsTriggers="true" UpdateMode="Always">
                        <ContentTemplate>
                     <asp:TreeView  ID="ViewCategoryTreeview" runat="server"  ExpandDepth="1" 
                         OnTreeNodePopulate="ViewCategoryTreeview_TreeNodePopulate"
                               borderstyle="None"  
                          ImageSet="Arrows" NodeIndent="35" 
                         onselectednodechanged="ViewCategoryTreeview_SelectedNodeChanged"  
                          >
                          <ParentNodeStyle Font-Bold="False" ForeColor="Black" />
        <HoverNodeStyle Font-Underline="True" ForeColor="#5555DD" />
        <SelectedNodeStyle Font-Underline="True" ForeColor="#5555DD" 
            HorizontalPadding="0px" VerticalPadding="0px" />
        <NodeStyle Font-Names="Verdana" Font-Size="8pt" ForeColor="Black" 
            HorizontalPadding="5px" NodeSpacing="0px" VerticalPadding="0px" />
        <LeafNodeStyle ForeColor="Black" />
                          
                         
                     </asp:TreeView>
                     </ContentTemplate>
                     </asp:UpdatePanel>
                     <%-- <div class="vs-context-menu">
                            <ul>
                                <li class="edit"><a href="javascript:edit();">Edit</a></li>
                            </ul>
                       </div>
                    --%>
                  </asp:Panel>
                </td>
               
               
                </tr>
                </table>
               
                
               
                 
               
            </div>
        </div>
        <uc3:Footer ID="Footer1" runat="server" />
        </div>
        
    </form>
</body>
</html>