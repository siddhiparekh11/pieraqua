<%@ Control Language="C#" AutoEventWireup="true" CodeFile="FrontLeftPane.ascx.cs" Inherits="UserControl_FrontLeftPane" %>
<div id="left">
                <div id="categories">
                <img src="CssImages/categories.png" alt="categories" />
                <div id="smoothmenu2" class="ddsmoothmenu-v">
                <asp:Repeater ID="menuouterrepeater" runat="server" DataSourceID="SqlDataSource1" OnItemDataBound="menuouterrepeater_ItemDataBound" >
                <ItemTemplate>
                <ul>
				<li><asp:HiddenField ID="hdnParentCategoryid" runat="server" Value='<%#Eval("CategoryID")%>' /><a  href="SearchResult.aspx"><%#Eval("CategoryName")%></a>
                
				  <ul id="innerul" runat="server" visible="false">
                  <asp:Repeater ID="menuinnerrepeater" runat="server"  >
                <ItemTemplate>
				  <li><a href="SearchResult.aspx"><%#Eval("CategoryName") %></a></li>
                   </ItemTemplate>
                </asp:Repeater>
				  </ul>
               
				</li>
				</ul>
                </ItemTemplate>
                </asp:Repeater>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server"  
                        ConnectionString="<%$ ConnectionStrings:PierAqua1ConnectionString %>" 
                        
                        SelectCommand="SELECT [CategoryID], [CategoryName], [ParentCategoryID], [IsActive] FROM [ProductCategory] WHERE ([ParentCategoryID] = 0) and IsActive=1"></asp:SqlDataSource>
				   
				</div>
                </div>
                
                <div id="advertisements">
            <img src="CssImages/advertisements.png" alt="advertisements" />
            </div>
            </div>