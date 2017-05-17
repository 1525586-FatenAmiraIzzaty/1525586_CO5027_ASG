<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="cart.aspx.cs" Inherits="_1525586_CO5027_ASG.cart" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ActiveNavigationLink" runat="server">
        <div class="menu">
        <nav>
            <ul>
                <li><a href="~/default.aspx" title="Go to Home" runat="server">
                    <img src="images/home-icon.png" width="25" height="25" alt="Go To Home Page" />
                    Home</a></li>
                <li><a href="~/products.aspx" title="Go to Products" runat="server">
                    <img src="images/product-icon.png" width="25" height="25" alt="Go To Product Page" />
                    Products</a></li>
                <li><a href="~/contactUs.aspx" title="Go to Contact Us" runat="server">
                    <img src="images/contact-icon.png" width="25" height="25" alt="Go To Contact Us Page" />
                    Contact Us</a></li>
                <li class="active"><a href="~/cart.aspx" title="Go to Cart" runat="server">
                    <img src="images/shoppingcart-icon.png" width="25" height="25" alt="Go To Cart Page" />
                    Cart</a></li>
                <li><a href="~/login.aspx" title="Go to Account" runat="server">
                    <img src="images/account-icon.png" width="25" height="25" alt="Go To Account Page" />
                    Account</a></li>
            </ul>
        </nav>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <section id="welcome">
        <h1>Cart</h1>
        <asp:Button ID="btnLogOut" runat="server" Text="Logout" OnClick="btnLogOut_Click" OnClientClick="return confirm('Are you certain you want to logout?')" />
    </section>
</asp:Content>
