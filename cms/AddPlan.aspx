<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AddPlan.aspx.cs" Inherits="cms_AddPlan" Theme="SkinFile" StyleSheetTheme="SkinFile" %>
<%@ Register Src="UserControls/LeftMenu.ascx" TagName="LeftMenu" TagPrefix="uc1" %>
<%@ Register src="UserControls/Header.ascx" tagname="Header" tagprefix="uc2" %>
<%@ Register src="UserControls/Footer.ascx" tagname="Footer" tagprefix="uc3" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Add Plan - Pier Aqua Admin Panel</title>
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
    
</head>
<body>
    <form id="form1" runat="server">
    <div id="main">
      <uc2:Header ID="Header1" runat="server" />
      <div id="site_content">
            <uc1:LeftMenu ID="LeftMenu1" runat="server" />
            <div id="content">
                <h1>
                    Add a Buying/Selling Plan</h1>
                    <table width="100%">
                    <tr>
                        <td class="style3">
                            &nbsp;
                        </td>
                        <td class="style4">
                            &nbsp;
                        </td>
                        <td class="style1">
                            &nbsp;
                        </td>
                        <td colspan="2">
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" 
                                ValidationGroup="valgrpsave" ForeColor="Red" />
                            <asp:Label ID="lblmsg" runat="server"></asp:Label>
                        </td>
                    </tr>
                    
                    <tr>
                        <td class="style3">
                            &nbsp;</td>
                        <td class="style4">
                            Plan Type</td>
                        <td class="style1">
                            :</td>
                        <td class="style5">
                            <asp:RadioButtonList ID="rblPlan_Type" runat="server" 
                                RepeatDirection="Horizontal">
                                <asp:ListItem Value="0">Seller</asp:ListItem>
                                <asp:ListItem Value="1">Buyer</asp:ListItem>
                                <asp:ListItem Value="2">Both</asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                                ControlToValidate="rblPlan_Type" Display="None" ErrorMessage="Enter Plan Type" 
                                SetFocusOnError="True" ValidationGroup="valgrpsave"></asp:RequiredFieldValidator>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                ControlToValidate="txtPlan_Name" Display="None" ErrorMessage="Enter Plan Name" 
                                SetFocusOnError="True" ValidationGroup="valgrpsave"></asp:RequiredFieldValidator>
                            </td>
                    </tr>
                    
                    <tr>
                        <td class="style3">
                            &nbsp;
                        </td>
                        <td class="style4">
                            Plan Name</td>
                        <td class="style1">
                            :
                        </td>
                        <td class="style5">
                            <asp:TextBox ID="txtPlan_Name" runat="server" CssClass="textbox" Width="186px"></asp:TextBox>
                        </td>
                        <td>
                            <asp:ImageButton ID="imgbtnCheck_Availibility" runat="server" 
                                CausesValidation="False" ImageUrl="~/cms/images/btnCheckAvailibility.jpg" 
                                onclick="imgbtnCheck_Availibility_Click" />
                            &nbsp;Ex : Basic, Silver, etc...</td>
                    </tr>
                    <tr>
                        <td class="style3">
                            &nbsp;
                        </td>
                        <td class="style4">
                            Plan Validity</td>
                        <td class="style1">
                            :
                        </td>
                        <td class="style5">
                            <asp:TextBox ID="txtPlan_Validity" runat="server" CssClass="textbox"></asp:TextBox>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                ControlToValidate="txtPlan_Validity" Display="None" 
                                ErrorMessage="Enter Plan Validity" SetFocusOnError="True" 
                                ValidationGroup="valgrpsave"></asp:RequiredFieldValidator>
                            &nbsp;Ex : 30,60 etc...(In Days)</td>
                    </tr>
                    <tr>
                        <td class="style3">
                            &nbsp;</td>
                        <td class="style4">
                            Price/Contact</td>
                        <td class="style1">
                            :</td>
                        <td >
                            <asp:TextBox ID="txtPricePerSupplier" runat="server" CssClass="textbox" 
                                ></asp:TextBox>
                            </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                                ControlToValidate="txtPricePerSupplier" Display="None" 
                                ErrorMessage="Enter Price Per Contact" SetFocusOnError="True" 
                                ValidationGroup="valgrpsave"></asp:RequiredFieldValidator>
                            &nbsp;Ex : 10,20 etc...(U.S Dollars)</td>
                    </tr>
                    <tr>
                        <td class="style3">
                            &nbsp;</td>
                        <td class="style4">
                            Contact Count</td>
                        <td class="style1">
                            :</td>
                        <td >
                            <asp:TextBox ID="txtSupplierCount" runat="server" CssClass="textbox" 
                                ></asp:TextBox>
                            </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                                ControlToValidate="txtSupplierCount" Display="None" 
                                ErrorMessage="Enter Contact Count" SetFocusOnError="True" 
                                ValidationGroup="valgrpsave"></asp:RequiredFieldValidator>
                            &nbsp;Ex : 10,20 etc...(Seller/Buyer Contacts)</td>
                    </tr>

                    <tr>
                        <td class="style3">
                            &nbsp;</td>
                        <td class="style4">
                            Total USD Price</td>
                        <td class="style1">
                            :</td>
                        <td >
                            <asp:TextBox ID="txtUSDPrice" runat="server" CssClass="textbox" 
                                ></asp:TextBox>
                            </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                                ControlToValidate="txtUSDPrice" Display="None" 
                                ErrorMessage="Enter Total USD Price" SetFocusOnError="True" 
                                ValidationGroup="valgrpsave"></asp:RequiredFieldValidator>
                            &nbsp;Ex : 100,200 etc...(U.S Dollars)</td>
                    </tr>
                    <tr>
                        <td class="style3">
                            &nbsp;</td>
                        <td class="style4">
                            Total INR Price</td>
                        <td class="style1">
                            :</td>
                        <td >
                            <asp:TextBox ID="txtINRPrice" runat="server" CssClass="textbox"></asp:TextBox>
                            </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                ControlToValidate="txtINRPrice" Display="None" 
                                ErrorMessage="Enter Total INR Price" SetFocusOnError="True" 
                                ValidationGroup="valgrpsave"></asp:RequiredFieldValidator>
                            &nbsp;Ex : 5000, 10000 etc...(Indian Rupees)</td>
                    </tr>

                    
                    <tr>
                        <td class="style3">
                            &nbsp;</td>
                        <td class="style4">
                            Plan Description</td>
                        <td class="style1">
                            :</td>
                        <td colspan="2">
                            <asp:TextBox ID="txtPlanDescription" runat="server" CssClass="textbox" 
                                height="100" Width="300" TextMode="MultiLine"></asp:TextBox>
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
                                ImageUrl="images/btnSave.jpg" onclick="btnSave_Click" ValidationGroup="valgrpsave"
                                />
                                <asp:ImageButton ID="btnCancel" runat="server" 
                                ImageUrl="images/btnCencel.jpg" CausesValidation="false" onclick="btnCancel_Click" 
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
                            &nbsp;</td>
                        <td>
                            <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
                            </asp:ToolkitScriptManager>
                            <asp:FilteredTextBoxExtender ID="FilterTextBoxExtender1" runat="server" 
                                TargetControlID="txtPlan_Validity" ValidChars="0123456789"></asp:FilteredTextBoxExtender>
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
                            &nbsp;</td>
                        <td>
                            <asp:FilteredTextBoxExtender ID="FilterTextBoxExtender2" runat="server" 
                                TargetControlID="txtPricePerSupplier" ValidChars="0123456789">
                            </asp:FilteredTextBoxExtender>
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
                            &nbsp;</td>
                        <td>
                            <asp:FilteredTextBoxExtender ID="FilterTextBoxExtender3" runat="server" TargetControlID="txtSupplierCount" ValidChars="0123456789">
                            </asp:FilteredTextBoxExtender>
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
                            &nbsp;</td>
                        <td>
                            <asp:FilteredTextBoxExtender ID="FilterTextBoxExtender4" TargetControlID="txtUSDPrice" ValidChars="0123456789." runat="server">
                            </asp:FilteredTextBoxExtender>
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
                            &nbsp;</td>
                        <td>
                            <asp:FilteredTextBoxExtender ID="FilterTextBoxExtender5" ValidChars="0123456789." TargetControlID="txtINRPrice" runat="server">
                            </asp:FilteredTextBoxExtender>
                        </td>
                    </tr>
                    </table>
            </div>
        </div>
        <uc3:Footer ID="Footer1" runat="server" />
        </div>
    </form>
</body>
</html>
