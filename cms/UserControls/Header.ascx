<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Header.ascx.cs" Inherits="smsadmin_Controls_Header" %>
 <%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajax" %>
 <div class="headerimagePierAqua">
 <table width="100%">
 <tr>
 <td style="height:30px">&nbsp;</td>
 <td></td>
 </tr>
 <tr>
 <td style="width:750px"></td>
 <td>
     <asp:Label ID="lblDate" runat="server" Text="Label"></asp:Label>
     </td>
 </tr>
 <tr>
 <td></td>
 <td><span class="lblBold">Logged User :</span><asp:Label ID="lblUserName" 
         runat="server" Text="Label"></asp:Label>
                </td>
 </tr>
 
 </table>
 
 </div>
        <div id="breadcrumbs">
       <%-- <%
            if (Session["AdminUser_ID"] != null)
            {
            %>--%>
            <table width="100%">
            <tr>
            <td style="text-align: center;width:200px">
                <asp:ImageButton ID="imgbtnHome" runat="server" ImageUrl="../images/Home2.png" ToolTip="Back To Startup Page" 
                    ValidationGroup="Home" onclick="imgbtnHome_Click" 
                    CausesValidation="False"/>
                </td>
            <td></td>
            <td  style="text-align: center;width:200px">
            <asp:ImageButton ID="btnLogout" runat="server" ImageUrl="../images/logout.png" 
                    ToolTip="Logout" ValidationGroup="Logout" onclick="btnLogout_Click" 
                    CausesValidation="False"/>
                <%--<asp:LinkButton ID="btnLogout" runat="server" CssClass="Logout" 
                    onclick="btnLogout_Click" >Logout</asp:LinkButton>--%></td>
            </tr>
            </table>
            <%--<%
            }
        %>--%>
            
        </div>
        
        


                            
                            
        
        


