<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ViewPlan.aspx.cs" Inherits="cms_ViewPlan" Theme="SkinFile" StylesheetTheme="SkinFile" %>


<%@ Register Src="UserControls/LeftMenu.ascx" TagName="LeftMenu" TagPrefix="uc1" %>
<%@ Register src="UserControls/Header.ascx" tagname="Header" tagprefix="uc2" %>
<%@ Register src="UserControls/Footer.ascx" tagname="Footer" tagprefix="uc3" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head id="Head1" runat="server">
    <title>View Plans - Pier Aqua Admin Panel</title>
    <meta http-equiv="content-type" content="text/html; charset=iso-8859-1" />
    <link rel="stylesheet" type="text/css" href="style/style.css" />
    <link rel="stylesheet" type="text/css" href="style/colour1.css" />
  
    <style type="text/css">
        .style4
        {
            width: 144px;
        }
        .invisible
        {
            width:0px;
            display:none;
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
                <h1>View All Plans</h1>
                <table width="100%">
                <tr>
                <td class="style4"></td>
                <td>
                    <asp:Label ID="lblmsg" runat="server"></asp:Label>
                    </td>
                <td></td>
                </tr>
                </table>
               
                
                
                
                    <asp:GridView ID="ViewPlanGrid" runat="server" DataKeyNames="PlanID" AllowPaging="True"
                                                Width="100%" AutoGenerateColumns="False"  
                                                OnRowCommand="ViewPlanGrid_RowCommand" OnPageIndexChanging="ViewPlanGrid_PageIndexChanging"
                                                BackColor="White" BorderColor="White" BorderStyle="Solid" 
                                                GridLines="Both" SkinID="WfhGrid"   >
                                                <PagerSettings FirstPageImageUrl="images/firstP.gif" 
                                                    FirstPageText="Move to first page" LastPageImageUrl="images/lastp.gif" 
                                                    LastPageText="Move to last page" Mode="NextPreviousFirstLast" 
                                                    NextPageImageUrl="images/nextP.gif" NextPageText="Move to next page" 
                                                    PreviousPageImageUrl="images/previousP.gif"  
                                                    PreviousPageText="Move to previous page" Visible="False" />
                                                <Columns>
                                                <asp:TemplateField ><ItemTemplate><asp:HiddenField ID="hdnPlanId" Value='<%#Eval("PlanID")%>' runat="server" /></ItemTemplate></asp:TemplateField>
                                               
                                                    
                                                    <asp:BoundField  DataField="PlanName" HeaderText="Plan Name" NullDisplayText="-">
                                                        <ItemStyle VerticalAlign="Middle"/>
                                                    </asp:BoundField>
                                                    <asp:TemplateField HeaderText="Plan Type">
                                                        <ItemTemplate>
                                                            <asp:Label ID="grdlblPlan_Type" runat="server" ><%#Eval("PlanType")%></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:BoundField DataField="PlanValidity" HeaderText="Plan Validity(Days)" NullDisplayText="-">
                                                        <ItemStyle VerticalAlign="Middle"/>
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="PricePerContactUSD" DataFormatString="{0:F2}" HeaderText="Price/Contact" NullDisplayText="-">
                                                        <ItemStyle VerticalAlign="Middle"/>
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="ContactsCount" HeaderText="Contact Count" NullDisplayText="-">
                                                        <ItemStyle VerticalAlign="Middle"/>
                                                    </asp:BoundField>
                                                    <asp:BoundField  DataField="INRPrice" HeaderText="INR Price" DataFormatString="{0:F2}" NullDisplayText="-">
                                                        <ItemStyle VerticalAlign="Middle"/>
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="USDPrice" HeaderText="USD Price" DataFormatString="{0:F2}" NullDisplayText="-">
                                                        <ItemStyle VerticalAlign="Middle"/>
                                                    </asp:BoundField>
                                                     
                                                    <asp:CheckBoxField DataField="IsActive" HeaderText="IsActive" />
                                                     <asp:ButtonField ButtonType="Image" CommandName="PlanEdit" HeaderText="Update Details" ImageUrl="images/edit1.png"
                                                         Text="Click to View the details" >
                                                       <ItemStyle VerticalAlign="Middle"/>
                                                    </asp:ButtonField>
                                                    
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
                              
                                    <tr>
                                        <td align="left">
                                            
                                            <b>Plan Types</b> : 0(Seller),1(Buyer),2(Both)
                                            
                                        </td>
                                    </tr>
                              
                                    <tr>
                                        <td align="center">
                                            
                                            &nbsp;</td>
                                    </tr>
                              
                                    <tr>
                                        <td align="center">
                                            
                                            &nbsp;</td>
                                    </tr>
                              
                                    <tr>
                                        <td align="center">
                                            
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