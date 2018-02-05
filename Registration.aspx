<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Registration.aspx.cs" Inherits="Registration" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
<%@ Register TagPrefix="uc1" TagName="header" Src="~/UserControl/FrontMainHeader.ascx" %>
<%@ Register TagPrefix="uc2" TagName="leftmenu" Src="~/UserControl/FrontLeftPane.ascx" %>
<%@ Register TagPrefix="uc3" TagName="footer" Src="~/UserControl/FrontFooter.ascx" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Pier Aqua Registration Page</title>
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
           <div id="registration">
           <table width="100%" cellspacing="5" cellpadding="0">
           <tr><td colspan="5"><h3>Registration</h3></td></tr>
           <tr><td colspan="5">
               <asp:ValidationSummary ID="ValidationSummary1" runat="server" 
                   DisplayMode="List" ForeColor="Red" ValidationGroup="valregister" />
               </td></tr>
            <tr><td class="asterik">*</td><td>First Name</td><td>:</td><td><asp:TextBox runat="server" ID="txtregistrationfirstname" CssClass="txtstyle"></asp:TextBox></td><td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    Display="None" ErrorMessage="First name required" 
                    ValidationGroup="valregister" ControlToValidate="txtregistrationfirstname"></asp:RequiredFieldValidator>
                </td></tr>
            <tr><td class="asterik">*</td><td>Last Name</td><td>:</td><td><asp:TextBox runat="server" ID="txtregistrationlastname" CssClass="txtstyle"></asp:TextBox></td><td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    Display="None" ErrorMessage="Last name required" 
                    ValidationGroup="valregister" ControlToValidate="txtregistrationlastname"></asp:RequiredFieldValidator>
                </td></tr>
            <tr><td class="asterik">*</td><td>Country</td><td>:</td><td><asp:DropDownList runat="server" ID="drpcountry" >
            <asp:ListItem Value="0" Text="Select a country"></asp:ListItem>
            <asp:ListItem Value="1" Text="Afghanistan"></asp:ListItem>
<asp:ListItem Value="2" Text="Aland Islands"></asp:ListItem>
<asp:ListItem Value="3" Text="Albania"></asp:ListItem>
<asp:ListItem Value="4" Text="Algeria"></asp:ListItem>
<asp:ListItem Value="5" Text="American Samoa"></asp:ListItem>
<asp:ListItem Value="6" Text="Andorra"></asp:ListItem>
<asp:ListItem Value="7" Text="Angola"></asp:ListItem>
<asp:ListItem Value="8" Text="Anguilla"></asp:ListItem>
<asp:ListItem Value="9" Text="Antarctica"></asp:ListItem>
<asp:ListItem Value="10" Text="Antigua And Barbuda"></asp:ListItem>
<asp:ListItem Value="11" Text="Argentina"></asp:ListItem>
<asp:ListItem Value="12" Text="Armenia"></asp:ListItem>
<asp:ListItem Value="13" Text="Aruba"></asp:ListItem>
<asp:ListItem Value="14" Text="Australia"></asp:ListItem>
<asp:ListItem Value="15" Text="Austria"></asp:ListItem>
<asp:ListItem Value="16" Text="Azerbaijan"></asp:ListItem>
<asp:ListItem Value="17" Text="Bahamas"></asp:ListItem>
<asp:ListItem Value="18" Text="Bahrain"></asp:ListItem>
<asp:ListItem Value="19" Text="Bangladesh"></asp:ListItem>
<asp:ListItem Value="20" Text="Barbados"></asp:ListItem>
<asp:ListItem Value="21" Text="Belarus"></asp:ListItem>
<asp:ListItem Value="22" Text="Belgium"></asp:ListItem>
<asp:ListItem Value="23" Text="Belize"></asp:ListItem>
<asp:ListItem Value="24" Text="Benin"></asp:ListItem>
<asp:ListItem Value="25" Text="Bermuda"></asp:ListItem>
<asp:ListItem Value="26" Text="Bhutan"></asp:ListItem>
<asp:ListItem Value="27" Text="Bolivia"></asp:ListItem>
<asp:ListItem Value="28" Text="Bosnia And Herzegovina"></asp:ListItem>
<asp:ListItem Value="29" Text="Botswana"></asp:ListItem>
<asp:ListItem Value="30" Text="Bouvet Island"></asp:ListItem>
<asp:ListItem Value="31" Text="Brazil"></asp:ListItem>
<asp:ListItem Value="32" Text="British Indian Ocean Territory"></asp:ListItem>
<asp:ListItem Value="33" Text="Brunei Darussalam"></asp:ListItem>
<asp:ListItem Value="34" Text="Bulgaria"></asp:ListItem>
<asp:ListItem Value="35" Text="Burkina Faso"></asp:ListItem>
<asp:ListItem Value="36" Text="Burundi"></asp:ListItem>
<asp:ListItem Value="37" Text="Cambodia"></asp:ListItem>
<asp:ListItem Value="38" Text="Cameroon"></asp:ListItem>
<asp:ListItem Value="39" Text="Canada"></asp:ListItem>
<asp:ListItem Value="40" Text="Cape Verde"></asp:ListItem>
<asp:ListItem Value="41" Text="Cayman Islands"></asp:ListItem>
<asp:ListItem Value="42" Text="Central African Republic"></asp:ListItem>
<asp:ListItem Value="43" Text="Chad"></asp:ListItem>
<asp:ListItem Value="44" Text="Chile"></asp:ListItem>
<asp:ListItem Value="45" Text="China"></asp:ListItem>
<asp:ListItem Value="46" Text="Christmas Island"></asp:ListItem>
<asp:ListItem Value="47" Text="Cocos (Keeling) Islands"></asp:ListItem>
<asp:ListItem Value="48" Text="Colombia"></asp:ListItem>
<asp:ListItem Value="49" Text="Comoros"></asp:ListItem>
<asp:ListItem Value="50" Text="Congo"></asp:ListItem>
<asp:ListItem Value="51" Text="Congo, The Democratic Republic Of The"></asp:ListItem>
<asp:ListItem Value="52" Text="Cook Islands"></asp:ListItem>
<asp:ListItem Value="53" Text="Costa Rica"></asp:ListItem>
<asp:ListItem Value="54" Text="Cote D'Ivoire"></asp:ListItem>
<asp:ListItem Value="55" Text="Croatia"></asp:ListItem>
<asp:ListItem Value="56" Text="Cuba"></asp:ListItem>
<asp:ListItem Value="57" Text="Cyprus"></asp:ListItem>
<asp:ListItem Value="58" Text="Czech Republic"></asp:ListItem>
<asp:ListItem Value="59" Text="Denmark"></asp:ListItem>
<asp:ListItem Value="60" Text="Djibouti"></asp:ListItem>
<asp:ListItem Value="61" Text="Dominica"></asp:ListItem>
<asp:ListItem Value="62" Text="Dominican Republic"></asp:ListItem>
<asp:ListItem Value="63" Text="Ecuador"></asp:ListItem>
<asp:ListItem Value="64" Text="Egypt"></asp:ListItem>
<asp:ListItem Value="65" Text="El Salvador"></asp:ListItem>
<asp:ListItem Value="66" Text="Equatorial Guinea"></asp:ListItem>
<asp:ListItem Value="67" Text="Eritrea"></asp:ListItem>
<asp:ListItem Value="68" Text="Estonia"></asp:ListItem>
<asp:ListItem Value="69" Text="Ethiopia"></asp:ListItem>
<asp:ListItem Value="70" Text="Falkland Islands (Malvinas)"></asp:ListItem>
<asp:ListItem Value="71" Text="Faroe Islands"></asp:ListItem>
<asp:ListItem Value="72" Text="Fiji"></asp:ListItem>
<asp:ListItem Value="73" Text="Finland"></asp:ListItem>
<asp:ListItem Value="74" Text="France"></asp:ListItem>
<asp:ListItem Value="75" Text="French Guiana"></asp:ListItem>
<asp:ListItem Value="76" Text="French Polynesia"></asp:ListItem>
<asp:ListItem Value="77" Text="French Southern Territories"></asp:ListItem>
<asp:ListItem Value="78" Text="Gabon"></asp:ListItem>
<asp:ListItem Value="79" Text="Gambia"></asp:ListItem>
<asp:ListItem Value="80" Text="Georgia"></asp:ListItem>
<asp:ListItem Value="81" Text="Germany"></asp:ListItem>
<asp:ListItem Value="82" Text="Ghana"></asp:ListItem>
<asp:ListItem Value="83" Text="Gibraltar"></asp:ListItem>
<asp:ListItem Value="84" Text="Greece"></asp:ListItem>
<asp:ListItem Value="85" Text="Greenland"></asp:ListItem>
<asp:ListItem Value="86" Text="Grenada"></asp:ListItem>
<asp:ListItem Value="87" Text="Guadeloupe"></asp:ListItem>
<asp:ListItem Value="88" Text="Guam"></asp:ListItem>
<asp:ListItem Value="89" Text="Guatemala"></asp:ListItem>
<asp:ListItem Value="90" Text="Guernsey"></asp:ListItem>
<asp:ListItem Value="91" Text="Guinea"></asp:ListItem>
<asp:ListItem Value="92" Text="Guinea-Bissau"></asp:ListItem>
<asp:ListItem Value="93" Text="Guyana"></asp:ListItem>
<asp:ListItem Value="94" Text="Haiti"></asp:ListItem>
<asp:ListItem Value="95" Text="Heard Island And Mcdonald Islands"></asp:ListItem>
<asp:ListItem Value="96" Text="Holy See (Vatican City State)"></asp:ListItem>
<asp:ListItem Value="97" Text="Honduras"></asp:ListItem>
<asp:ListItem Value="98" Text="Hong Kong"></asp:ListItem>
<asp:ListItem Value="99" Text="Hungary"></asp:ListItem>
<asp:ListItem Value="100" Text="Iceland"></asp:ListItem>
<asp:ListItem Value="101" Text="India"></asp:ListItem>
<asp:ListItem Value="102" Text="Indonesia"></asp:ListItem>
<asp:ListItem Value="103" Text="Iran, Islamic Republic Of"></asp:ListItem>
<asp:ListItem Value="104" Text="Iraq"></asp:ListItem>
<asp:ListItem Value="105" Text="Ireland"></asp:ListItem>
<asp:ListItem Value="106" Text="Isle Of Man"></asp:ListItem>
<asp:ListItem Value="107" Text="Israel"></asp:ListItem>
<asp:ListItem Value="108" Text="Italy"></asp:ListItem>
<asp:ListItem Value="109" Text="Jamaica"></asp:ListItem>
<asp:ListItem Value="110" Text="Japan"></asp:ListItem>
<asp:ListItem Value="111" Text="Jersey"></asp:ListItem>
<asp:ListItem Value="112" Text="Jordan"></asp:ListItem>
<asp:ListItem Value="113" Text="Kazakhstan"></asp:ListItem>
<asp:ListItem Value="114" Text="Kenya"></asp:ListItem>
<asp:ListItem Value="115" Text="Kiribati"></asp:ListItem>
<asp:ListItem Value="116" Text="Korea, Democratic People'S Republic Of"></asp:ListItem>
<asp:ListItem Value="117" Text="Korea, Republic Of"></asp:ListItem>
<asp:ListItem Value="118" Text="Kuwait"></asp:ListItem>
<asp:ListItem Value="119" Text="Kyrgyzstan"></asp:ListItem>
<asp:ListItem Value="120" Text="Lao People'S Democratic Republic"></asp:ListItem>
<asp:ListItem Value="121" Text="Latvia"></asp:ListItem>
<asp:ListItem Value="122" Text="Lebanon"></asp:ListItem>
<asp:ListItem Value="123" Text="Lesotho"></asp:ListItem>
<asp:ListItem Value="124" Text="Liberia"></asp:ListItem>
<asp:ListItem Value="125" Text="Libyan Arab Jamahiriya"></asp:ListItem>
<asp:ListItem Value="126" Text="Liechtenstein"></asp:ListItem>
<asp:ListItem Value="127" Text="Lithuania"></asp:ListItem>
<asp:ListItem Value="128" Text="Luxembourg"></asp:ListItem>
<asp:ListItem Value="129" Text="Macao"></asp:ListItem>
<asp:ListItem Value="130" Text="Macedonia, The Former Yugoslav Republic Of"></asp:ListItem>
<asp:ListItem Value="131" Text="Madagascar"></asp:ListItem>
<asp:ListItem Value="132" Text="Malawi"></asp:ListItem>
<asp:ListItem Value="133" Text="Malaysia"></asp:ListItem>
<asp:ListItem Value="134" Text="Maldives"></asp:ListItem>
<asp:ListItem Value="135" Text="Mali"></asp:ListItem>
<asp:ListItem Value="136" Text="Malta"></asp:ListItem>
<asp:ListItem Value="137" Text="Marshall Islands"></asp:ListItem>
<asp:ListItem Value="138" Text="Martinique"></asp:ListItem>
<asp:ListItem Value="139" Text="Mauritania"></asp:ListItem>
<asp:ListItem Value="140" Text="Mauritius"></asp:ListItem>
<asp:ListItem Value="141" Text="Mayotte"></asp:ListItem>
<asp:ListItem Value="142" Text="Mexico"></asp:ListItem>
<asp:ListItem Value="143" Text="Micronesia, Federated States Of"></asp:ListItem>
<asp:ListItem Value="144" Text="Moldova, Republic Of"></asp:ListItem>
<asp:ListItem Value="145" Text="Monaco"></asp:ListItem>
<asp:ListItem Value="146" Text="Mongolia"></asp:ListItem>
<asp:ListItem Value="147" Text="Montserrat"></asp:ListItem>
<asp:ListItem Value="148" Text="Morocco"></asp:ListItem>
<asp:ListItem Value="149" Text="Mozambique"></asp:ListItem>
<asp:ListItem Value="150" Text="Myanmar"></asp:ListItem>
<asp:ListItem Value="151" Text="Namibia"></asp:ListItem>
<asp:ListItem Value="152" Text="Nauru"></asp:ListItem>
<asp:ListItem Value="153" Text="Nepal"></asp:ListItem>
<asp:ListItem Value="154" Text="Netherlands"></asp:ListItem>
<asp:ListItem Value="155" Text="Netherlands Antilles"></asp:ListItem>
<asp:ListItem Value="156" Text="New Caledonia"></asp:ListItem>
<asp:ListItem Value="157" Text="New Zealand"></asp:ListItem>
<asp:ListItem Value="158" Text="Nicaragua"></asp:ListItem>
<asp:ListItem Value="159" Text="Niger"></asp:ListItem>
<asp:ListItem Value="160" Text="Nigeria"></asp:ListItem>
<asp:ListItem Value="161" Text="Niue"></asp:ListItem>
<asp:ListItem Value="162" Text="Norfolk Island"></asp:ListItem>
<asp:ListItem Value="163" Text="Northern Mariana Islands"></asp:ListItem>
<asp:ListItem Value="164" Text="Norway"></asp:ListItem>
<asp:ListItem Value="165" Text="Oman"></asp:ListItem>
<asp:ListItem Value="166" Text="Pakistan"></asp:ListItem>
<asp:ListItem Value="167" Text="Palau"></asp:ListItem>
<asp:ListItem Value="168" Text="Palestinian Territory, Occupied"></asp:ListItem>
<asp:ListItem Value="169" Text="Panama"></asp:ListItem>
<asp:ListItem Value="170" Text="Papua New Guinea"></asp:ListItem>
<asp:ListItem Value="171" Text="Paraguay"></asp:ListItem>
<asp:ListItem Value="172" Text="Peru"></asp:ListItem>
<asp:ListItem Value="173" Text="Philippines"></asp:ListItem>
<asp:ListItem Value="174" Text="Pitcairn"></asp:ListItem>
<asp:ListItem Value="175" Text="Poland"></asp:ListItem>
<asp:ListItem Value="176" Text="Portugal"></asp:ListItem>
<asp:ListItem Value="177" Text="Puerto Rico"></asp:ListItem>
<asp:ListItem Value="178" Text="Qatar"></asp:ListItem>
<asp:ListItem Value="179" Text="Reunion"></asp:ListItem>
<asp:ListItem Value="180" Text="Romania"></asp:ListItem>
<asp:ListItem Value="181" Text="Russian Federation"></asp:ListItem>
<asp:ListItem Value="182" Text="Rwanda"></asp:ListItem>
<asp:ListItem Value="183" Text="Saint Helena"></asp:ListItem>
<asp:ListItem Value="184" Text="Saint Kitts And Nevis"></asp:ListItem>
<asp:ListItem Value="185" Text="Saint Lucia"></asp:ListItem>
<asp:ListItem Value="186" Text="Saint Pierre And Miquelon"></asp:ListItem>
<asp:ListItem Value="187" Text="Saint Vincent And The Grenadines"></asp:ListItem>
<asp:ListItem Value="188" Text="Samoa"></asp:ListItem>
<asp:ListItem Value="189" Text="San Marino"></asp:ListItem>
<asp:ListItem Value="190" Text="Sao Tome And Principe"></asp:ListItem>
<asp:ListItem Value="191" Text="Saudi Arabia"></asp:ListItem>
<asp:ListItem Value="192" Text="Senegal"></asp:ListItem>
<asp:ListItem Value="193" Text="Serbia And Montenegro"></asp:ListItem>
<asp:ListItem Value="194" Text="Seychelles"></asp:ListItem>
<asp:ListItem Value="195" Text="Sierra Leone"></asp:ListItem>
<asp:ListItem Value="196" Text="Singapore"></asp:ListItem>
<asp:ListItem Value="197" Text="Slovakia"></asp:ListItem>
<asp:ListItem Value="198" Text="Slovenia"></asp:ListItem>
<asp:ListItem Value="199" Text="Solomon Islands"></asp:ListItem>
<asp:ListItem Value="200" Text="Somalia"></asp:ListItem>
<asp:ListItem Value="201" Text="South Africa"></asp:ListItem>
<asp:ListItem Value="202" Text="South Georgia And The South Sandwich Islands"></asp:ListItem>
<asp:ListItem Value="203" Text="Spain"></asp:ListItem>
<asp:ListItem Value="204" Text="Sri Lanka"></asp:ListItem>
<asp:ListItem Value="205" Text="Sudan"></asp:ListItem>
<asp:ListItem Value="206" Text="Suriname"></asp:ListItem>
<asp:ListItem Value="207" Text="Svalbard And Jan Mayen"></asp:ListItem>
<asp:ListItem Value="208" Text="Swaziland"></asp:ListItem>
<asp:ListItem Value="209" Text="Sweden"></asp:ListItem>
<asp:ListItem Value="210" Text="Switzerland"></asp:ListItem>
<asp:ListItem Value="211" Text="Syrian Arab Republic"></asp:ListItem>
<asp:ListItem Value="212" Text="Taiwan, Province Of China"></asp:ListItem>
<asp:ListItem Value="213" Text="Tajikistan"></asp:ListItem>
<asp:ListItem Value="214" Text="Tanzania, United Republic Of"></asp:ListItem>
<asp:ListItem Value="215" Text="Thailand"></asp:ListItem>
<asp:ListItem Value="216" Text="Timor-Leste"></asp:ListItem>
<asp:ListItem Value="217" Text="Togo"></asp:ListItem>
<asp:ListItem Value="218" Text="Tokelau"></asp:ListItem>
<asp:ListItem Value="219" Text="Tonga"></asp:ListItem>
<asp:ListItem Value="220" Text="Trinidad And Tobago"></asp:ListItem>
<asp:ListItem Value="221" Text="Tunisia"></asp:ListItem>
<asp:ListItem Value="222" Text="Turkey"></asp:ListItem>
<asp:ListItem Value="223" Text="Turkmenistan"></asp:ListItem>
<asp:ListItem Value="224" Text="Turks And Caicos Islands"></asp:ListItem>
<asp:ListItem Value="225" Text="Tuvalu"></asp:ListItem>
<asp:ListItem Value="226" Text="Uganda"></asp:ListItem>
<asp:ListItem Value="227" Text="Ukraine"></asp:ListItem>
<asp:ListItem Value="228" Text="United Arab Emirates"></asp:ListItem>
<asp:ListItem Value="229" Text="United Kingdom"></asp:ListItem>
<asp:ListItem Value="230" Text="United States"></asp:ListItem>
<asp:ListItem Value="231" Text="United States Minor Outlying Islands"></asp:ListItem>
<asp:ListItem Value="232" Text="Uruguay"></asp:ListItem>
<asp:ListItem Value="233" Text="Uzbekistan"></asp:ListItem>
<asp:ListItem Value="234" Text="Vanuatu"></asp:ListItem>
<asp:ListItem Value="235" Text="Venezuela"></asp:ListItem>
<asp:ListItem Value="236" Text="Viet Nam"></asp:ListItem>
<asp:ListItem Value="237" Text="Virgin Islands, British"></asp:ListItem>
<asp:ListItem Value="238" Text="Virgin Islands, U.S."></asp:ListItem>
<asp:ListItem Value="239" Text="Wallis And Futuna"></asp:ListItem>
<asp:ListItem Value="240" Text="Western Sahara"></asp:ListItem>
<asp:ListItem Value="241" Text="Yemen"></asp:ListItem>
<asp:ListItem Value="242" Text="Zambia"></asp:ListItem>
<asp:ListItem Value="243" Text="Zimbabwe"></asp:ListItem>

            
            
            
            
            
            
            
            </asp:DropDownList></td><td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                        Display="None" ErrorMessage="Country required" InitialValue="0" 
                        ValidationGroup="valregister" ControlToValidate="drpcountry"></asp:RequiredFieldValidator>
                </td></tr>
           <tr><td class="asterik">*</td><td>Zipcode</td><td>:</td><td><asp:TextBox runat="server" ID="txtregistrationzipcode" CssClass="txtstyle"></asp:TextBox></td><td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                    Display="None" ErrorMessage="Zipcode required" 
                    ValidationGroup="valregister" ControlToValidate="txtregistrationzipcode"></asp:RequiredFieldValidator>
                </td></tr>
                <tr><td class="asterik">*</td><td>Contact Number</td><td>:</td><td><asp:TextBox runat="server" ID="txtregistrationcountrycode" Width="50" CssClass="txtstyle"></asp:TextBox>
                <asp:TextBox runat="server" ID="txtregistrationareacode" Width="70" CssClass="txtstyle"></asp:TextBox>
                <asp:TextBox runat="server" ID="txtregistrationcontactnumber"  CssClass="txtstyle"></asp:TextBox>
                
                </td><td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                    Display="None" ErrorMessage="Contact Number required" 
                    ValidationGroup="valregister" ControlToValidate="txtregistrationcontactnumber"></asp:RequiredFieldValidator>
                </td></tr>
                <tr><td ></td><td>Mobile</td><td>:</td><td>
                    <asp:TextBox runat="server" ID="txtregistrationmobile" CssClass="txtstyle" 
                        ></asp:TextBox></td><td>
                
                </td></tr>
                <tr><td class="asterik">*</td><td>Company name</td><td>:</td><td>
                    <asp:TextBox runat="server" ID="txtregistrationcompanyname" CssClass="txtstyle" 
                        Width="180px"></asp:TextBox></td><td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                    Display="None" ErrorMessage="Zipcode required" 
                    ValidationGroup="valregister" ControlToValidate="txtregistrationcompanyname"></asp:RequiredFieldValidator>
                </td></tr>
                 <tr><td class="asterik">*</td><td>Account Type</td><td>:</td><td>
                    <asp:RadioButtonList runat="server" ID="rdnlregistrationaccounttype" 
                         RepeatDirection="Horizontal">
                        <asp:ListItem Value="0">Seller</asp:ListItem>
                        <asp:ListItem Value="1">Buyer</asp:ListItem>
                        <asp:ListItem Value="2">Both</asp:ListItem>
                     </asp:RadioButtonList></td><td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                    Display="None" ErrorMessage="Account type required" 
                    ValidationGroup="valregister" ControlToValidate="rdnlregistrationaccounttype"></asp:RequiredFieldValidator>
                </td></tr>
                <tr><td class="asterik">*</td><td>Email(User Id)</td><td>:</td><td>
                    <asp:TextBox runat="server" ID="txtregistrationemail" CssClass="txtstyle" 
                        Width="180px"></asp:TextBox></td><td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
                    Display="None" ErrorMessage="Email required" 
                    ValidationGroup="valregister" ControlToValidate="txtregistrationemail"></asp:RequiredFieldValidator>
                </td></tr>
                 <tr><td class="asterik">*</td><td>Password</td><td>:</td><td>
                    <asp:TextBox runat="server" ID="txtregistrationpassword" TextMode="Password" CssClass="txtstyle" 
                        ></asp:TextBox></td><td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" 
                    Display="None" ErrorMessage="Password required" 
                    ValidationGroup="valregister" ControlToValidate="txtregistrationpassword"></asp:RequiredFieldValidator>
                </td></tr>
                 <tr><td class="asterik">*</td><td>Confirm Password</td><td>:</td><td>
                    <asp:TextBox runat="server" ID="txtregistrationconfirmpassword" TextMode="Password" CssClass="txtstyle" 
                        ></asp:TextBox></td><td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" 
                    Display="None" ErrorMessage="Confirm password required" 
                    ValidationGroup="valregister" ControlToValidate="txtregistrationconfirmpassword"></asp:RequiredFieldValidator>
                </td></tr>
                <tr><td colspan="5">&nbsp;</td></tr>
                <tr><td></td><td></td><td></td><td colspan="2"><a href="#" class="btnstyle">Register</a></td></tr>
                <tr><td colspan="5"><asp:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server" FilterType="Custom" ValidChars="0123456789" TargetControlID="txtregistrationzipcode"></asp:FilteredTextBoxExtender>
                <asp:FilteredTextBoxExtender ID="FilteredTextBoxExtender2" runat="server" FilterType="Custom" ValidChars="0123456789" TargetControlID="txtregistrationcountrycode"></asp:FilteredTextBoxExtender>
                <asp:FilteredTextBoxExtender ID="FilteredTextBoxExtender3" runat="server" FilterType="Custom" ValidChars="0123456789" TargetControlID="txtregistrationareacode"></asp:FilteredTextBoxExtender>
                <asp:FilteredTextBoxExtender ID="FilteredTextBoxExtender4" runat="server" FilterType="Custom" ValidChars="0123456789" TargetControlID="txtregistrationcontactnumber"></asp:FilteredTextBoxExtender>
                <asp:FilteredTextBoxExtender ID="FilteredTextBoxExtender5" runat="server" FilterType="Custom" ValidChars="0123456789" TargetControlID="txtregistrationmobile"></asp:FilteredTextBoxExtender>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtregistrationemail" ValidationGroup="valregister" ></asp:RegularExpressionValidator>
                <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToValidate="txtregistrationconfirmpassword" ControlToCompare="txtregistrationpassword" ValidationGroup="valregister"></asp:CompareValidator>
                </td></tr>
           </table>
           
           </div>
            </div> 
     <uc3:footer ID="Footer1" runat="server"></uc3:footer>
     </div>
    </form>
</body>
</html>
