<%@ Page Language="C#" AutoEventWireup="true" CodeFile="UpdateCustomer.aspx.cs" Inherits="cms_UpdateCustomer" StylesheetTheme="SkinFile" Theme="SkinFile" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<%@ Register Src="UserControls/LeftMenu.ascx" TagName="LeftMenu" TagPrefix="uc1" %>
<%@ Register src="UserControls/Header.ascx" tagname="Header" tagprefix="uc2" %>
<%@ Register src="UserControls/Footer.ascx" tagname="Footer" tagprefix="uc3" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Update Customers - Pier Aqua Admin Panel</title>
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
             width: 35px;
             height: 66px;
         }
         .style7
         {
             width: 179px;
             height: 66px;
         }
         .style8
         {
             width: 18px;
             height: 66px;
         }
         .style9
         {
             height: 66px;
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
                    Update Supplier/Buyer Profile</h1>
                    <asp:ScriptManager ID="ScriptManager1" runat="server">
                </asp:ScriptManager>
                <asp:FormView ID="UpdateCustomerView" runat="server" Width="100%" 
                    DataKeyNames="CustomerID" DataSourceID="SqlDataSource1" Height="417px">
                   <ItemTemplate>
                    <table width="100%">
                    
                    
                    <tr>
                        <td class="style3">
                            &nbsp;
                        </td>
                        <td class="style4">
                            First Name
                        </td>
                        <td class="style1">
                            :
                        </td>
                        <td colspan="2">
                          <%#Eval("FirstName")%>
                        </td>
                    </tr>
                    <tr>
                        <td class="style3">
                            &nbsp;
                        </td>
                        <td class="style4">
                            Last Name
                        </td>
                        <td class="style1">
                            :
                        </td>
                        <td colspan="2">
                          <%#Eval("LastName")%>
                        </td>
                    </tr>
                    <tr>
                        <td class="style3">
                            &nbsp;
                        </td>
                        <td class="style4">
                            Gender
                        </td>
                        <td class="style1">
                            :
                        </td>
                        <td colspan="2">
                            <asp:RadioButtonList ID="rdlCustomerGender" Enabled="false" runat="server" RepeatDirection="Horizontal">
                            <asp:ListItem Text="Male" Value="1" ></asp:ListItem>
                            <asp:ListItem Text="Female" Value="0"></asp:ListItem>
                            </asp:RadioButtonList>
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
                           Mobile
                        </td>
                        <td class="style1">
                            :
                        </td>
                        <td colspan="2" >
                          <%#Eval("Mobile")%>
                        </td>
                        
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
                          Customer Type
                        </td>
                        <td class="style1">
                            :
                        </td>
                        <td colspan="2" >
                        <asp:UpdatePanel ID="UpdatePanel2" runat="server" ChildrenAsTriggers="true" UpdateMode="Always">
                        <ContentTemplate>
                            <asp:RadioButtonList ID="rdlCustomerType" Enabled="false" runat="server" RepeatDirection="Horizontal">
                                <asp:ListItem Text="Supplier" Value="0"></asp:ListItem>
                                <asp:ListItem Text="Buyer" Value="1"></asp:ListItem>
                                <asp:ListItem Text="Other" Value="2"></asp:ListItem>
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
                           Job Title
                        </td>
                        <td class="style1">
                            :
                        </td>
                        <td colspan="2" >
                          <%#Eval("JobTitle")%>
                        </td>
                        
                    </tr>
                     <tr>
                        <td class="style3">
                            &nbsp;
                        </td>
                        <td class="style4">
                            Customer's Plan
                        </td>
                        <td class="style1">
                            :
                        </td>
                        <td >
                          <%#Eval("BuyerPlan")%> 
                          </td>
                          <td>
                            <asp:HyperLink ID="buyertosupplierhyperlink" runat="server">View Added Contacts</asp:HyperLink>
                        </td>
                        
                    </tr>
                    <tr>
                        <td class="style3">
                            &nbsp;
                        </td>
                        <td class="style4">
                            Buyer's Plan
                        </td>
                        <td class="style1">
                            :
                        </td>
                        <td >
                         <asp:HyperLink ID="planhistorylink" runat="server">View Plan History</asp:HyperLink>
                          </td>
                          <td>
                           &nbsp;
                        </td>
                        
                    </tr>
                    <tr>
                        <td class="style3">
                            &nbsp;
                        </td>
                        <td class="style4">
                            Company
                        </td>
                        <td class="style1">
                            :
                        </td>
                        <td colspan="2" >
                            <asp:HyperLink ID="companyhyperlink" runat="server">Click</asp:HyperLink>
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
                            <asp:RadioButtonList ID="rdlIsActive" runat="server" 
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
                            <asp:HiddenField ID="hdnIsActive" runat="server" Value='<%#Eval("IsActive")%>' />
                        </td>
                        <td class="style4">
                             <asp:HiddenField ID="hdnCustomerType" runat="server" Value='<%#Eval("CustomerType")%>' />
                        </td>
                        <td class="style1">
                            <asp:HiddenField ID="hdnGender" runat="server" Value='<%#Eval("Gender")%>' />
                        </td>
                        <td colspan="2">
                          
                        </td>
                    </tr>
                    
                   
                    </table>
                    </ItemTemplate>
                    
                    </asp:FormView>
                    <table width="100%">
                    <tr>
                        <td class="style6">
                            </td>
                        <td class="style7">
                            </td>
                        <td class="style8">
                            </td>
                        <td align="left" colspan="2" class="style9">
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
                    
                    
                    
                    SelectCommand="select s.*,dbo.GetBuyPlanName(s.CustomerID) &quot;BuyerPlan&quot; from Customers  s  where s.CustomerID=@customerid">
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
