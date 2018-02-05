<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ViewTestimonial.aspx.cs" Inherits="cms_ViewTestimonial" StylesheetTheme="SkinFile" Theme="SkinFile" %>

<%@ Register Src="UserControls/LeftMenu.ascx" TagName="LeftMenu" TagPrefix="uc1" %>
<%@ Register src="UserControls/Header.ascx" tagname="Header" tagprefix="uc2" %>
<%@ Register src="UserControls/Footer.ascx" tagname="Footer" tagprefix="uc3" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head id="Head1" runat="server">
    <title>View Testimonials - Pier Aqua Admin Panel</title>
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
            width: 112px;
        }
        .style6
        {
            width: 5px;
        }
        .style7
        {
            width: 111px;
        }
        .style8
        {
            width: 111px;
            height: 31px;
        }
        .style9
        {
            width: 112px;
            height: 31px;
        }
        .style10
        {
            width: 5px;
            height: 31px;
        }
        .style11
        {
            height: 31px;
        }
        </style>

    <script src="../js/jquery-1.5.1.min.js" type="text/javascript"></script>

 
    </head>
<body>
    <form id="form1" runat="server" name="form1">
    
    <div id="main">
      <uc2:Header ID="Header1" runat="server" />
      <div id="site_content">
            <uc1:LeftMenu ID="LeftMenu1" runat="server" />
            <div id="content">
                <h1>View TestimonialS</h1>
                <table width="100%">
                <tr>
                <td class="style7">&nbsp;</td>
                <td class="style5" >
                    <asp:ScriptManager ID="ScriptManager1" runat="server">
                    </asp:ScriptManager>
                    </td>
                <td class="style6">&nbsp;</td>
                <td>
                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" 
                        ValidationGroup="search" ForeColor="Red" />
                    </td>
                
                </tr>
                <tr>
                <td class="style7">&nbsp;</td>
                <td class="style5" >&nbsp;</td>
                <td class="style6">&nbsp;</td>
                <td>
                    &nbsp;</td>
                
                </tr>
                <tr>
                <td class="style7">&nbsp;</td>
                <td class="style5" >&nbsp;</td>
                <td class="style6">&nbsp;</td>
                <td>
                    &nbsp;</td>
                
                </tr>
                <tr>
                <td class="style7">&nbsp;</td>
                <td class="style5" align="right" >Testimonial Type</td>
                <td class="style6">:</td>
                <td>
                    <asp:DropDownList ID="drpTestimonialType" runat="server" Width="122px" 
                        AppendDataBoundItems="True" ValidationGroup="search">
                        <asp:ListItem Value="0">Supplier</asp:ListItem>
                        <asp:ListItem Value="1">Buyer</asp:ListItem>
                        <asp:ListItem Value="2">Both</asp:ListItem>
                    </asp:DropDownList> 
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ControlToValidate="drpTestimonialType" ErrorMessage="Select Testimonial Type" 
                        ValidationGroup="search" Display="None"></asp:RequiredFieldValidator>
                    </td>
                
                </tr>
                <tr>
                <td class="style8"></td>
                <td class="style9" align="right" >Approved Date</td>
                <td class="style10">:</td>
                <td class="style11">
                    <asp:TextBox ID="txtStartDate" runat="server" ValidationGroup="search"></asp:TextBox>
&nbsp;<asp:TextBox ID="txtEndDate" runat="server" ValidationGroup="search" ></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                        ControlToValidate="txtStartDate" ErrorMessage="Enter Start Date" 
                        ValidationGroup="search" Display="None"></asp:RequiredFieldValidator>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                        ErrorMessage="Enter End Date" ControlToValidate="txtEndDate" 
                        Display="None" ValidationGroup="search"></asp:RequiredFieldValidator>
                    </td>
                
                </tr>
                <tr>
                <td class="style7"></td>
                <td colspan="2">
                    &nbsp;</td>
                <td>
                    <asp:ImageButton ID="btnView" runat="server" 
                        ImageUrl="~/cms/images/SEARCH.jpg" onclick="btnView_Click" 
                        ValidationGroup="search" />
                    </td>
                </tr>
                <tr>
                <td class="style7">&nbsp;</td>
                <td colspan="2">
                    &nbsp;</td>
                <td>
                    <asp:Label ID="lblmsg" runat="server"></asp:Label>
                    </td>
                </tr>
                </table>
               
                 
                
                
                    <asp:GridView ID="ViewTestimonialGrid" runat="server" DataKeyNames="TestimonialID" AllowPaging="True"
                                                Width="100%" AutoGenerateColumns="False" OnSelectedIndexChanged="ViewTestimonialGrid_SelectedIndexChanged" 
                                                OnRowCommand="ViewTestimonialGrid_RowCommand" OnPageIndexChanging="ViewTestimonialGrid_PageIndexChanging"
                                                BackColor="White" BorderColor="White" BorderStyle="Solid" 
                                                GridLines="Both" SkinID="WfhGrid" 
                     >
                                                <PagerSettings FirstPageImageUrl="images/firstP.gif" 
                                                    FirstPageText="Move to first page" LastPageImageUrl="images/lastp.gif" 
                                                    LastPageText="Move to last page" Mode="NextPreviousFirstLast" 
                                                    NextPageImageUrl="images/nextP.gif" NextPageText="Move to next page" 
                                                    PreviousPageImageUrl="images/previousP.gif"  
                                                    PreviousPageText="Move to previous page" Visible="False" />
                                                <Columns>
                                                <asp:TemplateField ><ItemTemplate><asp:HiddenField ID="hdnTestimonialId" Value='<%#Eval("TestimonialID")%>' runat="server" /></ItemTemplate>

                                                          
                                                    </asp:TemplateField>
                                                    <asp:TemplateField ><ItemTemplate><asp:HiddenField ID="hdnCustomerId" Value='<%#Eval("CustomerID")%>' runat="server" /></ItemTemplate>

                                                          
                                                    </asp:TemplateField>
                                                <asp:ButtonField ButtonType="Image" CommandName="TestimonialEdit" HeaderText="Update Testimonial" ImageUrl="images/edit1.png"
                                                         Text="Click to View the details" >
                                                       <ItemStyle VerticalAlign="Middle"/>
                                                    </asp:ButtonField>
                                                    
                                                    
                                                    <asp:BoundField  DataField="Testimonialtitle" HeaderText="Testimonial Title" NullDisplayText="-">
                                                        <ItemStyle VerticalAlign="Middle"/>
                                                    </asp:BoundField>
                                                   
                                                    <asp:TemplateField HeaderText="Customer Name">
                                                        <ItemTemplate>
                                                            <asp:HyperLink ID="hypcustomername" runat="server"><%#Eval("CustomerName")%></asp:HyperLink>
                                                        </ItemTemplate>
                                                        
                                                    </asp:TemplateField>
                                                   
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
                                            <cc1:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="txtStartDate"></cc1:CalendarExtender>
                                            <cc1:CalendarExtender ID="CalendarExtender2" runat="server" TargetControlID="txtEndDate"></cc1:CalendarExtender>
                                        </td>
                                    </tr>
                 </table>
                    <%#Eval("CustomerName")%>
            </div>
        </div>
        <uc3:Footer ID="Footer1" runat="server" />
        </div>
    </form>
</body>
</html>