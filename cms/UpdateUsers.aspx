<%@ Page Language="C#" AutoEventWireup="true" CodeFile="UpdateUsers.aspx.cs" Inherits="cms_UpdateUsers" StylesheetTheme="SkinFile" Theme="SkinFile" %>

<%@ Register Src="UserControls/LeftMenu.ascx" TagName="LeftMenu" TagPrefix="uc1" %>
<%@ Register src="UserControls/Header.ascx" tagname="Header" tagprefix="uc2" %>
<%@ Register src="UserControls/Footer.ascx" tagname="Footer" tagprefix="uc3" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Update Users - Pier Aqua Admin Panel</title>
     <link rel="stylesheet" type="text/css" href="style/style.css" />
    <link rel="stylesheet" type="text/css" href="style/colour1.css" />
     <style type="text/css">
        .style1
        {
            width: 18px;
        }
        .style3
        {
            width: 35px;
        }
        .style4
        {
            width: 100px;
        }
        .style5
        {
            width: 65px;
        }
    </style>

   
    <script src="../js/ddaccordion.js" type="text/javascript"></script>
    <script src="../js/jquery-1.5.1.min.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(document).ready(function() {
            $('#txtPlan_Validity').keypress(function(e) {
                if (e.which != 8 && e.which != 0 && e.which!=46 && (e.which < 48 || e.which > 57)) {
                    return false
                }
                 });
             
            
             $('#txtINRPrice').keypress(function(e) {
             if (e.which != 8 && e.which != 0 && e.which != 46 && (e.which < 48 || e.which > 57)) {
                         return false
                     }
                 });

                 $('#txtUSDPrice').keypress(function(e) {
                 if (e.which != 8 && e.which != 0 && e.which != 46 && (e.which < 48 || e.which > 57)) {
                         return false
                     }
                 });
             }); 
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div id="main">
      <uc2:Header ID="Header1" runat="server" />
      <div id="site_content">
            <uc1:LeftMenu ID="LeftMenu1" runat="server" />
            <div id="content">
                <h1>
                    Update users</h1>
                    <table width="100%">
                    <tr>
                        <td class="style3">
                            &nbsp;
                            <asp:ScriptManager ID="ScriptManager1" runat="server">
                            </asp:ScriptManager>
                        </td>
                        <td class="style4">
                            &nbsp;
                        </td>
                        <td class="style1">
                            &nbsp;
                        </td>
                        <td colspan="2">
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" />
                            <asp:Label ID="lblmsg" runat="server"></asp:Label>
                        </td>
                    </tr>
                    
                    <tr>
                        <td class="style3">
                            &nbsp;
                        </td>
                        <td class="style4">
                            User Name</td>
                        <td class="style1">
                            :
                        </td>
                        <td class="style5">
                            <asp:TextBox ID="txtUserName" runat="server" CssClass="textbox" Width="186px" 
                                TabIndex="2"></asp:TextBox>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                ControlToValidate="txtUserName" Display="None" ErrorMessage="Enter User  Name" 
                                SetFocusOnError="True" ValidationGroup="valgrpupdate"></asp:RequiredFieldValidator>
                            </td>
                    </tr>
                    <tr>
                        <td class="style3">
                            &nbsp;</td>
                        <td class="style4">
                            Full Name</td>
                        <td class="style1">
                            :</td>
                        <td >
                            <asp:TextBox ID="txtFullName" runat="server" CssClass="textbox" TabIndex="4" 
                                Width="176px"></asp:TextBox>
                            </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                ControlToValidate="txtFullName" Display="None" 
                                ErrorMessage="Enter Full Name" SetFocusOnError="True" 
                                ValidationGroup="valgrpupdate"></asp:RequiredFieldValidator>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="style3">
                            &nbsp;</td>
                        <td class="style4">
                            &nbsp;</td>
                        <td class="style1">
                            &nbsp;</td>
                        <td colspan="2" align="right" >
                            <asp:UpdatePanel ID="UpdatePanel2" runat="server" ChildrenAsTriggers="true" UpdateMode="Always">
                           <ContentTemplate>
                            <asp:CheckBox ID="CheckBox1" runat="server" AutoPostBack="True" 
                                Text="Select All" oncheckedchanged="CheckBox1_CheckedChanged" />
                                </ContentTemplate>
                                 </asp:UpdatePanel>
                        </td>
                        
                    </tr>
                   
                    
                   
                    <tr>
                        <td class="style3">
                            &nbsp;</td>
                        <td class="style4">
                            Page Rights</td>
                        <td class="style1">
                            :</td>
                        <td colspan="2" >
                        <asp:UpdatePanel ID="UpdatePanel1" runat="server" ChildrenAsTriggers="true" UpdateMode="Always">
                        <ContentTemplate>
                            <asp:CheckBoxList ID="chkPageRights" runat="server" RepeatColumns="3" 
                                RepeatDirection="Horizontal" DataSourceID="SqlDataSource1" 
                                DataTextField="PageName" AutoPostBack="true" DataValueField="PageID" 
                                DataMember="DefaultView" >
                            </asp:CheckBoxList>
                            </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                        
                    </tr>
                   
                    
                   
                    <tr>
                        <td class="style3">
                            &nbsp;</td>
                        <td class="style4">
                            IsActive</td>
                        <td class="style1">
                            :</td>
                        <td colspan="2" >
                            <asp:RadioButtonList ID="rdlIsActive" runat="server" 
                                RepeatDirection="Horizontal">
                                <asp:ListItem Value="1">True</asp:ListItem>
                                <asp:ListItem Value="0">False</asp:ListItem>
                            </asp:RadioButtonList>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                                ControlToValidate="rdlIsActive" Display="None" 
                                ErrorMessage="Enter IsActive Status" SetFocusOnError="True" 
                                ValidationGroup="valgrpupdate"></asp:RequiredFieldValidator>
                        </td>
                        
                    </tr>
                   
                    
                   
                    <tr>
                        <td class="style3">
                            &nbsp;</td>
                        <td class="style4">
                            &nbsp;</td>
                        <td class="style1">
                            &nbsp;</td>
                        <td align="left" colspan="2">
                            <asp:ImageButton ID="btnSave" runat="server" 
                                ImageUrl="images/btnUpdate.jpg"  TabIndex="10" onclick="btnUpdate_Click" ValidationGroup="valgrpupdate"
                                />
                                <asp:ImageButton ID="btnCancel" runat="server" 
                                ImageUrl="images/btnCencel.jpg"  TabIndex="11" CausesValidation="false" onclick="btnCancel_Click" 
                                />
                        </td>
                      
                    </tr>
                    <tr>
                        <td class="style3">
                            &nbsp;</td>
                        <td class="style4">
                            &nbsp;</td>
                        <td class="style1">
                            &nbsp;</td>
                        <td align="center">
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:PierAqua1ConnectionString %>" 
                                SelectCommand="SELECT [PageID], [PageName] FROM [PagesInPierAqua]">
                            </asp:SqlDataSource>
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    </table>
            </div>
        </div>
        <uc3:Footer ID="Footer1" runat="server" />
        </div>
    </form>
</body>
</html>

