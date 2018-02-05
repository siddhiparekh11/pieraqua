<%@ Control Language="C#" AutoEventWireup="true" CodeFile="FrontMainHeader.ascx.cs" Inherits="UserControl_FrontMainHeader" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
 <div id="header">
        <div id="hupper">
            <div class="links">
                <a href="#">Join Now</a> <span class="seperator">|</span>
                <a href="#">Login</a> <span class="seperator">|</span> 
	            <a href="#">Buy</a> <span class="seperator">|</span> 
	            <a href="#">Sell</a> <span class="seperator">|</span> 
	            <a href="#">FAQ</a> <span class="seperator">|</span> 
                <a href="#">Testimonials</a> <span class="seperator">|</span> 
	            <a href="#">About Us</a> <span class="seperator">|</span>
                <a href="#">Contact Us</a>
            </div>
        </div>
        <div id="hmiddle">
        <div id="hmleft">
            <a href="Index.aspx">
            <img src="CssImages/logo.png" alt="PierAqualogo" style="border:none;" />
            </a>
        </div>
        <div id="hmright">
        <img src="CssImages/shoppingcart.png" alt="shoppingcart"  /><a href="#">Shopping Cart</a>&nbsp;&nbsp;
        </div>
        </div>
        <div id="hlower">
            
        <asp:TabContainer ID="TabContainer1" runat="server" CssClass="ajax__myTab"
    Width="1000px" ActiveTabIndex="0" >
    <asp:TabPanel ID="TabPanel1" runat="server">
        <HeaderTemplate>
            Products</HeaderTemplate>
        <ContentTemplate>
            
             <asp:TextBox ID="txttabpan1search" runat="server" Width="420px" Height="23px" 
                 Wrap="False"></asp:TextBox>
                 <asp:TextBoxWatermarkExtender ID="TextBoxWatermarkExtender1" runat="server" TargetControlID="txttabpan1search" WatermarkText="Product Name" WatermarkCssClass="txtwatermark"></asp:TextBoxWatermarkExtender>
        
             <asp:DropDownList ID="drptabpan1search" runat="server" 
                 Width="210px" Height="20px">
                 
             </asp:DropDownList>&nbsp;&nbsp;&nbsp;&nbsp;
                 <asp:ImageButton runat="server" ID="btntabpan1search" 
                 ImageUrl="~/CssImages/searchbtn.png" ImageAlign="Top" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                 <a href="#"><b>Advanced Search</b></a>
        </ContentTemplate>
    </asp:TabPanel>
    <asp:TabPanel ID="TabPanel2" runat="server">
        <HeaderTemplate>
            Buyer</HeaderTemplate>
        <ContentTemplate>
              <asp:TextBox ID="txttabpan2search" runat="server" Width="420px" Height="23px" 
                  Wrap="False"></asp:TextBox>
                  <asp:TextBoxWatermarkExtender ID="TextBoxWatermarkExtender2" runat="server" WatermarkCssClass="txtwatermark" TargetControlID="txttabpan2search" WatermarkText="Product Name"></asp:TextBoxWatermarkExtender>            
                                
             <asp:DropDownList ID="drptabpan2search" runat="server" 
                 Width="210px" Height="20px"></asp:DropDownList>&nbsp;&nbsp;&nbsp;&nbsp;
                 <asp:ImageButton runat="server" ID="btntabpan2search" 
                 ImageUrl="~/CssImages/searchbtn.png" ImageAlign="Top" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                 <a href="#"><b>Advanced Search</b></a>           
        </ContentTemplate>
    </asp:TabPanel>
    <asp:TabPanel ID="TabPanel3" runat="server">
        <HeaderTemplate>
            Seller</HeaderTemplate>
        <ContentTemplate>
                  <asp:TextBox ID="txttabpan3search" runat="server" Width="420px" Height="23px" 
                      Wrap="False"></asp:TextBox>
                      <asp:TextBoxWatermarkExtender ID="TextBoxWatermarkExtender3" runat="server" WatermarkCssClass="txtwatermark" TargetControlID="txttabpan3search" WatermarkText="Product Name"></asp:TextBoxWatermarkExtender>
             <asp:DropDownList ID="drptabpan3search" runat="server" 
                 Width="210px" Height="20px"></asp:DropDownList>&nbsp;&nbsp;&nbsp;&nbsp;
                 <asp:ImageButton runat="server" ID="btntabpan3search" 
                 ImageUrl="~/CssImages/searchbtn.png" ImageAlign="Top" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                 <a href="#"><b>Advanced Search</b></a>        
        </ContentTemplate>
    </asp:TabPanel>
</asp:TabContainer>
        </div>
        
       </div>