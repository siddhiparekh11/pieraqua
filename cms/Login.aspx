<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="cms_Login" Theme="SkinFile" %>

<%@ Register Src="UserControls/Header.ascx" TagName="Header" TagPrefix="uc1" %>
<%@ Register Src="UserControls/Footer.ascx" TagName="Footer" TagPrefix="uc3" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head runat="server">
    <title>Login - Pier Aqua Admin Panel</title>
    <meta http-equiv="content-type" content="text/html; charset=iso-8859-1" />
    <link rel="stylesheet" type="text/css" href="style/style.css" />
    <link rel="stylesheet" type="text/css" href="style/colour1.css" />
    <link rel="stylesheet" type="text/css" href="style/StyleSheet.css"  />
    <style type="text/css">
        .style1
        {
            width: 442px;
        }
        .style2
        {
        }
        .style5
        {
            width: 107px;
        }
        .style6
        {
        }
        .style7
        {
            width: 107px;
            font-weight: bold;
        }
        .style8
        {
            width: 38px;
            font-weight: bold;
        }
        .style9
        {
            width: 146px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server" defaultbutton="btnLogin">
    <div id="main">
        
       
        
        <%-- Title Start --%>
        <uc1:Header ID="Header4" runat="server" />
        <%-- Title End --%>
        
        <div id="site_content">
        <div class="sidebar">
        
        </div>
           
        
            <div id="content">
                <h1>
                    Login</h1>
                <table width="542px;">
                    <tr>
                        <td class="style6">
                            &nbsp;</td>
                        <td class="style5">
                            &nbsp;</td>
                        <td class="style2">
                            &nbsp;</td>
                        <td align="center" class="style9">
                            <asp:Image ID="Image1" runat="server" ImageUrl="../cms/images/User.jpg" />
                        </td>
                        <td align="center">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="style6">
                            &nbsp;</td>
                        <td class="style5">
                            &nbsp;</td>
                        <td class="style2">
                            &nbsp;</td>
                        <td align="center" class="style9">
                            &nbsp;</td>
                        <td align="center">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="style6">
                            &nbsp;</td>
                        <td class="style7">
                            User Name</td>
                        <td class="style8">
                            :</td>
                        <td class="style9">
                            <asp:TextBox ID="txtUser_Name" runat="server" Width="200px" CssClass="textbox" 
                                 ValidationGroup="valLogin"></asp:TextBox>
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="style6">
                            &nbsp;</td>
                        <td class="style7">
                            Password</td>
                        <td class="style8">
                            :</td>
                        <td class="style9">
                            <asp:TextBox ID="txtPassword" runat="server" 
                                TextMode="Password" Width="200px" CssClass="textbox" 
                                ValidationGroup="valLogin"></asp:TextBox>
                        </td>
                        <td>
                            <asp:HyperLink ID="HyperLink1" runat="server" 
                                NavigateUrl="LoginProblem.aspx">Forgot Password ?</asp:HyperLink>
                        </td>
                    </tr>
                    <tr>
                        <td class="style6">
                            &nbsp;</td>
                        <td class="style5">
                            &nbsp;</td>
                        <td class="style2">
                            &nbsp;</td>
                        <td colspan="2">
                            <asp:Label ID="lblMsg" runat="server" ></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style6">
                            &nbsp;</td>
                        <td class="style5">
                            &nbsp;</td>
                        <td class="style2">
                            &nbsp;</td>
                        <td align="center">
                            <asp:ImageButton ID="btnLogin" runat="server" 
                                ImageUrl="../cms/images/btnLogin.jpg" onclick="btnLogin_Click" 
                                ValidationGroup="valLogin"/>
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    </table>
                <p>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ErrorMessage="&lt;b&gt;Error...&lt;/b&gt;&lt;br/&gt;Enter User Name" ControlToValidate="txtUser_Name" 
                        Display="Dynamic" SetFocusOnError="True" ValidationGroup="valLogin"></asp:RequiredFieldValidator>
                        
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                        
                        ErrorMessage="&lt;br/&gt;&lt;b&gt;Error...&lt;/b&gt;&lt;br/&gt;Enter Password" Display="Dynamic" 
                        SetFocusOnError="True" ControlToValidate="txtPassword" 
                        ValidationGroup="valLogin"></asp:RequiredFieldValidator>                  
                        
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                        ControlToValidate="txtUser_Name" Display="Dynamic" 
                        ErrorMessage="&lt;br/&gt;&lt;b&gt;Error . . .&lt;/b&gt;&lt;br/&gt;User Name Must be Your VALID EMAIL ID" 
                        SetFocusOnError="True" 
                        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                        ValidationGroup="valLogin"></asp:RegularExpressionValidator>
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
