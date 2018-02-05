<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ViewProducts.aspx.cs" Inherits="cms_ViewProducts" StylesheetTheme="SkinFile" Theme="SkinFile" %>

<%@ Register Src="UserControls/LeftMenu.ascx" TagName="LeftMenu" TagPrefix="uc1" %>
<%@ Register src="UserControls/Header.ascx" tagname="Header" tagprefix="uc2" %>
<%@ Register src="UserControls/Footer.ascx" tagname="Footer" tagprefix="uc3" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head id="Head1" runat="server">
    <title>View Suppliers Products - Pier Aqua Admin Panel</title>
    <meta http-equiv="content-type" content="text/html; charset=iso-8859-1" />
    <link rel="stylesheet" type="text/css" href="style/style.css" />
    <link rel="stylesheet" type="text/css" href="style/colour1.css" />
  
    <style type="text/css">
        .invisible
        {
            width:0px;
            display:none;
        }
        .style1
        {
            width: 505px;
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
                <h1>View Sellers Products</h1>
                <table width="100%">
                <tr>
                <td align="right" >&nbsp;</td>
                <td>
                    &nbsp;</td>
                    <td class="style1">
                        <asp:ValidationSummary ID="ValidationSummary1" runat="server" 
                            ValidationGroup="valgrpsearch" ForeColor="Red" />
                    </td>
                <td>&nbsp;</td>
                </tr>
                <tr>
                <td align="right" >Search</td>
                <td>
                    :</td>
                    <td class="style1">
                        <asp:TextBox ID="txtSearch" runat="server" CssClass="textbox" 
                            CausesValidation="True" ValidationGroup="search"></asp:TextBox></td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ControlToValidate="txtSearch" ErrorMessage="Enter Search Query" 
                        SetFocusOnError="True" ValidationGroup="valgrpsearch"  
                        Display="None"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                <td align="right" >Search Criteria</td>
                <td>
                    :</td>
                <td class="style1">
                    <asp:RadioButtonList ID="rdlSearchCriteria" runat="server" 
                        RepeatDirection="Horizontal" CausesValidation="True" 
                        ValidationGroup="search">
                        <asp:ListItem Value="0">CategoryName</asp:ListItem>
                        <asp:ListItem Value="1">ProductName</asp:ListItem>
                        <asp:ListItem Value="2">SellerName</asp:ListItem>
                    </asp:RadioButtonList>
                    </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                        ControlToValidate="rdlSearchCriteria" ErrorMessage="Enter Search Criteria" 
                        SetFocusOnError="True" ValidationGroup="valgrpsearch"  
                        Display="None"></asp:RequiredFieldValidator>
                            </td>
                </tr>
                <tr>
                <td>&nbsp;</td>
                <td>
                    &nbsp;</td>
                <td class="style1">
                    <asp:ImageButton ID="btnSearch" runat="server" 
                        ImageUrl="~/cms/images/SEARCH.jpg" ValidationGroup="valgrpsearch" onclick="btnSearch_Click"  
                        />
                    </td>
                <td>&nbsp;</td>
                </tr>
                <tr>
                <td ></td>
                <td>
                    &nbsp;</td>
                <td class="style1">
                    <asp:Label ID="lblmsg" runat="server"></asp:Label>
                    </td>
                <td></td>
                </tr>
                </table>
                
                
               
                
                    <asp:GridView ID="ViewProductGrid" runat="server" DataKeyNames="ProductID" AllowPaging="True"
                                                Width="100%" AutoGenerateColumns="False"  
                                                
                                                BackColor="White" BorderColor="White" BorderStyle="Solid" OnRowCommand="ViewProductGrid_RowCommand"
                                                GridLines="Both" SkinID="WfhGrid" >
                                                <PagerSettings FirstPageImageUrl="images/firstP.gif" 
                                                    FirstPageText="Move to first page" LastPageImageUrl="images/lastp.gif" 
                                                    LastPageText="Move to last page" Mode="NextPreviousFirstLast" 
                                                    NextPageImageUrl="images/nextP.gif" NextPageText="Move to next page" 
                                                    PreviousPageImageUrl="images/previousP.gif"  
                                                    PreviousPageText="Move to previous page" Visible="false" />
                                                <Columns>
                                                <asp:TemplateField  ><ItemTemplate><asp:HiddenField ID="hdnProductId" Value='<%#Eval("ProductID")%>' runat="server" /></ItemTemplate></asp:TemplateField>
                                                <asp:TemplateField  ><ItemTemplate><asp:HiddenField ID="hdnSupplierId" Value='<%#Eval("CustomerID")%>' runat="server" /></ItemTemplate></asp:TemplateField>
                                                  <asp:BoundField DataField="ProductName" HeaderText="Product Name" NullDisplayText="-">
                                                        <ItemStyle VerticalAlign="Middle"/>
                                                    </asp:BoundField>
                                                <asp:ButtonField ButtonType="Image" CommandName="ProductEdit" HeaderText="Edit Product" ImageUrl="images/edit1.png"
                                                         Text="Click to View the details" >
                                                       <ItemStyle VerticalAlign="Middle"/>
                                                    </asp:ButtonField>
                                                 <asp:ButtonField ButtonType="Image" CommandName="SupplierEdit" HeaderText="Edit Seller" ImageUrl="images/user1.png"
                                                         Text="Click to View the details" >
                                                       <ItemStyle VerticalAlign="Middle"/>
                                                    </asp:ButtonField>
                                                   
                                                   
                                                    <asp:CheckBoxField DataField="IsActive" HeaderText="IsActive" />
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
                                                        runat="server" OnClick="btnfirst_Click"  /></td>
                                                <td width="25px"></td>
                                                <td><asp:ImageButton ID="btnprevious" ToolTip="Move to previous page" ImageUrl="images/previousP.gif" 
                                                        runat="server" OnClick="btnprevious_Click"   /></td>
                                                <td width="25px"></td>
                                                <td><asp:Label ID="Lbl_paging" Font-Bold="true" runat="server" Text=''></asp:Label></td>
                                                <td width="25px"></td>
                                                <td><asp:ImageButton ID="btnnext" ToolTip="Move to next page" 
                                                        ImageUrl="images/nextP.gif" OnClick="btnnext_Click" runat="server"  
                                                        /></td>
                                                <td width="25px"></td>
                                                <td><asp:ImageButton ID="btnlast" ToolTip="Move to last page" 
                                                        ImageUrl="images/lastp.gif" runat="server" onclick="btnlast_Click"
                                                         style="height: 16px; width: 16px;" /></td>
                                                
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