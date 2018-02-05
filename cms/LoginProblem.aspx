<%@ Page Language="C#" AutoEventWireup="true" CodeFile="LoginProblem.aspx.cs" Inherits="psadmin_LoginProblem" Theme="SkinFile" StyleSheetTheme="SkinFile" %>


<%@ Register Src="UserControls/Header.ascx" TagName="Header" TagPrefix="uc1" %>
<%@ Register Src="UserControls/Footer.ascx" TagName="Footer" TagPrefix="uc3" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head runat="server">
    <title>Forget Password -Pier Aqua Admin Panel</title>
    <meta http-equiv="content-type" content="text/html; charset=iso-8859-1" />
    <link rel="stylesheet" type="text/css" href="style/style.css" />
    <link rel="stylesheet" type="text/css" href="style/colour1.css" />
    <link href="style/StyleSheet.css" rel="stylesheet" type="text/css" />
 
    <style type="text/css">
        .style1
        {
            width: 500px;
        }
        .style2
        {
            width: 25px;
        }
        .style7
        {
            width: 72px;
            font-weight: bold;
        }
        .style8
        {
            width: 25px;
            font-weight: bold;
        }
        .style9
        {
            width: 79px;
        }
        .style10
        {
            width: 72px;
        }
        .style11
        {
            width: 216px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div id="main">
        
        <%-- Title Start --%>
        <uc1:Header ID="Header1" runat="server" />
        <%-- Title End --%>
        
        <div id="breadcrumbs">
            <%--<strong>Welcome :</strong><a href="#" title="Work From Home Users"> User Name</a>--%>
        </div>
        <div id="site_content">
        <div class="sidebar">
            </div>
           
        
            <div id="content">
                <h1>
                    Forget Password ?</h1>
                <table class="style1">
                    <tr>
                        <td class="style9">
                            &nbsp;</td>
                        <td class="style10">
                            &nbsp;</td>
                        <td class="style2">
                            &nbsp;</td>
                        <td align="center" class="style11">
                            &nbsp;</td>
                        <td align="center">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="style9">
                            &nbsp;</td>
                        <td class="style10">
                            &nbsp;</td>
                        <td class="style2">
                            &nbsp;</td>
                        <td align="center" class="style11">
                            <asp:Image ID="Image1" runat="server" ImageUrl="../cms/images/unhappy.jpg" />
                        </td>
                        <td align="center">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="style9">
                            &nbsp;</td>
                        <td class="style10">
                            &nbsp;</td>
                        <td class="style2">
                            &nbsp;</td>
                        <td align="center" class="style11">
                            &nbsp;</td>
                        <td align="center">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="style9">
                            &nbsp;</td>
                        <td class="style7">
                            Email ID</td>
                        <td class="style8">
                            :</td>
                        <td class="style11">
                            <asp:TextBox ID="txtEmail_ID" runat="server" Width="200px" CssClass="textbox"></asp:TextBox>
                        </td>
                        <td>
                            <asp:HyperLink ID="HyperLink1" runat="server" 
                                NavigateUrl="~/cms/Login.aspx">Login Now !</asp:HyperLink>
                        </td>
                    </tr>
                    <tr>
                        <td class="style9">
                            &nbsp;</td>
                        <td class="style7">
                            &nbsp;</td>
                        <td class="style8">
                            &nbsp;</td>
                        <td class="style11">
                            <asp:Label ID="lblMsg" runat="server" Text=" "></asp:Label>
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="style9">
                            &nbsp;</td>
                        <td class="style10">
                            &nbsp;</td>
                        <td class="style2">
                            &nbsp;</td>
                        <td align="center" class="style11">
                            <asp:ImageButton ID="btnSend" runat="server" 
                                ImageUrl="../cms/images/btnSend.jpg" 
                                ValidationGroup="ForgetPassword" onclick="btnSend_Click" />
                        </td>
                        <td align="center">
                            &nbsp;</td>
                    </tr>
                </table>
                <p>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ErrorMessage="Error Please Enter Email ID" 
                            ControlToValidate="txtEmail_ID" Display="None" SetFocusOnError="True" 
                        ValidationGroup="ForgetPassword"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                            ControlToValidate="txtEmail_ID" Display="None" 
                            ErrorMessage="Error EMAIL ID not in Valid Format" 
                            SetFocusOnError="True" 
                            ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                        ValidationGroup="ForgetPassword"></asp:RegularExpressionValidator>
                        
                </p>
            </div>
            
        </div>
        
        <%-- Footer Start --%>
        <uc3:Footer ID="Footer1" runat="server" />
        <%-- Footer End --%>
        
        </div>
    </form>
</body>
</html>
