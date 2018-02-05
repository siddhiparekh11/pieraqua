<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AddDynamicHelp.aspx.cs" Inherits="cms_InsertTestimonial" StylesheetTheme="SkinFile" Theme="SkinFile" %>


<%@ Register Src="UserControls/LeftMenu.ascx" TagName="LeftMenu" TagPrefix="uc1" %>
<%@ Register src="UserControls/Header.ascx" tagname="Header" tagprefix="uc2" %>
<%@ Register src="UserControls/Footer.ascx" tagname="Footer" tagprefix="uc3" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Add Dynamic Help - Pier Aqua Admin Panel</title>
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
    
</head>
<body>
    <form id="form1" runat="server">
    <div id="main">
      <uc2:Header ID="Header1" runat="server" />
      <div id="site_content">
            <uc1:LeftMenu ID="LeftMenu1" runat="server" />
            <div id="content">
                <h1>
                    add Dynamic Help</h1>
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
                                ValidationGroup="valgrpsave" />
                            <asp:Label ID="lblmsg" runat="server"></asp:Label>
                        </td>
                    </tr>
                    
                    <tr>
                        <td class="style3">
                            &nbsp;</td>
                        <td class="style4">
                            Page Name</td>
                        <td class="style1">
                            :</td>
                        <td class="style5">
                            <asp:DropDownList ID="DropDownList1" runat="server" 
                                DataSourceID="SqlDataSource1" DataTextField="PageName" DataValueField="PageID">
                            </asp:DropDownList>
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    
                    <tr>
                        <td class="style3">
                            &nbsp;</td>
                        <td class="style4">
                            Help Name</td>
                        <td class="style1">
                            :</td>
                        <td class="style5">
                            <asp:TextBox ID="txtHelpName" runat="server" CssClass="textbox" Width="200px" 
                                TabIndex="2" Height="27px"></asp:TextBox>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                ControlToValidate="txtHelpName" Display="None" ErrorMessage="Enter Help Name" 
                                SetFocusOnError="True" ValidationGroup="valgrpsave"></asp:RequiredFieldValidator>
                            </td>
                    </tr>
                    
                    <tr>
                        <td class="style3">
                            &nbsp;</td>
                        <td class="style4">
                            Help Description</td>
                        <td class="style1">
                            :</td>
                        <td >
                            <asp:TextBox ID="txtHelpDescription" runat="server" CssClass="textbox" 
                                height="188px" Width="438px"
                                 TabIndex="6" TextMode="MultiLine" 
                                ></asp:TextBox>
                            </td> 
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                ControlToValidate="txtHelpDescription" Display="None" ErrorMessage="Enter Help Description" 
                                SetFocusOnError="True" ValidationGroup="valgrpsave"></asp:RequiredFieldValidator>
                            &nbsp;</td>
                    </tr>
                   
                    
                   
                    <tr>
                        <td class="style3">
                            &nbsp;</td>
                        <td class="style4">
                            &nbsp;</td>
                        <td class="style1">
                            &nbsp;</td>
                        <td >
                            &nbsp;</td> 
                        <td>
                            &nbsp;</td>
                    </tr>
                   
                    
                   
                    <tr>
                        <td class="style3">
                            &nbsp;</td>
                        <td class="style4">
                            &nbsp;</td>
                        <td class="style1">
                            &nbsp;</td>
                        <td align="left" colspan="2">
                            <asp:ImageButton ID="btnSave" runat="server" 
                                ImageUrl="images/btnSave.jpg"  TabIndex="10" onclick="btnSave_Click" ValidationGroup="valgrpsave"
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
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:PierAqua1ConnectionString %>" 
                                SelectCommand="SELECT [PageID], [PageName] FROM [PagesInPierAqua]">
                            </asp:SqlDataSource>
                        </td>
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
