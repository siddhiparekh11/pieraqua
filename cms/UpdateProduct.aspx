<%@ Page Language="C#" AutoEventWireup="true" CodeFile="UpdateProduct.aspx.cs" Inherits="cms_UpdateProduct" StylesheetTheme="SkinFile" Theme="SkinFile" %>


<%@ Register Src="UserControls/LeftMenu.ascx" TagName="LeftMenu" TagPrefix="uc1" %>
<%@ Register src="UserControls/Header.ascx" tagname="Header" tagprefix="uc2" %>
<%@ Register src="UserControls/Footer.ascx" tagname="Footer" tagprefix="uc3" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Update Products - Pier Aqua Admin Panel</title>
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
                    Update Product</h1>
                <asp:ScriptManager ID="ScriptManager1" runat="server">
                </asp:ScriptManager>
                    <asp:FormView runat="server"  ID="UpdateProductView" DataKeyNames="ProductID" 
                    DataSourceID="SqlDataSource1" Width="100%" >
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
                            Product Name</td>
                        <td class="style1">
                            :
                        </td>
                        <td class="style5" colspan="2">
                            <%#Eval("ProductName")%></td>
                    </tr>
                    <tr>
                        <td class="style3">
                            &nbsp;
                        </td>
                        <td class="style4">
                            Category</td>
                        <td class="style1">
                            :
                        </td>
                        <td class="style5" colspan="2" id="CategoryName">
                            <%#Eval("CategoryName")%></td>
                    </tr>
                    <tr>
                        <td class="style3">
                            &nbsp;</td>
                        <td class="style4">
                            Search Keywords</td>
                        <td class="style1">
                            :</td>
                        <td class="style5" colspan="2" >
                            <%#Eval("SearchKeywords")%></td>
                    </tr>
                    <tr>
                        <td class="style3">
                            &nbsp;</td>
                        <td class="style4">
                            Product Attributes</td>
                        <td class="style1">
                            :</td>
                        <td class="style5" colspan="2" >
                            <asp:HyperLink runat="server" ID="productattributeslink">Click</asp:HyperLink></td>
                    </tr>
                    <tr>
                        <td class="style3">
                            &nbsp;</td>
                        <td class="style4">
                            Listing Description</td>
                        <td class="style1">
                            :</td>
                        <td class="style5" colspan="2" >
                            <asp:HyperLink runat="server" ID="listinghyperlink" Target="_blank">Click</asp:HyperLink></td>
                    </tr>
                    <tr>
                        <td class="style3">
                            &nbsp;</td>
                        <td class="style4">
                            Detailed Description</td>
                        <td class="style1">
                            :</td>
                        <td colspan="2">
                             <asp:HyperLink runat="server" ID="detailedhyperlink" Target="_blank">Click</asp:HyperLink></td> 
                        
                    </tr>
                   
                    <tr>
                        <td class="style3">
                            &nbsp;</td>
                        <td class="style4">
                            Minimum Order Quantity</td>
                        <td class="style1">
                            :</td>
                        <td colspan="2">
                            <%#Eval("MinimOrderQuantity")%></td> 
                        
                    </tr>
                   
                    <tr>
                        <td class="style3">
                            &nbsp;</td>
                        <td class="style4">
                            Order Unit</td>
                        <td class="style1">
                            :</td>
                        <td colspan="2">
                            <%#Eval("OrderUnit")%></td> 
                        
                    </tr>
                   
                    <tr>
                        <td class="style3">
                            &nbsp;</td>
                        <td class="style4">
                            Production Capacity</td>
                        <td class="style1">
                            :</td>
                        <td colspan="2">
                            <%#Eval("ProductionCapacity")%></td> 
                        
                    </tr>
                   
                    <tr>
                        <td class="style3">
                            &nbsp;</td>
                        <td class="style4">
                            Production Capacity Unit</td>
                        <td class="style1">
                            :</td>
                        <td colspan="2">
                            <%#Eval("ProductionCapacityUnit")%></td> 
                        
                    </tr>
                   
                    <tr>
                        <td class="style3">
                            &nbsp;</td>
                        <td class="style4">
                            Production Duration</td>
                        <td class="style1">
                            :</td>
                        <td colspan="2">
                            <%#Eval("ProductionCapacityDuration")%></td> 
                        
                    </tr>
                   
                    <tr>
                        <td class="style3">
                            &nbsp;</td>
                        <td class="style4">
                            Delivery Time</td>
                        <td class="style1">
                            :</td>
                        <td colspan="2">
                            <%#Eval("DeliveryTime")%></td> 
                        
                    </tr>
                   
                    <tr>
                        <td class="style3">
                            &nbsp;</td>
                        <td class="style4">
                            Packaging Details</td>
                        <td class="style1">
                            :</td>
                        <td colspan="2">
                            <%#Eval("PackagingDetails")%></td> 
                        
                    </tr>
                    <tr>
                        <td class="style3">
                            &nbsp;</td>
                        <td class="style4">
                            FOB Currency</td>
                        <td class="style1">
                            :</td>
                        <td colspan="2">
                            <%#Eval("FOBCurrency")%></td> 
                        
                    </tr>
                    <tr>
                        <td class="style3">
                            &nbsp;</td>
                        <td class="style4">
                            FOB Range</td>
                        <td class="style1">
                            :</td>
                        <td colspan="2">
                            <%#Eval("FOBMinRange")%>-<%#Eval("FOBMaxRange")%></td> 
                        
                    </tr>
                     <tr>
                        <td class="style3">
                            &nbsp;</td>
                        <td class="style4">
                            FOB Unit</td>
                        <td class="style1">
                            :</td>
                        <td colspan="2">
                            <%#Eval("FOBUnit")%></td> 
                        
                    </tr>
                    <tr>
                        <td class="style3">
                            &nbsp;</td>
                        <td class="style4">
                            FOB Port</td>
                        <td class="style1">
                            :</td>
                        <td colspan="2">
                            <%#Eval("FOBPort")%></td> 
                        
                    </tr>
                      <tr>
                        <td class="style3">
                            &nbsp;</td>
                        <td class="style4">
                            FOB Destination</td>
                        <td class="style1">
                            :</td>
                        <td colspan="2">
                            <%#Eval("FOBDestination")%></td> 
                        
                    </tr>
                    <tr>
                        <td class="style3">
                            &nbsp;</td>
                        <td class="style4">
                            Product Photo&nbsp;</td>
                        <td class="style1">
                            :</td>
                        <td align="left" class="style5" colspan="2">
                            <asp:HyperLink ID="productphotohyperlink" Target="_blank" runat="server">View Photos</asp:HyperLink>
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
                            IsActive</td>
                        <td class="style1">
                            :</td>
                        <td align="left" class="style5" colspan="2">
                        <asp:UpdatePanel ID="UpdatePanel1" runat="server" ChildrenAsTriggers="true" UpdateMode="Always">
                        <ContentTemplate>
                            <asp:RadioButtonList ID="RadioButtonList1" runat="server" 
                                RepeatDirection="Horizontal" AutoPostBack="True">
                            <asp:ListItem Text="True" Value="True">
                            </asp:ListItem>
                            <asp:ListItem Text="False" Value="False"></asp:ListItem>
                            </asp:RadioButtonList>   
                            </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                    </tr>
                   
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
                    <tr>
                        <td class="style3">
                            </td>
                        <td class="style4">
                            </td>
                        <td class="style1">
                            </td>
                        <td align="center" class="style5">
                            
                        </td>
                        <td>
                         <asp:Label runat="server" ID="lblmsg"></asp:Label>   </td>
                    </tr>
                    </table>
                    
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:PierAqua1ConnectionString %>" 
                                
                    
                    
                    SelectCommand="SELECT S.*,dbo.GetCategoryName(S.CategoryID) &quot;CategoryName&quot; FROM [Products]  S WHERE ([ProductID] = @ProductID)">
                                <SelectParameters>
                                    <asp:QueryStringParameter Name="ProductID" QueryStringField="productid" 
                                        Type="String" />
                                </SelectParameters>
                                
                            </asp:SqlDataSource>
                            
                            
            </div>
        </div>
        <uc3:Footer ID="Footer1" runat="server" />
        </div>
    </form>
</body>
</html>
