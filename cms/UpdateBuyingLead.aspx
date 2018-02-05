<%@ Page Language="C#" AutoEventWireup="true" CodeFile="UpdateBuyingLead.aspx.cs" Inherits="cms_UpdateBuyingLead" StylesheetTheme="SkinFile" Theme="SkinFile" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<%@ Register Src="UserControls/LeftMenu.ascx" TagName="LeftMenu" TagPrefix="uc1" %>
<%@ Register src="UserControls/Header.ascx" tagname="Header" tagprefix="uc2" %>
<%@ Register src="UserControls/Footer.ascx" tagname="Footer" tagprefix="uc3" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Update BuyingLead - Pier Aqua</title>
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
                    Update Buying Leads</h1>
                <asp:ScriptManager ID="ScriptManager1" runat="server">
                </asp:ScriptManager>
                <asp:FormView ID="UpdateBuyingLeadView" runat="server" Width="100%" DataKeyNames="BuyingLeadID" DataSourceID="SqlDataSource1">
                   <ItemTemplate>
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
                           <asp:HiddenField ID="hdnIsActive" runat="server" Value='<%#Eval("IsActive")%>' />
                        </td>
                    </tr>
                    
                    
                    <tr>
                        <td class="style3">
                            &nbsp;
                        </td>
                        <td class="style4">
                            Product Name
                        </td>
                        <td class="style1">
                            :
                        </td>
                        <td colspan="2">
                          <%#Eval("ProductName")%>
                        </td>
                    </tr>
                    <tr>
                        <td class="style3">
                            &nbsp;
                        </td>
                        <td class="style4">
                            Category Name
                        </td>
                        <td class="style1">
                            :
                        </td>
                        <td colspan="2">
                          <%#Eval("CategoryName")%>
                        </td>
                    </tr>
                    <tr>
                        <td class="style3">
                            &nbsp;
                        </td>
                        <td class="style4">
                            Buyer Name
                        </td>
                        <td class="style1">
                            :
                        </td>
                        <td colspan="2">
                           <%#Eval("BuyerName")%> 
                        </td>
                    </tr>
                    <tr>
                        <td class="style3">
                            &nbsp;
                        </td>
                        <td class="style4">
                            Brief Description
                        </td>
                        <td class="style1">
                            :
                        </td>
                        <td colspan="2">
                            <asp:HyperLink ID="briefdescriptionhyperlink" Target="_blank" runat="server">Click</asp:HyperLink>
                        </td>
                    </tr>
                    <tr>
                        <td class="style3">
                            &nbsp;
                        </td>
                        <td class="style4">
                            Expire Duration
                        </td>
                        <td class="style1">
                            :
                        </td>
                        <td colspan="2">
                          <%#Eval("ExpireDuration")%>
                        </td>
                    </tr>
                    <tr>
                        <td class="style3">
                            &nbsp;
                        </td>
                        <td class="style4">
                            Contact Email
                        </td>
                        <td class="style1">
                            :
                        </td>
                        <td colspan="2">
                          <%#Eval("ContactEmail")%>
                        </td>
                    </tr>
                    <tr>
                        <td class="style3">
                            &nbsp;
                        </td>
                        <td class="style4">
                            Product Photo
                        </td>
                        <td class="style1">
                            :
                        </td>
                        <td colspan="2">
                            <asp:HyperLink ID="productphotohyperlink" Target="_blank" runat="server">Click</asp:HyperLink>  
                        </td>
                    </tr>
                    <tr>
                        <td class="style3">
                            &nbsp;
                        </td>
                        <td class="style4">
                            Price Range
                        </td>
                        <td class="style1">
                            :
                        </td>
                        <td colspan="2">
                          <%#Eval("PriceLow")%> to <%#Eval("PriceHigh")%>  
                        </td>
                    </tr>
                    <tr>
                        <td class="style3">
                            &nbsp;
                        </td>
                        <td class="style4">
                            Currency
                        </td>
                        <td class="style1">
                            :
                        </td>
                        <td colspan="2" >
                          <%#Eval("Currency")%>
                        </td>
                        
                    </tr>
                    <tr>
                        <td class="style3">
                            &nbsp;
                        </td>
                        <td class="style4">
                            Quantity Required
                        </td>
                        <td class="style1">
                            :
                        </td>
                        <td colspan="2" >
                          <%#Eval("QuantityRequired")%>
                        </td>
                       
                    </tr>
                    <tr>
                        <td class="style3">
                            &nbsp;
                        </td>
                        <td class="style4">
                            Quantity Unit
                        </td>
                        <td class="style1">
                            :
                        </td>
                        <td colspan="2" >
                          <%#Eval("QuantityUnit")%>
                        </td>
                        
                    </tr>
                     <tr>
                        <td class="style3">
                            &nbsp;
                        </td>
                        <td class="style4">
                            Annual Purchase Volume
                        </td>
                        <td class="style1">
                            :
                        </td>
                        <td colspan="2" >
                          <%#Eval("AnnualPurchaseVolume")%>
                        </td>
                        
                    </tr>
                     <tr>
                        <td class="style3">
                            &nbsp;
                        </td>
                        <td class="style4">
                            FOB Unit Price
                        </td>
                        <td class="style1">
                            :
                        </td>
                        <td colspan="2" >
                          <%#Eval("FOBUnitPrice")%>
                        </td>
                        
                    </tr>
                     <tr>
                        <td class="style3">
                            &nbsp;
                        </td>
                        <td class="style4">
                            FOB Currency
                        </td>
                        <td class="style1">
                            :
                        </td>
                        <td colspan="2" >
                          <%#Eval("FOBCurrency")%>
                        </td>
                        
                    </tr>
                    <tr>
                        <td class="style3">
                            &nbsp;
                        </td>
                        <td class="style4">
                            FOB Destination Port
                        </td>
                        <td class="style1">
                            :
                        </td>
                        <td colspan="2" >
                          <%#Eval("FOBDestinationPort")%>
                        </td>
                        
                    </tr>
                     <tr>
                        <td class="style3">
                            &nbsp;
                        </td>
                        <td class="style4">
                            Shipping Terms
                        </td>
                        <td class="style1">
                            :
                        </td>
                        <td colspan="2" >
                          <%#Eval("ShippingTerms")%>
                        </td>
                        
                    </tr>
                      <tr>
                        <td class="style3">
                            &nbsp;
                        </td>
                        <td class="style4">
                            Payment Terms
                        </td>
                        <td class="style1">
                            :
                        </td>
                        <td colspan="2" >
                          <%#Eval("PaymentTerms")%>
                        </td>
                        
                    </tr>
                    <tr>
                        <td class="style3">
                            &nbsp;
                        </td>
                        <td class="style4">
                            Approved Date
                        </td>
                        <td class="style1">
                            :
                        </td>
                        <td colspan="2" >
                          <%#Eval("ApprovedDate","{0:dd-MM-yyyy}")%>
                        </td>
                        
                    </tr>
                    <tr>
                        <td class="style3">
                            &nbsp;
                        </td>
                        <td class="style4">
                          Required Certification
                        </td>
                        <td class="style1">
                            :
                        </td>
                        <td colspan="2" >
                          <asp:HyperLink ID="requiredcertificationhyperlink" Target="_blank" runat="server">Click</asp:HyperLink>
                        </td>
                        
                    </tr>
                     
                     
                     
                    
                    
                     <tr>
                        <td class="style3">
                            &nbsp;</td>
                        <td class="style4">
                            IsActive</td>
                        <td class="style1">
                            :</td>
                        <td align="left" class="style5" colspan="2">
                            <asp:UpdatePanel ChildrenAsTriggers="true" UpdateMode="Always" ID="UpdatePanel1" runat="server">
                           <ContentTemplate>
                            <asp:RadioButtonList ID="RadioButtonList1" runat="server" 
                                RepeatDirection="Horizontal" AutoPostBack="True">
                            <asp:ListItem Text="True" Value="1">
                            </asp:ListItem>
                            <asp:ListItem Text="False" Value="0"></asp:ListItem>
                            </asp:RadioButtonList>
                            </ContentTemplate>
                             </asp:UpdatePanel>    
                        </td>
                    </tr>
                    </table>
                    </ItemTemplate>
                    
                    </asp:FormView>
                    <table width="100%">
                    <tr>
                        <td class="style3">
                            &nbsp;</td>
                        <td class="style4">
                            &nbsp;</td>
                        <td class="style1">
                            &nbsp;</td>
                        <td align="left" colspan="2">
                            <asp:ImageButton ID="btnUpdate" runat="server" 
                                ImageUrl="images/btnUpdate.jpg"  TabIndex="10" onclick="btnUpdate_Click" 
                                />
                                <asp:ImageButton ID="btnCancel" runat="server" 
                                ImageUrl="images/btnCencel.jpg"  TabIndex="11" CausesValidation="false" onclick="btnCancel_Click"   
                                />
                        </td>
                      
                    </tr>
                    </table>    
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:PierAqua1ConnectionString %>" 
                    
                    
                    
                    SelectCommand="select s.*,dbo.GetCustomerName(s.CustomerID) as &quot;BuyerName&quot;,dbo.GetCategoryName(s.CategoryID) as &quot;CategoryName&quot;  from BuyingLeads s where s.BuyingLeadID=@buyingleadid">
                    <SelectParameters>
                        <asp:QueryStringParameter Name="buyingleadid" QueryStringField="buyingleadid" />
                    </SelectParameters>
                </asp:SqlDataSource>              
            </div>
        </div>
        <uc3:Footer ID="Footer1" runat="server" />
        </div>
    </form>
</body>
</html>
