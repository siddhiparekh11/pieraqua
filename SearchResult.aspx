<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SearchResult.aspx.cs" Inherits="SearchResult" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
<%@ Register TagPrefix="uc1" TagName="header" Src="~/UserControl/FrontMainHeader.ascx" %>
<%@ Register TagPrefix="uc2" TagName="leftmenu" Src="~/UserControl/FrontLeftPane.ascx" %>
<%@ Register TagPrefix="uc3" TagName="footer" Src="~/UserControl/FrontFooter.ascx" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Pier Aqua Search Page</title>
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
            <div id="main">
            
            <asp:Repeater runat="server" ID="repsearchproduct" OnItemDataBound="repsearchproduct_ItemDataBound">
            <ItemTemplate>
                <div id="searchedproduct">
                <asp:HiddenField runat="server" ID="hdnproductid" Value='<%#Eval("ProductID") %>' />
                    <table width="100%">
                    <tr><td><a href="Product.aspx"><b style="font-size:14px;"><%#Eval("ProductName") %></b></a></td><td colspan="2" align="right"><b>Minimum Order Quantity : </b><%#Eval("MinimOrderQuantity") %></td><td align="center"><b>Category : </b><%#Eval("CategoryName")%></td></tr>
                    <tr><td colspan="4"></td></tr>
                    <tr><td><img src='<%#Eval("Photo") %>' alt="product" width="100" height="70" style="border:1px solid #003066;margin-top:10px;margin-left:5px;" ></td><td colspan="3"><table ><asp:Repeater ID="repproductattribute" runat="server">
                    
                    <ItemTemplate>
                    <tr><td><%#Eval("AttributeName") %></td><td>:</td><td><%#Eval("AttributeValue") %></td></tr>
                    </ItemTemplate>
                    
                    </asp:Repeater>
                    </table>
                    </td>
                    </tr>
                    <tr><td colspan="4" align="right"><a href="#"  class="btnstyle1">Add to shopping cart</a></td></tr>
                    <tr><td colspan="4"></td></tr>
                    <tr><td colspan="4"></td></tr>
                    </table>
                </div>
            </ItemTemplate>                   
            </asp:Repeater>
            
            </div>
            </div> 
     <uc3:footer ID="Footer1" runat="server"></uc3:footer>
     </div>
    </form>
</body>
</html>
