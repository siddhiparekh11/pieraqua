<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ViewBuyingLead.aspx.cs" Inherits="cms_ViewBuyingLeads" StylesheetTheme="SkinFile" Theme="SkinFile" %>


<%@ Register Src="UserControls/LeftMenu.ascx" TagName="LeftMenu" TagPrefix="uc1" %>
<%@ Register src="UserControls/Header.ascx" tagname="Header" tagprefix="uc2" %>
<%@ Register src="UserControls/Footer.ascx" tagname="Footer" tagprefix="uc3" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head id="Head1" runat="server">
    <title>View Buying Leads - Pier Aqua</title>
    <meta http-equiv="content-type" content="text/html; charset=iso-8859-1" />
    <link rel="stylesheet" type="text/css" href="style/style.css" />
    <link rel="stylesheet" type="text/css" href="style/colour1.css" />
  
        
    </head>
<body>
    <form id="form1" runat="server" name="form1">
    
    <div id="main">
      <uc2:Header ID="Header1" runat="server" />
      <div id="site_content">
            <uc1:LeftMenu ID="LeftMenu1" runat="server" />
            <div id="content">
                <h1>View Buying leads</h1>
                <table width="100%">
                <tr>
                <td >&nbsp;</td>
                 <td >&nbsp;</td>
                <td>
                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" 
                        ValidationGroup="search" ForeColor="Red" />
                    </td>
                <td>&nbsp;</td>
                </tr>
                <tr>
                <td align="right" >Search</td>
                 <td >:</td>
                <td>
                    <asp:TextBox ID="txtSearch" runat="server" CausesValidation="True" 
                        CssClass="textbox" ValidationGroup="search" Width="157px"></asp:TextBox>
                    </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ErrorMessage="Enter Search Query" ControlToValidate="txtSearch" 
                        Display="None" ValidationGroup="search"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                <td align="right" >Search Criteria</td>
                 <td >:</td>
                <td>
                    <asp:RadioButtonList ID="rdlSearchCriteria" runat="server" 
                        RepeatDirection="Horizontal" CausesValidation="True" 
                        ValidationGroup="search">
                        <asp:ListItem Value="0">CategoryName</asp:ListItem>
                        <asp:ListItem Value="1">ProductName</asp:ListItem>
                        <asp:ListItem Value="2">Buyer Name</asp:ListItem>
                    </asp:RadioButtonList>
                    </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                        ErrorMessage="Enter Search Criteria" ControlToValidate="rdlSearchCriteria" 
                        Display="None" ValidationGroup="search"></asp:RequiredFieldValidator>
                            </td>
                </tr>
                <tr>
                <td >&nbsp;</td>
                 <td >&nbsp;</td>
                <td>
                    <asp:ImageButton ID="btnSearch" runat="server" 
                        ImageUrl="~/cms/images/SEARCH.jpg"  
                        ValidationGroup="search" onclick="btnSearch_Click" />
                    </td>
                <td>&nbsp;</td>
                </tr>
                <tr>
                <td>&nbsp;</td>
                 <td >&nbsp;</td>
                <td>
                    <asp:Label ID="lblmsg" runat="server"></asp:Label>
                    </td>
                <td></td>
                </tr>
                </table>
                
                
               
                
                    <asp:GridView ID="ViewBuyingLeadsGrid" runat="server" DataKeyNames="BuyingLeadID" AllowPaging="True"
                                                Width="100%" AutoGenerateColumns="False"  
                                                
                                                BackColor="White" BorderColor="White" BorderStyle="Solid" OnRowCommand="ViewBuyingLeadsGrid_RowCommand"
                                                GridLines="Both" SkinID="WfhGrid" >
                                                <PagerSettings FirstPageImageUrl="images/firstP.gif" 
                                                    FirstPageText="Move to first page" LastPageImageUrl="images/lastp.gif" 
                                                    LastPageText="Move to last page" Mode="NextPreviousFirstLast" 
                                                    NextPageImageUrl="images/nextP.gif" NextPageText="Move to next page" 
                                                    PreviousPageImageUrl="images/previousP.gif"  
                                                    PreviousPageText="Move to previous page" Visible="false" />
                                                <Columns>
                                             
               <asp:TemplateField ><ItemTemplate><asp:HiddenField ID="hdnBuyingLeadId" Value='<%#Eval("BuyingLeadID")%>' runat="server" /></ItemTemplate></asp:TemplateField>
               <asp:TemplateField ><ItemTemplate><asp:HiddenField ID="hdnCustomerId" Value='<%#Eval("CustomerID")%>' runat="server" /></ItemTemplate></asp:TemplateField>
                                                <asp:ButtonField ButtonType="Image" CommandName="BuyerEdit" HeaderText="Edit Customer" ImageUrl="images/edit1.png"
                                                         Text="Click to View the details" >
                                                       <ItemStyle VerticalAlign="Middle"/>
                                                    </asp:ButtonField>
                                                 <asp:ButtonField ButtonType="Image" CommandName="BuyingLeadEdit" HeaderText="Edit BuyingLeads" ImageUrl="images/buyer1.png"
                                                         Text="Click to View the details" >
                                                       <ItemStyle VerticalAlign="Middle"/>
                                                    </asp:ButtonField>
                                                   
                                                   
                                                     <asp:BoundField DataField="ProductName" HeaderText="Product" NullDisplayText="-">
                                                        <ItemStyle VerticalAlign="Middle"/>
                                                    </asp:BoundField>
                                                     <asp:BoundField DataField="CategoryName" HeaderText="Product Category" NullDisplayText="-">
                                                        <ItemStyle VerticalAlign="Middle"/>
                                                    </asp:BoundField>
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
                                                        runat="server"  /></td>
                                                <td width="25px"></td>
                                                <td><asp:ImageButton ID="btnprevious" ToolTip="Move to previous page" ImageUrl="images/previousP.gif" 
                                                        runat="server"   /></td>
                                                <td width="25px"></td>
                                                <td><asp:Label ID="Lbl_paging" Font-Bold="true" runat="server" Text=''></asp:Label></td>
                                                <td width="25px"></td>
                                                <td><asp:ImageButton ID="btnnext" ToolTip="Move to next page" 
                                                        ImageUrl="images/nextP.gif" runat="server"  
                                                        /></td>
                                                <td width="25px"></td>
                                                <td><asp:ImageButton ID="btnlast" ToolTip="Move to last page" 
                                                        ImageUrl="images/lastp.gif" runat="server" 
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
                 <%--<cc1:TextBoxWatermarkExtender ID="TextBoxWatermarkExtender1" runat="server" 
                                                TargetControlID="searchbox" WatermarkText="Search...">
                                            </cc1:TextBoxWatermarkExtender>
                                            <cc1:TextBoxWatermarkExtender ID="TextBoxWatermarkExtender2" runat="server" 
                                                TargetControlID="txtStartDate" WatermarkText="--- Start Date ---">
                                            </cc1:TextBoxWatermarkExtender>
                                            <cc1:TextBoxWatermarkExtender ID="TextBoxWatermarkExtender3" runat="server" 
                                                TargetControlID="txtEndDate" WatermarkText="--- End Date ---">
                                            </cc1:TextBoxWatermarkExtender>
                                 <cc1:CalendarExtender ID="CalendarExtender1" runat="server" Format="dd-MMM-yyyy"
                                     TargetControlID="txtStartDate">
                                 </cc1:CalendarExtender>
                                 <cc1:CalendarExtender ID="CalendarExtender2" runat="server" 
                                     TargetControlID="txtEndDate" Format="dd-MMM-yyyy">
                                 </cc1:CalendarExtender>--%>
            </div>
        </div>
        <uc3:Footer ID="Footer1" runat="server" />
        </div>
    </form>
</body>
</html>