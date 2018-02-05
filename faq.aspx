<%@ Page Language="C#" AutoEventWireup="true" CodeFile="faq.aspx.cs" Inherits="faq" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
<%@ Register TagPrefix="uc1" TagName="header" Src="~/UserControl/FrontMainHeader.ascx" %>
<%@ Register TagPrefix="uc2" TagName="leftmenu" Src="~/UserControl/FrontLeftPane.ascx" %>
<%@ Register TagPrefix="uc3" TagName="footer" Src="~/UserControl/FrontFooter.ascx" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Pier Aqua FAQ Page</title>
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
            <uc2:leftmenu ID="Leftmenu1" runat="server"></uc2:leftmenu>
            <div id="main"></div>
            
            </div> 
     <uc3:footer ID="Footer1" runat="server"></uc3:footer>
     </div>
    </form>
</body>
</html>
