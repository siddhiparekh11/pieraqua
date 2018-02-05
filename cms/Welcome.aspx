<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Welcome.aspx.cs" Inherits="smsadmin_Welcome" StylesheetTheme="SkinFile" Theme="SkinFile" %>

<%@ Register src="UserControls/Header.ascx" TagName="Header" tagprefix="uc1" %>
<%@ Register Src="UserControls/LeftMenu.ascx" TagName="LeftMenu" TagPrefix="uc2" %>

<%@ Register src="UserControls/Footer.ascx" TagName="Footer" tagprefix="uc3" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
    <title>Welcome -Pier Aqua Admin Panel</title>

    <meta http-equiv="content-type" content="text/html; charset=iso-8859-1" />
    <link rel="stylesheet" type="text/css" href="style/style.css" />
    <link rel="stylesheet" type="text/css" href="style/colour1.css" />
    <script src="../js/ddaccordion.js" type="text/javascript"></script>
    </head>
<body>
    <form id="form1" runat="server" >
   
    <div id="main">
      <uc1:Header ID="Header1" runat="server" />
      <div id="site_content">
            <uc2:LeftMenu ID="LeftMenu1" runat="server" />
            <div id="content">
                <h1>Welcome to Pier Aqua Admin Panel</h1>
            </div>
        </div>
        <uc3:Footer ID="Footer1" runat="server" />
        </div>
    </form>
</body>
</html>