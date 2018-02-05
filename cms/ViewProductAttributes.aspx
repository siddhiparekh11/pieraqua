<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ViewProductAttributes.aspx.cs" Inherits="cms_ViewProductAttributes" StylesheetTheme="SkinFile" Theme="SkinFile" %>

<%@ Register Src="UserControls/LeftMenu.ascx" TagName="LeftMenu" TagPrefix="uc1" %>
<%@ Register src="UserControls/Header.ascx" tagname="Header" tagprefix="uc2" %>
<%@ Register src="UserControls/Footer.ascx" tagname="Footer" tagprefix="uc3" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head id="Head1" runat="server">
    <title>View ProductAttributes - Pier Aqua Admin Panel</title>
    <meta http-equiv="content-type" content="text/html; charset=iso-8859-1" />
    <link rel="stylesheet" type="text/css" href="style/style.css" />
    <link rel="stylesheet" type="text/css" href="style/colour1.css" />
  
    <style type="text/css">
        .style4
        {
            width: 144px;
        }
        .style5
        {
            width: 501px;
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
                <h1>View Products ATTRIBUTES</h1>
                <table width="100%">
                <tr>
                <td class="style4"></td>
                <td class="style5">
                    <asp:Label ID="lblmsg" runat="server"></asp:Label>
                    </td>
                <td></td>
                </tr>
                <tr>
                <td class="style4">&nbsp;</td>
                <td class="style5">
                    <asp:ScriptManager ID="ScriptManager1" runat="server">
                    </asp:ScriptManager>
                    </td>
                <td>&nbsp;</td>
                </tr>
                <tr>
                <td class="style4">
                    <asp:ImageButton ID="btnBack" runat="server" 
                        ImageUrl="~/cms/images/btnBack1.jpg" onclick="btnBack_Click" />
                    </td>
                <td align="right" class="style5">
                <asp:UpdatePanel ID="UpdatePanel1" runat="server" ChildrenAsTriggers="true" UpdateMode="Always">
                <ContentTemplate>
                    <asp:CheckBox ID="chkSelectall" runat="server" Text="Select All " 
                        TextAlign="Left" AutoPostBack="True" 
                        oncheckedchanged="chkSelectall_CheckedChanged" />
                        </ContentTemplate>
                        </asp:UpdatePanel>
                    </td>
                <td>
                    <asp:ImageButton ID="btnUpdate" runat="server" 
                        ImageUrl="~/cms/images/btnUpdate.jpg" onclick="btnUpdate_Click"  />
                    </td>
                </tr>
                </table>
               
                
               
                
                    <asp:GridView ID="ViewProductAttributeGrid" runat="server" DataKeyNames="AttributeID" AllowPaging="True"
                                                Width="100%" AutoGenerateColumns="False"  
                                                 OnPageIndexChanging="ViewProductAttributeGrid_PageIndexChanging"
                                                BackColor="White" BorderColor="White" BorderStyle="Solid" 
                                                GridLines="Both" SkinID="WfhGrid" OnRowDataBound="ViewProductAttributeGrid_RowDataBound" >
                                                <PagerSettings FirstPageImageUrl="images/firstP.gif" 
                                                    FirstPageText="Move to first page" LastPageImageUrl="images/lastp.gif" 
                                                    LastPageText="Move to last page" Mode="NextPreviousFirstLast" 
                                                    NextPageImageUrl="images/nextP.gif" NextPageText="Move to next page" 
                                                    PreviousPageImageUrl="images/previousP.gif"  
                                                    PreviousPageText="Move to previous page" Visible="False" />
                                                    
                                                <Columns>
                                                <asp:TemplateField>
                                                <ItemTemplate><asp:HiddenField ID="hdnAttributeID" runat="server" Value='<%#Eval("AttributeID")%>' /></ItemTemplate>
                                                </asp:TemplateField>
                                                    <asp:BoundField DataField="ProductName" HeaderText="Product Name" NullDisplayText="-">
                                                        <ItemStyle VerticalAlign="Middle"/>
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="AttributeName" HeaderText="Attribute Name" NullDisplayText="-">
                                                        <ItemStyle VerticalAlign="Middle"/>
                                                    </asp:BoundField>
                                                    <asp:BoundField  DataField="AttributeValue" HeaderText="Attribute Value" NullDisplayText="-">
                                                        <ItemStyle VerticalAlign="Middle"/>
                                                    </asp:BoundField>
                                                    <asp:TemplateField HeaderText="IsActive">
                                                    <ItemTemplate>
                                                    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                                    <ContentTemplate>
                                                        <asp:CheckBox ID="chkisactive" runat="server" AutoPostBack="true"    /></ContentTemplate></asp:UpdatePanel></ItemTemplate>
                                                        
                                                   
                                                    </asp:TemplateField>
                                                    
                                                </Columns>
                                                <PagerStyle HorizontalAlign="Center" VerticalAlign="Middle" 
                                                    BorderStyle="None" />
                                                <HeaderStyle BackColor="#F2F2F2" Height="20px" HorizontalAlign="Center" VerticalAlign="Middle"
                                                    BorderColor="#CCCCCC" />
                                            </asp:GridView>
                  
                 <table width="100%">
                  <tr id="trP1" runat="server">
                                        <td align="center"><table border="0">
                                            <tr>
                                                <td><asp:ImageButton ID="btnfirst" ToolTip="Move to first page" ImageUrl="images/firstP.gif"  
                                                        runat="server" onclick="btnfirst_Click" /></td>
                                                <td width="25px"></td>
                                                <td><asp:ImageButton ID="btnprevious" ToolTip="Move to previous page" ImageUrl="images/previousP.gif" 
                                                        runat="server" onclick="btnprevious_Click"  /></td>
                                                <td width="25px"></td>
                                                <td><asp:Label ID="Lbl_paging" Font-Bold="true" runat="server" Text=''></asp:Label></td>
                                                <td width="25px"></td>
                                                <td><asp:ImageButton ID="btnnext" ToolTip="Move to next page" 
                                                        ImageUrl="images/nextP.gif" runat="server" onclick="btnnext_Click" 
                                                        /></td>
                                                <td width="25px"></td>
                                                <td><asp:ImageButton ID="btnlast" ToolTip="Move to last page" 
                                                        ImageUrl="images/lastp.gif" runat="server" 
                                                         style="height: 16px; width: 16px;" onclick="btnlast_Click" /></td>
                                                
                                            </tr>
                                        </table></td></tr>
                              
                                    <tr>
                                        <td align="center">
                                            <asp:Label ID="Lbl_rc" runat="server" Text="" Font-Bold="true"></asp:Label>
                                        </td>
                                    </tr>
                              
                                    <tr>
                                        <td align="center">
                                            
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