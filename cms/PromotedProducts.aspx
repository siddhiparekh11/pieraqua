<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PromotedProducts.aspx.cs" Inherits="cms_PromotedProducts" StylesheetTheme="SkinFile" Theme="SkinFile" %>

<%@ Register Src="UserControls/LeftMenu.ascx" TagName="LeftMenu" TagPrefix="uc1" %>
<%@ Register src="UserControls/Header.ascx" tagname="Header" tagprefix="uc2" %>
<%@ Register src="UserControls/Footer.ascx" tagname="Footer" tagprefix="uc3" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head id="Head1" runat="server">
    <title>Promoted Products - Pier Aqua Admin Panel</title>
    <meta http-equiv="content-type" content="text/html; charset=iso-8859-1" />
    <link rel="stylesheet" type="text/css" href="style/style.css" />
    <link rel="stylesheet" type="text/css" href="style/colour1.css" />
  
    <style type="text/css">
        .invisible
        {
            width:0px;
            display:none;
        }
        .style5
        {
            width: 147px;
        }
        .style6
        {
            width: 10px;
        }
        .style7
        {
            width: 111px;
        }
        </style>
<script type="text/javascript" src="../js/jquery-ui-1.8.11.custom.min.js"></script>
   
    </head>
<body>
    <form id="form1" runat="server" name="form1">
    
    <div id="main">
      <uc2:Header ID="Header1" runat="server" />
      <div id="site_content">
            <uc1:LeftMenu ID="LeftMenu1" runat="server" />
            <div id="content">
                <h1>View Promoted Products</h1>
                <table width="100%">
                <tr>
                <td class="style7">&nbsp;</td>
                <td class="style5" >
                    &nbsp;</td>
                <td class="style6">&nbsp;</td>
                <td>
                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" 
                        ValidationGroup="valgrpview" />
                    </td>
                
                </tr>
                <tr>
                <td class="style7">&nbsp;</td>
                <td class="style5" >
                    <asp:Label ID="lblmsg" runat="server"></asp:Label>
                    </td>
                <td class="style6">&nbsp;</td>
                <td>
                    <asp:ScriptManager ID="ScriptManager1" runat="server">
                    </asp:ScriptManager>
                    </td>
                
                </tr>
                <tr>
                <td class="style7">&nbsp;</td>
                <td class="style5" align="right" >Product Category </td>
                <td class="style6">:</td>
                <td>
                    <asp:DropDownList ID="DropDownList1" runat="server" Width="200px" 
                        DataSourceID="SqlDataSource1" DataTextField="CategoryName" 
                        DataValueField="CategoryID" CssClass="textbox">
                    </asp:DropDownList> 
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:PierAqua1ConnectionString %>" 
                        
                        
                        SelectCommand="select dbo.GetCategoryName(CategoryID) &quot;CategoryName&quot;,CategoryID from ProductCategory where ParentCategoryID !=0">
                    </asp:SqlDataSource>
                    </td>
                
                </tr>
                <tr>
                <td class="style7"></td>
                <td align="right">
                    Approved
                    Date</td>
                    <td>:</td>
                <td>
                    <asp:TextBox ID="txtStartDate" runat="server" ForeColor="Silver" >Start Date</asp:TextBox>
                    
                    &nbsp;
                    
                    <asp:TextBox ID="txtEndDate" runat="server" ForeColor="Silver"  
                        >End Date</asp:TextBox>
                    </td>
                </tr>
                <tr>
                <td class="style7">&nbsp;</td>
                <td colspan="2">
                    &nbsp;</td>
                <td>
                    <asp:ImageButton ID="btnViewProducts" runat="server" 
                        ImageUrl="~/cms/images/viewproducts.jpg" onclick="btnViewProducts_Click" 
                        ValidationGroup="valgrpview" />
                    </td>
                </tr>
                <tr>
                <td class="style7">&nbsp;</td>
                <td colspan="2">
                    &nbsp;</td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ControlToValidate="txtStartDate" Display="None" ErrorMessage="Enter Start Date" 
                        ValidationGroup="valgrpview"></asp:RequiredFieldValidator>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                        ControlToValidate="txtEndDate" Display="None" ErrorMessage="Enter End Date" 
                        ValidationGroup="valgrpview"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                <td class="style7" align="right"> <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Always" ChildrenAsTriggers="true">
                        <ContentTemplate>
                            <asp:CheckBox ID="chkselectall" TextAlign="Left" Text="Select All " 
                                runat="server" AutoPostBack="True" 
                                oncheckedchanged="chkselectall_CheckedChanged" />
                        </ContentTemplate>    
                     </asp:UpdatePanel></td>
                <td >
                <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Always"  ChildrenAsTriggers="true">
                    <ContentTemplate>
                        <asp:ImageButton ID="btnUpdate" runat="server" 
                            ImageUrl="~/cms/images/btnUpdate.jpg" onclick="btnUpdate_Click" 
                            CausesValidation="False" />
                    </ContentTemplate>
                    </asp:UpdatePanel>
                   </td>
                <td class="style6">&nbsp;</td>
                <td >
                   
                    &nbsp;
                    </td>
                </tr>
                </table>
               
                 
                
                
                    <asp:GridView ID="ViewPromotedGrid" runat="server" DataKeyNames="PromotionID" AllowPaging="True"
                                                Width="100%" AutoGenerateColumns="False"  
                                                 OnSelectedIndexChanged="ViewPromotedGrid_SelectedIndexChanged" OnPageIndexChanging="ViewPromotedGrid_PageIndexChanging"
                                                BackColor="White" BorderColor="White" BorderStyle="Solid" 
                                                GridLines="Both" SkinID="WfhGrid"  OnRowDataBound="ViewPromotedGrid_RowDataBound"
                    >
                                                <PagerSettings FirstPageImageUrl="images/firstP.gif" 
                                                    FirstPageText="Move to first page" LastPageImageUrl="images/lastp.gif" 
                                                    LastPageText="Move to last page" Mode="NextPreviousFirstLast" 
                                                    NextPageImageUrl="images/nextP.gif" NextPageText="Move to next page" 
                                                    PreviousPageImageUrl="images/previousP.gif"  
                                                    PreviousPageText="Move to previous page" Visible="False" />
                                                <Columns>
                                                <asp:TemplateField ><ItemTemplate><asp:HiddenField ID="hdnCustomerId" Value='<%#Eval("CustomerID")%>' runat="server" /></ItemTemplate>

<HeaderStyle></HeaderStyle>

<ItemStyle ></ItemStyle>
                                                                                                       </asp:TemplateField>
                                                 <asp:TemplateField  ><ItemTemplate><asp:HiddenField ID="hdnProductId" Value='<%#Eval("ProductID")%>' runat="server" /></ItemTemplate>

<HeaderStyle ></HeaderStyle>

<ItemStyle ></ItemStyle>
                                                                                                       </asp:TemplateField>
                                                 <asp:TemplateField ><ItemTemplate><asp:HiddenField ID="hdnPromotionId" Value='<%#Eval("PromotionID")%>' runat="server" /></ItemTemplate>

<HeaderStyle ></HeaderStyle>

<ItemStyle ></ItemStyle>
                                                                                                       </asp:TemplateField>
                                                
                                                    
                                                    
                                                   <asp:TemplateField HeaderText="Customer Name"><ItemTemplate>
                                                       <asp:HyperLink ID="customernamelink" runat="server"><%#Eval("CustomerName")%></asp:HyperLink></ItemTemplate></asp:TemplateField>
                                                   <asp:TemplateField HeaderText="Product Name"><ItemTemplate>
                                                       <asp:HyperLink ID="productnamelink" runat="server"><%#Eval("ProductName")%></asp:HyperLink></ItemTemplate></asp:TemplateField>
                                                    <asp:BoundField  DataField="ApprovedDate" DataFormatString="{0:dd-MMM-yyyy}" HeaderText="Approval Date" NullDisplayText="-">
                                                        <ItemStyle VerticalAlign="Middle"/>
                                                    </asp:BoundField>
                                                     <asp:BoundField  DataField="Duration" HeaderText="Duration(In Days)" NullDisplayText="-">
                                                        <ItemStyle VerticalAlign="Middle"/>
                                                    </asp:BoundField>
                                                    <asp:BoundField  DataField="DaysLeft" HeaderText="Days Left" NullDisplayText="-">
                                                        <ItemStyle VerticalAlign="Middle"/>
                                                    </asp:BoundField>
                                                  <asp:TemplateField HeaderText="IsActive">
                                                  <ItemTemplate>
                                                  <asp:UpdatePanel ID="UpdatePanel3" runat="server" ChildrenAsTriggers="true" UpdateMode="Always">
                                                  <ContentTemplate>
                                                      <asp:CheckBox runat="server" ID="chkisactive" AutoPostBack="true">
                                                      </asp:CheckBox>
                                                      </ContentTemplate>
                                                      </asp:UpdatePanel>
                                                      </ItemTemplate>
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
                                            <cc1:CalendarExtender runat="server" ID="CalendarExtender1" TargetControlID="txtStartDate" Format="dd-MM-yyyy" ></cc1:CalendarExtender>
                                            <cc1:CalendarExtender runat="server" ID="CalendarExtender2" TargetControlID="txtEndDate" Format="dd-MM-yyyy"></cc1:CalendarExtender>
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