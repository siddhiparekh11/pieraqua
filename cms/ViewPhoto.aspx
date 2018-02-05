<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ViewPhoto.aspx.cs" Inherits="cms_ViewPhoto" Theme="SkinFile" StylesheetTheme="SkinFile" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>View Photo - PierAqua Admin Panel</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Repeater ID="ImageRepeater" runat="server">
           <ItemTemplate>
                <img style="border:1px solid black;" src='<%#Eval("PhotoPath") %>' alt="NoImage"  />
           </ItemTemplate> 
        </asp:Repeater>
    </div>
    </form>
</body>
</html>
