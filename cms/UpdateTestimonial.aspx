<%@ Page Language="C#" AutoEventWireup="true" CodeFile="UpdateTestimonial.aspx.cs" Inherits="cms_UpdateTestimonial" StylesheetTheme="SkinFile" Theme="SkinFile" %>


<%@ Register Src="UserControls/LeftMenu.ascx" TagName="LeftMenu" TagPrefix="uc1" %>
<%@ Register src="UserControls/Header.ascx" tagname="Header" tagprefix="uc2" %>
<%@ Register src="UserControls/Footer.ascx" tagname="Footer" tagprefix="uc3" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Update Testimonial- Pier Aqua Admin Panel</title>
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
            width: 100px;
        }
        .style5
        {
            width: 65px;
        }
    </style>

   
    <script src="../js/ddaccordion.js" type="text/javascript"></script>
    <script src="../js/jquery-1.5.1.min.js" type="text/javascript"></script>
    <%--<script type="text/javascript">
        $(document).ready(function() {
            $('#txtPlan_Validity').keypress(function(e) {
                if (e.which != 8 && e.which != 0 && e.which!=46 && (e.which < 48 || e.which > 57)) {
                    return false
                }
                 });
             
            
             $('#txtINRPrice').keypress(function(e) {
             if (e.which != 8 && e.which != 0 && e.which != 46 && (e.which < 48 || e.which > 57)) {
                         return false
                     }
                 });

                 $('#txtUSDPrice').keypress(function(e) {
                 if (e.which != 8 && e.which != 0 && e.which != 46 && (e.which < 48 || e.which > 57)) {
                         return false
                     }
                 });
             }); 
    </script>--%>
</head>
<body>
    <form id="form1" runat="server">
    <div id="main">
      <uc2:Header ID="Header1" runat="server" />
      <div id="site_content">
            <uc1:LeftMenu ID="LeftMenu1" runat="server" />
            <div id="content">
                <h1>
                    update Testimonial</h1>
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
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" 
                                ValidationGroup="valgrpupdate" />
                            <asp:Label ID="lblmsg" runat="server"></asp:Label>
                        </td>
                    </tr>
                    
                    <tr>
                        <td class="style3">
                            &nbsp;
                        </td>
                        <td class="style4">
                            Title</td>
                        <td class="style1">
                            :
                        </td>
                        <td class="style5">
                            <asp:TextBox ID="txtTestimonialTitle" runat="server" CssClass="textbox" Width="291px" 
                                TabIndex="2" Height="79px" TextMode="MultiLine"></asp:TextBox>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                ControlToValidate="txtTestimonialTitle" Display="None" ErrorMessage="Enter FAQ Question" 
                                SetFocusOnError="True" ValidationGroup="valgrpupdate"></asp:RequiredFieldValidator>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="style3">
                            &nbsp;</td>
                        <td class="style4">
                            Text</td>
                        <td class="style1">
                            :</td>
                        <td >
                            <asp:TextBox ID="txtTestimonialText" runat="server" CssClass="textbox" 
                                height="188px" Width="438px"
                                 TabIndex="6" TextMode="MultiLine"></asp:TextBox>
                            </td> 
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                ControlToValidate="txtTestimonialText" Display="None" ErrorMessage="Enter FAQ Answer" 
                                SetFocusOnError="True" ValidationGroup="valgrpupdate"></asp:RequiredFieldValidator>
                            &nbsp;</td>
                    </tr>
                   
                    
                   
                    <tr>
                        <td class="style3">
                            &nbsp;</td>
                        <td class="style4">
                            Customer Type</td>
                        <td class="style1">
                            :</td>
                        <td align="left" colspan="2">
                            <asp:RadioButtonList ID="rdlCustomerType" runat="server" 
                                RepeatDirection="Horizontal" Enabled="False">
                                <asp:ListItem Value="0">Seller</asp:ListItem>
                                <asp:ListItem Value="1">Buyer</asp:ListItem>
                                <asp:ListItem Value="2">Both</asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                      
                    </tr>
                   
                    
                   
                    <tr>
                        <td class="style3">
                            &nbsp;</td>
                        <td class="style4">
                            Customer Name</td>
                        <td class="style1">
                            :</td>
                        <td align="left" colspan="2">
                            <asp:Label ID="lblcustomername" runat="server" Text="Label"></asp:Label>
                        </td>
                      
                    </tr>
                   
                    
                   
                    <tr>
                        <td class="style3">
                            &nbsp;</td>
                        <td class="style4">
                            Customer Photo</td>
                        <td class="style1">
                            :</td>
                        <td align="left" colspan="2">
                            <asp:HyperLink ID="HyperLink1" runat="server">View Photo</asp:HyperLink>
                        </td>
                      
                    </tr>
                   
                    
                   
                    <tr>
                        <td class="style3">
                            &nbsp;</td>
                        <td class="style4">
                            Company Name</td>
                        <td class="style1">
                            :</td>
                        <td align="left" colspan="2">
                            <asp:Label ID="lblcompanyname" runat="server" Text="Label"></asp:Label>
                        </td>
                      
                    </tr>
                   
                    
                   
                    <tr>
                        <td class="style3">
                            &nbsp;</td>
                        <td class="style4">
                            IsActive</td>
                        <td class="style1">
                            :</td>
                        <td align="left" colspan="2">
                            <asp:RadioButtonList ID="rdlIsActive" runat="server" 
                                RepeatDirection="Horizontal">
                                <asp:ListItem Value="1">True</asp:ListItem>
                                <asp:ListItem Value="0">False</asp:ListItem>
                            </asp:RadioButtonList>
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
                                ImageUrl="images/btnUpdate.jpg"  TabIndex="10" onclick="btnUpdate_Click" ValidationGroup="valgrpupdate"
                                />
                                <asp:ImageButton ID="btnCancel" runat="server" 
                                ImageUrl="images/btnCencel.jpg"  TabIndex="11" CausesValidation="false" onclick="btnCancel_Click" 
                                />
                        </td>
                      
                    </tr>
                    <tr>
                        <td class="style3">
                            &nbsp;</td>
                        <td class="style4">
                            &nbsp;</td>
                        <td class="style1">
                            &nbsp;</td>
                        <td align="center">
                            &nbsp;</td>
                        <td>
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

