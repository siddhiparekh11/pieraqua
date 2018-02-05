<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
<%@ Register TagPrefix="uc1" TagName="header" Src="~/UserControl/FrontMainHeader.ascx" %>
<%@ Register TagPrefix="uc2" TagName="leftmenu" Src="~/UserControl/FrontLeftPane.ascx" %>
<%@ Register TagPrefix="uc3" TagName="footer" Src="~/UserControl/FrontFooter.ascx" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Pier Aqua Login Page</title>
     <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js" ></script>
    	<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.5.1/jquery.min.js"></script>
    <link href="Styles/MainStylesheet.css" rel="stylesheet" type="text/css" />
    <link href="Styles/ddsmoothmenu-v.css" rel="stylesheet" type="text/css" />
    
    <script src="js/ddsmoothmenu.js" type="text/javascript"></script>
   
    
    <script type="text/javascript">

        ddsmoothmenu.init({
            mainmenuid: "smoothmenu2", //Menu DIV id
            orientation: 'v', //Horizontal or vertical menu: Set to "h" or "v"
            classname: 'ddsmoothmenu-v', //class added to menu's outer DIV
            //customtheme: ["#804000", "#482400"],
            contentsource: "markup" //"markup" or ["container_id", "path_to_menu_file"]
        })

</script>
    

</head>
<body>
    <form id="form1" runat="server">
    <div id="wrapper">
    <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
        </asp:ToolkitScriptManager>
    <uc1:header ID="Header1" runat="server"></uc1:header>
     <div id="mainwrapper">
           <div id="login">
            <table width="100%" cellspacing="5" cellpadding="0">
                <tr><td colspan="3"><h3>Login</h3></td></tr>
                <tr><td colspan="3">
                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" 
                        DisplayMode="List" ForeColor="Red" ValidationGroup="vallogin" />
                    </td></tr>
                <tr><td>Email</td><td>:</td><td><asp:TextBox runat="server" ID="txtloginemail" Width="180" CssClass="txtstyle"></asp:TextBox></td></tr>
                <tr><td>Password</td><td>:</td><td><asp:TextBox runat="server" ID="txtloginpassword" CssClass="txtstyle" TextMode="Password"></asp:TextBox></td></tr>
                <tr><td colspan="3">&nbsp;</td></tr>
                
                <tr><td></td><td></td><td><a href="#" class="btnstyle">Submit</a></td></tr>
                <tr><td colspan="3">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ControlToValidate="txtloginemail" Display="None" 
                        ErrorMessage="Email(UserID) required" ValidationGroup="vallogin"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                        ControlToValidate="txtloginemail" Display="None" 
                        ErrorMessage="Enter valid email" 
                        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                        ValidationGroup="vallogin"></asp:RegularExpressionValidator>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                        ControlToValidate="txtforgotpasswordemail" Display="None" 
                        ErrorMessage="Password required" ValidationGroup="vallogin"></asp:RequiredFieldValidator>
                    </td></tr>
            </table>
           </div>
           <div id="forgetpassword">
            <table width="100%" cellspacing="5" cellpadding="0">
                <tr><td colspan="3"><h3>Forgot Password</h3></td></tr>
                <tr><td colspan="3">
                    <asp:ValidationSummary ID="ValidationSummary2" runat="server" 
                        DisplayMode="List" ForeColor="Red" ValidationGroup="valforgotpassword" />
                    </td></tr>
                <tr><td>Email</td><td>:</td><td><asp:TextBox runat="server" ID="txtforgotpasswordemail" Width="180" CssClass="txtstyle"></asp:TextBox></td></tr>
                <tr><td colspan="3">&nbsp;</td></tr>
                <tr><td></td><td></td><td><a href="#" class="btnstyle">Send Email</a></td></tr>
                <tr><td colspan="3">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                        ControlToValidate="txtforgotpasswordemail" Display="None" 
                        ErrorMessage="Email required" ValidationGroup="valforgotpassword"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                        ControlToValidate="txtforgotpasswordemail" Display="None" 
                        ErrorMessage="Enter valid email" 
                        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                        ValidationGroup="valforgotpassword"></asp:RegularExpressionValidator>
                    </td></tr>
                <tr><td colspan="3"><div style="border:2px solid #ffffff;">Link would be sent to the above email address to reset the password</div></td></tr>
                
            
            </table>
           </div>
            </div> 
     <uc3:footer ID="Footer1" runat="server"></uc3:footer>
     </div>
    </form>
</body>
</html>
