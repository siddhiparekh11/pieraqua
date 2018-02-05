<%@ Page Language="C#" AutoEventWireup="true" CodeFile="UpdateFAQ.aspx.cs" Inherits="cms_UpdateFAQ" StylesheetTheme="SkinFile" Theme="SkinFile" %>


<%@ Register Src="UserControls/LeftMenu.ascx" TagName="LeftMenu" TagPrefix="uc1" %>
<%@ Register src="UserControls/Header.ascx" tagname="Header" tagprefix="uc2" %>
<%@ Register src="UserControls/Footer.ascx" tagname="Footer" tagprefix="uc3" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Update FAQ's- Pier Aqua Admin Panel</title>
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
                    update faq&#39;s</h1>
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
                            FAQ Question</td>
                        <td class="style1">
                            :
                        </td>
                        <td class="style5">
                            <asp:TextBox ID="txtFAQ_Question" runat="server" CssClass="textbox" Width="291px" 
                                TabIndex="2" Height="79px" TextMode="MultiLine"></asp:TextBox>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                ControlToValidate="txtFAQ_Question" Display="None" ErrorMessage="Enter FAQ Question" 
                                SetFocusOnError="True" ValidationGroup="valgrpupdate"></asp:RequiredFieldValidator>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="style3">
                            &nbsp;</td>
                        <td class="style4">
                            FAQ Answer</td>
                        <td class="style1">
                            :</td>
                        <td >
                            <asp:TextBox ID="txtFAQ_Anwer" runat="server" CssClass="textbox" 
                                height="188px" Width="438px"
                                 TabIndex="6" TextMode="MultiLine"></asp:TextBox>
                            </td> 
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                ControlToValidate="txtFAQ_Anwer" Display="None" ErrorMessage="Enter FAQ Answer" 
                                SetFocusOnError="True" ValidationGroup="valgrpupdate"></asp:RequiredFieldValidator>
                            &nbsp;</td>
                    </tr>
                   
                    
                   
                    <tr>
                        <td class="style3">
                            &nbsp;</td>
                        <td class="style4">
                            FAQ Type</td>
                        <td class="style1">
                            :</td>
                        <td align="left" colspan="2">
                            <asp:RadioButtonList ID="rdlFAQType" runat="server" 
                                RepeatDirection="Horizontal">
                                <asp:ListItem Value="0">Sell</asp:ListItem>
                                <asp:ListItem Value="1">Buy</asp:ListItem>
                                <asp:ListItem Value="2">Other</asp:ListItem>
                            </asp:RadioButtonList>
                        &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                ControlToValidate="rdlFAQType" Display="None" ErrorMessage="Enter FAQ Type" 
                                SetFocusOnError="True" ValidationGroup="valgrpupdate"></asp:RequiredFieldValidator>
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
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                                ControlToValidate="rdlIsActive" Display="None" ErrorMessage="Enter IsActive" 
                                SetFocusOnError="True" ValidationGroup="valgrpupdate"></asp:RequiredFieldValidator>
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
