<%@ Control Language="C#" AutoEventWireup="true" CodeFile="LeftMenu.ascx.cs" Inherits="smsadmin_LeftMenu" %>
<div class="sidebar">
    <div class="arrowlistmenu">
        <h3 class="menuheader" >
            Buying Plans</h3>
        <ul >
            <li><a href="AddPlan.aspx">Add a Plan</a></li>
            <li><a href="ViewPlan.aspx">View Added Plans</a></li>
            <%--<li><a href="AddShortCodePlan.aspx">Update Added Plans</a></li>--%>
        </ul>
        <h3 class="menuheader">
            Seller</h3>
        <ul  >
            <li>
                <asp:HyperLink ID="HyperLink1" runat="server" 
                    NavigateUrl="~/cms/AddProductCategory.aspx" >
                    Add Product Category</asp:HyperLink></li>
            <%--<li>
                <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="../ViewBulkSMSCustomer.aspx?flg=2">
                    Unpaid Customer&nbsp;<asp:Label ID="lblBulk_Customer_Unpaid" runat="server"></asp:Label></asp:HyperLink></li>--%>
            <li>
                <asp:HyperLink ID="HyperLink3" runat="server" 
                    NavigateUrl="~/cms/ViewProductCategory.aspx" >
                    View Product Category</asp:HyperLink></li>
                     <li>
                <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/cms/ViewProducts.aspx" >
                    View Products</asp:HyperLink></li>
                     <li><asp:HyperLink ID="HyperLink5" runat="server" 
                             NavigateUrl="~/cms/PromotedProducts.aspx" >
                    View Promotions</asp:HyperLink></li>
                    <li><asp:HyperLink ID="HyperLink7" runat="server" 
                            NavigateUrl="~/cms/ViewCustomers.aspx" >
                    View Sellers</asp:HyperLink></li>
            <%--<li>
                <asp:HyperLink ID="lnkViewAllCustomer" runat="server" NavigateUrl="../ViewBulkSMSCustomer.aspx?flg=4">
                    View All Customer&nbsp;<asp:Label ID="lblBulk_Customer_All" runat="server"></asp:Label></asp:HyperLink></li>--%>
        </ul>
        <h3 class="menuheader">
            Buyer</h3>
        <ul  >
            <li>
                <asp:HyperLink ID="HyperLink4" runat="server" 
                    NavigateUrl="~/cms/ViewBuyingLead.aspx" >
                    View Buying Leads</asp:HyperLink></li>
            <%--<li>
                <asp:HyperLink ID="HyperLink5" runat="server" NavigateUrl="../ViewResellerSMSCustomer.aspx?flg=2">
                    Unpaid Customer&nbsp;<asp:Label ID="lblReseller_Customer_Unpaid" runat="server"></asp:Label></asp:HyperLink></li>--%>
            <li>
                <asp:HyperLink ID="HyperLink6" runat="server" 
                    NavigateUrl="~/cms/ViewCustomers.aspx" >
                    View  Buyers</asp:HyperLink></li>
            <%--<li>
                <asp:HyperLink ID="HyperLink7" runat="server" NavigateUrl="../ViewResellerSMSCustomer.aspx?flg=4">
                    View All Customer&nbsp;<asp:Label ID="lblReseller_Customer_All" runat="server"></asp:Label></asp:HyperLink></li>--%>
        </ul>
        <h3 class="menuheader">
            Other</h3>
        <ul  >
            <li>
                <asp:HyperLink ID="HyperLink14" runat="server" NavigateUrl="~/cms/AddFAQ.aspx" >
                    Add FAQs</asp:HyperLink></li>
            <%--<li>
                <asp:HyperLink ID="HyperLink15" runat="server" NavigateUrl="../ViewShortCodeCustomer.aspx?flg=2">
                    Unpaid Customer&nbsp;<asp:Label ID="lblShortCode_Customer_Unpaid" runat="server"></asp:Label></asp:HyperLink></li>--%>
            <li>
                <asp:HyperLink ID="HyperLink16" runat="server" 
                    NavigateUrl="~/cms/ViewFAQs.aspx" >
                    View FAQS</asp:HyperLink></li>
                    
                     <li>
                <asp:HyperLink ID="HyperLink10" runat="server" NavigateUrl="~/cms/ViewTestimonial.aspx" >
                    View Testimonials</asp:HyperLink></li>
                     <li>
                <asp:HyperLink ID="HyperLink11" runat="server" NavigateUrl="~/cms/ViewCompanies.aspx" >
                    View Companies</asp:HyperLink></li>
                    <li>
                <asp:HyperLink ID="HyperLink18" runat="server" 
                            NavigateUrl="~/cms/ViewPhotoBankGroups.aspx" >
                    View PhotoBank</asp:HyperLink></li>
            <%--<li>
                <asp:HyperLink ID="HyperLink17" runat="server" NavigateUrl="../ViewShortCodeCustomer.aspx?flg=4">
                    View All Customer&nbsp;<asp:Label ID="lblShortCode_Customer_All" runat="server"></asp:Label></asp:HyperLink></li>--%>
        </ul>
        <h3 class="menuheader">
            Admin</h3>
        <ul  >
            <li>
                <asp:HyperLink ID="HyperLink8" runat="server" NavigateUrl="~/cms/AddPage.aspx" >
                    Add Page</asp:HyperLink></li>
                    <li>
                <asp:HyperLink ID="HyperLink12" runat="server" NavigateUrl="~/cms/AddUsers.aspx" >
                    Add Users</asp:HyperLink></li>
                     <li><asp:HyperLink ID="HyperLink13" runat="server" 
                             NavigateUrl="~/cms/ViewUsers.aspx" >
                    View Users</asp:HyperLink></li>
                      <li><asp:HyperLink ID="HyperLink15" runat="server" 
                              NavigateUrl="~/cms/AddDynamicHelp.aspx" >
                    Add Dynamic Help</asp:HyperLink></li>
                      <li><asp:HyperLink ID="HyperLink19" runat="server" 
                              NavigateUrl="~/cms/UpdateDynamicHelp.aspx" >
                    Edit Dynamic Help</asp:HyperLink></li>
                     <li><asp:HyperLink ID="HyperLink17" runat="server" 
                             NavigateUrl="~/cms/ChangePassword.aspx" >
                    Change Password</asp:HyperLink></li>
        </ul>
        <h3 class="menuheader">
            Reports</h3>
        <ul  >
            <li>
                <asp:HyperLink ID="HyperLink9" runat="server" NavigateUrl="../ViewInquiry.aspx">
                    View Reports</asp:HyperLink></li>
        </ul>
    </div>
</div>
