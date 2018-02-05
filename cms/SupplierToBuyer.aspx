<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SupplierToBuyer.aspx.cs" Inherits="cms_SupplierToBuyer" StylesheetTheme="SkinFile" Theme="SkinFile" %>


<%@ Register Src="UserControls/LeftMenu.ascx" TagName="LeftMenu" TagPrefix="uc1" %>
<%@ Register src="UserControls/Header.ascx" tagname="Header" tagprefix="uc2" %>
<%@ Register src="UserControls/Footer.ascx" tagname="Footer" tagprefix="uc3" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head id="Head1" runat="server">
    <title>Buyer To Suppliers - Pier Aqua Admin Panel</title>
    <meta http-equiv="content-type" content="text/html; charset=iso-8859-1" />
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
             width: 179px;
         }
        .style5
        {
         }
        .style6
        {
            height: 20px;
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
                <h1>Seller to buyer</h1>
                <table width="100%">
               <tr>
                        <td class="style3">
                            &nbsp;
                        </td>
                        <td class="style4">
                            &nbsp;
                        </td>
                        <td class="style1">
                            &nbsp;
                        </td>
                        <td colspan="2">
                            <asp:Label ID="lblmsg" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style3">
                            &nbsp;
                        </td>
                        <td class="style4">
                            Seller Name</td>
                        <td class="style1">
                            :
                        </td>
                        <td class="style5">
                             <asp:Label ID="lblBuyerName" runat="server"></asp:Label>
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                     <tr>
                        <td class="style3">
                            &nbsp;
                        </td>
                        <td class="style4">
                            Plan Name</td>
                        <td class="style1">
                            :
                        </td>
                        <td class="style5">
                         <asp:Label ID="lblPlanName" runat="server"></asp:Label></td>
                        <td>&nbsp;</td>
                    </tr>
                     <tr>
                        <td class="style3">
                            &nbsp;
                        </td>
                        <td class="style4">
                            Total Plan Balance Left</td>
                        <td class="style1">
                            :
                        </td>
                        <td class="style5">
                         <asp:Label ID="lblTotalBalance" runat="server"></asp:Label>
                            &nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="style3">
                            &nbsp;
                        </td>
                        <td class="style4">
                            Active Status</td>
                        <td class="style1">
                            : 
                        </td>
                        <td class="style5">
                            <asp:Label ID="lblActiveStatus" runat="server"></asp:Label>
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="style3">
                            &nbsp;
                        </td>
                        <td class="style4">
                            &nbsp;</td>
                        <td class="style1">
                            &nbsp; 
                        </td>
                        <td class="style5">
                            &nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    </table>
                
                
               
                
                    <asp:GridView ID="ViewBuyerToSupplierGrid" runat="server" DataKeyNames="SerialID" AllowPaging="True"
                                                Width="100%" AutoGenerateColumns="False"  
                                                 OnPageIndexChanging="ViewBuyerToSupplierGrid_PageIndexChanging"
                                                BackColor="White" BorderColor="White" BorderStyle="Solid"
                                                GridLines="Both" SkinID="WfhGrid" >
                                                <PagerSettings FirstPageImageUrl="images/firstP.gif" 
                                                    FirstPageText="Move to first page" LastPageImageUrl="images/lastp.gif" 
                                                    LastPageText="Move to last page" Mode="NextPreviousFirstLast" 
                                                    NextPageImageUrl="images/nextP.gif" NextPageText="Move to next page" 
                                                    PreviousPageImageUrl="images/previousP.gif"  
                                                    PreviousPageText="Move to previous page" Visible="false" />
                                                <Columns>
                                             
               
                                                     <asp:BoundField DataField="BuyerName" HeaderText="Buyer Name" NullDisplayText="-">
                                                        <ItemStyle VerticalAlign="Middle"/>
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="ProductName" HeaderText="Buying Lead Name" NullDisplayText="-">
                                                        <ItemStyle VerticalAlign="Middle"/>
                                                    </asp:BoundField>
                                                   
                                                    
                                                    <asp:BoundField DataField="EffectiveDate" HeaderText="EffectiveDate" NullDisplayText="-">
                                                        <ItemStyle VerticalAlign="Middle"/>
                                                    </asp:BoundField>
                                                  
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
                                                        runat="server" OnClick="btnfirst_Click" /></td>
                                                <td width="25px"></td>
                                                <td><asp:ImageButton ID="btnprevious" ToolTip="Move to previous page" ImageUrl="images/previousP.gif" 
                                                        runat="server" OnClick="btnprevious_Click" /></td>
                                                <td width="25px"></td>
                                                <td><asp:Label ID="Lbl_paging" Font-Bold="true" runat="server" Text=''></asp:Label></td>
                                                <td width="25px"></td>
                                                <td><asp:ImageButton ID="btnnext" ToolTip="Move to next page" 
                                                        ImageUrl="images/nextP.gif" runat="server" onclick="btnnext_Click" 
                                                        /></td>
                                                <td width="25px"></td>
                                                <td><asp:ImageButton ID="btnlast" ToolTip="Move to last page" 
                                                        ImageUrl="images/lastp.gif" runat="server" onclick="btnlast_Click"
                                                         style="height: 16px; width: 16px;" /></td>
                                                
                                            </tr>
                                        </table></td></tr>
                              
                                    <tr>
                                        <td align="center" class="style6">
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