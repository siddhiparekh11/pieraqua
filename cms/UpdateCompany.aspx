<%@ Page Language="C#" AutoEventWireup="true" CodeFile="UpdateCompany.aspx.cs" Inherits="cms_UpdateCompany" StylesheetTheme="SkinFile" Theme="SkinFile" %>

<%@ Register Src="UserControls/LeftMenu.ascx" TagName="LeftMenu" TagPrefix="uc1" %>
<%@ Register src="UserControls/Header.ascx" tagname="Header" tagprefix="uc2" %>
<%@ Register src="UserControls/Footer.ascx" tagname="Footer" tagprefix="uc3" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Update Company - Pier Aqua Admin Panel</title>
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
                    Update Supplier/Buyer Company Profile</h1>
                <asp:ScriptManager ID="ScriptManager1" runat="server">
                </asp:ScriptManager>
                <asp:FormView ID="UpdateCompanyView" runat="server" Width="100%" DataKeyNames="CustomerID" DataSourceID="SqlDataSource1">
                   <ItemTemplate>
                    <table width="100%">
                     
                  
                    <tr>
                        <td class="style3">
                            &nbsp;
                        </td>
                        <td class="style4">
                            Company Name
                        </td>
                        <td class="style1">
                            :
                        </td>
                        <td colspan="2">
                           <%#Eval("CompanyName")%>
                        </td>
                    </tr>
                    <tr>
                        <td class="style3">
                            &nbsp;
                        </td>
                        <td class="style4">
                            Customer Name
                        </td>
                        <td class="style1">
                            :
                        </td>
                        <td colspan="2">
                          <%#Eval("CustomerName")%>
                        </td>
                    </tr>
                    <tr>
                        <td class="style3">
                            &nbsp;
                        </td>
                        <td class="style4">
                           Business Type
                        </td>
                        <td class="style1">
                            :
                        </td>
                        <td colspan="2">
                          <%#Eval("BusinessType")%>
                        </td>
                    </tr>
                    <tr>
                        <td class="style3">
                            &nbsp;
                        </td>
                        <td class="style4">
                           Brief Introduction
                        </td>
                        <td class="style1">
                            :
                        </td>
                        <td colspan="2" >
                            <asp:HyperLink ID="introductionhyperlink" Target="_blank" runat="server">Click</asp:HyperLink>
                        </td>
                        
                    </tr>
                    <tr>
                        <td class="style3">
                            &nbsp;
                        </td>
                        <td class="style4">
                            Seller Services
                        </td>
                        <td class="style1">
                            :
                        </td>
                        <td colspan="2">
                          <asp:Label id="lblSellerServices" runat="server" Text='<%#Eval("SupplierServices") %>'></asp:Label>
                        </td>
                    </tr>
                     <tr>
                        <td class="style3">
                            &nbsp;
                        </td>
                        <td class="style4">
                            Buyer Services
                        </td>
                        <td class="style1">
                            :
                        </td>
                        <td colspan="2">
                          <asp:Label id="lblBuyerServices" runat="server" Text='<%#Eval("BuyerServices") %>'></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style3">
                            &nbsp;
                        </td>
                        <td class="style4">
                            Street Address
                        </td>
                        <td class="style1">
                            :
                        </td>
                        <td colspan="2">
                          <%#Eval("StreetAddress")%>
                        </td>
                    </tr>
                    <tr>
                        <td class="style3">
                            &nbsp;
                        </td>
                        <td class="style4">
                            City
                        </td>
                        <td class="style1">
                            :
                        </td>
                        <td colspan="2">
                          <%#Eval("City")%>
                        </td>
                    </tr>
                    <tr>
                        <td class="style3">
                            &nbsp;
                        </td>
                        <td class="style4">
                            State
                        </td>
                        <td class="style1">
                            :
                        </td>
                        <td colspan="2">
                          <%#Eval("State")%>
                        </td>
                    </tr>
                    <tr>
                        <td class="style3">
                            &nbsp;
                        </td>
                        <td class="style4">
                            Country
                        </td>
                        <td class="style1">
                            :
                        </td>
                        <td colspan="2">
                          <%#Eval("Country")%>
                        </td>
                    </tr>
                    <tr>
                        <td class="style3">
                            &nbsp;
                        </td>
                        <td class="style4">
                            ZipCode
                        </td>
                        <td class="style1">
                            :
                        </td>
                        <td colspan="2">
                          <%#Eval("ZipCode")%>
                        </td>
                    </tr>
                    <tr>
                        <td class="style3">
                            &nbsp;
                        </td>
                        <td class="style4">
                            Country Code
                        </td>
                        <td class="style1">
                            :
                        </td>
                        <td >
                          <%#Eval("CountryCode")%>
                        </td>
                        <td>Phone Number</td>
                    </tr>
                    <tr>
                        <td class="style3">
                            &nbsp;
                        </td>
                        <td class="style4">
                            Area Code
                        </td>
                        <td class="style1">
                            :
                        </td>
                        <td >
                          <%#Eval("AreaCode")%>
                        </td>
                        <td>Phone Number</td>
                    </tr>
                    <tr>
                        <td class="style3">
                            &nbsp;
                        </td>
                        <td class="style4">
                            Number
                        </td>
                        <td class="style1">
                            :
                        </td>
                        <td >
                          <%#Eval("Number")%>
                        </td>
                        <td>Phone Number</td>
                    </tr>
                    
                     <tr>
                        <td class="style3">
                            &nbsp;
                        </td>
                        <td class="style4">
                           Email
                        </td>
                        <td class="style1">
                            :
                        </td>
                        <td colspan="2" >
                          <%#Eval("Email")%>
                        </td>
                        
                    </tr>
                     
                     <tr>
                        <td class="style3">
                            &nbsp;
                        </td>
                        <td class="style4">
                          Company Website
                        </td>
                        <td class="style1">
                            :
                        </td>
                        <td colspan="2" >
                            <%#Eval("CompanyWebsiteURL")%>
                        </td>
                        
                    </tr>
                     
                       <tr>
                        <td class="style3">
                            &nbsp;
                        </td>
                        <td class="style4">
                          Certification
                        </td>
                        <td class="style1">
                            :
                        </td>
                        <td colspan="2" >
                            <%#Eval("Certification")%>
                        </td>
                        
                    </tr> 
                    <tr>
                        <td class="style3">
                            &nbsp;
                        </td>
                        <td class="style4">
                          No. of Employees
                        </td>
                        <td class="style1">
                            :
                        </td>
                        <td colspan="2" >
                            <%#Eval("TotalNoOfEmployees")%>
                        </td>
                        
                    </tr>
                       <tr>
                        <td class="style3">
                            &nbsp;
                        </td>
                        <td class="style4">
                          Annual Sales Volume
                        </td>
                        <td class="style1">
                            :
                        </td>
                        <td colspan="2" >
                            <%#Eval("TotalAnnualSalesVolume")%>
                        </td>
                        
                    </tr>
                    <tr>
                        <td class="style3">
                            &nbsp;
                        </td>
                        <td class="style4">
                          Export Percentage
                        </td>
                        <td class="style1">
                            :
                        </td>
                        <td colspan="2" >
                            <%#Eval("ExportPercentage")%>
                        </td>
                        
                    </tr>
                    <tr>
                        <td class="style3">
                            &nbsp;
                        </td>
                        <td class="style4">
                          Main Markets
                        </td>
                        <td class="style1">
                            :
                        </td>
                        <td colspan="2" >
                            <%#Eval("MainMarkets")%>
                        </td>
                        
                    </tr>
                    <tr>
                        <td class="style3">
                            &nbsp;
                        </td>
                        <td class="style4">
                          Ownership Type
                        </td>
                        <td class="style1">
                            :
                        </td>
                        <td colspan="2" >
                            <%#Eval("Ownershiptype")%>
                        </td>
                        
                    </tr>
                    <tr>
                        <td class="style3">
                            &nbsp;
                        </td>
                        <td class="style4">
                          Registered Capital
                        </td>
                        <td class="style1">
                            :
                        </td>
                        <td colspan="2" >
                            <%#Eval("RegisteredCapital")%>
                        </td>
                        
                    </tr>
                    <tr>
                        <td class="style3">
                            &nbsp;
                        </td>
                        <td class="style4">
                          Legal Owner
                        </td>
                        <td class="style1">
                            :
                        </td>
                        <td colspan="2" >
                            <%#Eval("LegalOwner")%>
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
                        <asp:UpdatePanel ID="UpdatePanel1" runat="server" ChildrenAsTriggers="true" UpdateMode="Always">
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
                       <tr>
                        <td class="style3">
                            &nbsp;
                        </td>
                        <td class="style4">
                          Company Logo
                        </td>
                        <td class="style1">
                            :
                        </td>
                        <td colspan="2" >
                            <img src='<%#Eval("CompanyPhoto")%>' alt="no image" />
                        </td>
                        
                    </tr>
                    <tr>
                        <td class="style3">
                            <asp:HiddenField ID="hdnCompanyID" runat="server" Value='<%#Eval("CompanyID")%>' />
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
                    
                    
                    
                    SelectCommand="select s.*,dbo.GetCustomerName(s.CustomerID) &quot;CustomerName&quot; from Companies  s  where s.CustomerID=@customerid">
                    <SelectParameters>
                        <asp:QueryStringParameter Name="customerid" QueryStringField="customerid" />
                    </SelectParameters>
                </asp:SqlDataSource>              
            </div>
        </div>
        <uc3:Footer ID="Footer1" runat="server" />
        </div>
    </form>
</body>
</html>
