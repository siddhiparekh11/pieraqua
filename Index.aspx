<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Index.aspx.cs" Inherits="Index" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
<%@ Register TagPrefix="uc1" TagName="header" Src="~/UserControl/FrontMainHeader.ascx" %>
<%@ Register TagPrefix="uc2" TagName="leftmenu" Src="~/UserControl/FrontLeftPane.ascx" %>
<%@ Register TagPrefix="uc3" TagName="footer" Src="~/UserControl/FrontFooter.ascx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Pier Aqua Home Page</title>
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
    <uc1:header runat="server"></uc1:header>  
       <div id="mainwrapper">
            
            <uc2:leftmenu runat="server"></uc2:leftmenu>
            <div id="main">
            <img src="CssImages/flash.jpg" alt="flash" style="z-index:-1;" />
            
            <div id="slider">
            <div><img src="CssImages/featuredproducts.png" alt="featuredproduct" /></div>
            <div >
            <asp:UpdatePanel ID="UpdatePanel1" runat="server" ChildrenAsTriggers="true" UpdateMode="Always">
            <ContentTemplate>
            <div id="leftslide" style="padding:5px;float:left;"><asp:ImageButton runat="server" 
                    ID="imgbtnlft" ImageUrl="~/CssImages/leftarrow.png" AlternateText="leftarrow" 
                    onclick="imgbtnlft_Click" /></div>
           
            <div id="actualslidercontent" style="padding:5px;float:left;">
              <asp:DataList runat="server" ID="dtlstFeatured" RepeatColumns="3" 
                    RepeatDirection="Horizontal">
                <ItemTemplate>
                <a href="#" ><img src='<%#Container.DataItem%>' alt="Featured" width="100" height="100" style="margin-left:5px;padding:5px 0px;border:1px solid #003066;" /></a>
                </ItemTemplate>
              </asp:DataList>
              </div>
              <div id="rightslide" style="padding:5px;"><asp:ImageButton runat="server" 
                      ID="imgbtnright" ImageUrl="~/CssImages/rightarrow.png" 
                      AlternateText="rightarrow" onclick="imgbtnright_Click" /></div>
                      </ContentTemplate>
                      </asp:UpdatePanel>
            </div> 
            </div>
            <div id="hometab">
             <asp:TabContainer ID="TabContainer2" runat="server" CssClass="ajax__homemyTab"
    Width="350px" ActiveTabIndex="0" >
    <asp:TabPanel ID="TabPanel4" runat="server">
        <HeaderTemplate>
            Buying Leads</HeaderTemplate>
        <ContentTemplate>
            
                    </ContentTemplate>
    </asp:TabPanel>
    <asp:TabPanel ID="TabPanel5" runat="server">
        <HeaderTemplate>
            Promotions</HeaderTemplate>
        <ContentTemplate>
                         
        </ContentTemplate>
    </asp:TabPanel>
    <asp:TabPanel ID="TabPanel6" runat="server">
        <HeaderTemplate>
            Newly Added</HeaderTemplate>
        <ContentTemplate>
                          
        </ContentTemplate>
    </asp:TabPanel>
</asp:TabContainer>
            </div>
            <div id="hometestimonials">
            <div><img src="CssImages/testimonials.png" alt="testimonials" /></div> 
            </div>
            </div>
             
            </div>
      <uc3:footer runat="server"></uc3:footer>    
            
       </div> 
    
    </form>
</body>
</html>
