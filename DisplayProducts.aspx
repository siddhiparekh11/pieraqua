<%@ Page Language="C#" AutoEventWireup="true" CodeFile="DisplayProducts.aspx.cs" Inherits="DisplayProducts" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
<%@ Register TagPrefix="uc1" TagName="loginheader" Src="~/UserControl/FrontLoginHeader.ascx" %>

<%@ Register TagPrefix="uc3" TagName="footer" Src="~/UserControl/FrontFooter.ascx" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Pier Aqua Display Product Page</title>
    <link href="Styles/MainStylesheet.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" type="text/css" href="Styles/jqueryslidemenu.css" />

<!--[if lte IE 7]>
<style type="text/css">
html .jqueryslidemenu{height: 1%;} /*Holly Hack for IE7 and below*/
</style>
<![endif]-->

<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.2.6/jquery.min.js"></script>
<script type="text/javascript" src="js/jqueryslidemenu.js"></script>

</head>
<body>
    <form id="form1" runat="server">
    <div id="wrapper">
     <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
        </asp:ToolkitScriptManager>
      
    <uc1:loginheader runat="server" />
    <br />
    <uc3:footer runat="server" />
    </div>
    </form>
</body>
</html>
