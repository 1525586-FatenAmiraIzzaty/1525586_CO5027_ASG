﻿<%@ Page Title="Home Page | Fleur.com.bn." Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="_1525586_CO5027_ASG._default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ActiveNavigationLink" runat="server">
    <div class="menu">
        <nav>
            <ul>
                <li class="active"><a href="~/default.aspx" title="Go to Home" runat="server">
                    <img src="images/home-icon.png" width="25" height="25" alt="Go To Home Page" />
                    Home</a></li>
                <li><a href="~/products.aspx" title="Go to Products" runat="server">
                    <img src="images/product-icon.png" width="25" height="25" alt="Go To Product Page" />
                    Products</a></li>
                <li><a href="~/contactUs.aspx" title="Go to Contact Us" runat="server">
                    <img src="images/contact-icon.png" width="25" height="25" alt="Go To Contact Us Page" />
                    Contact Us</a></li>
                <li><a href="~/login.aspx" title="Go to Account" runat="server">
                    <img src="images/account-icon.png" width="25" height="25" alt="Go To Account Page" />
                    Account</a></li>
            </ul>
        </nav>
    </div>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <section id="welcome">
        <img src="~/images/welcome.png" runat="server" alt="Welcome To Fleur.com.bn." />
        <h1>Welcome to Fleur.com.bn.</h1>
        <p>Now you can buy and send flowers as a gifts all over <strong>Brunei Darussalam and Internationally</strong>. Please use the links on our site to browse our products.</p>
        <p>
            Our online gifts and flowers service is <strong>quick and simple</strong>. We are committed in providing <strong>excellent services</strong>,
            <strong>continuously innovating</strong> and offering these <strong>quality products</strong> to our customers. Be a smart shoppers who love value-for-money and of course, FLOWERS!
        </p>
    </section>

    <section id="first_content">
        <h2>Latest Product</h2>
        <p><strong>Minimal price, maximum impression.</strong> These flower bouquets still pack all the style, charm and freshness you’ve come to expect from us. So go ahead, save a few dollars. We won’t tell.</p>
        <asp:Repeater ID="rptrProducts" runat="server" DataSourceID="SqlDataSource1">
            <HeaderTemplate><div></HeaderTemplate>
            <ItemTemplate>
                <div class="rptrProduct">
                    <a href="<%# Eval ("Id", "ViewProduct.aspx?Id={0}") %>">
                        <div>
                            <asp:Image ID="displayProductImage" runat="server" Height="200px" ImageUrl='<%# Eval("product_images") %>' Width="200px" AlternateText='<%# Eval("product_desc") %>' /></div>
                        <div><%# Eval ("product_name") %></div>
                        <div><asp:Label ID="lblProductPrice" runat="server" Text="$"></asp:Label><%# Eval ("product_price") %></div>
                        <div><asp:Label ID="lblProductQty" runat="server" Text="Qty: "></asp:Label><%# Eval ("product_qty") %></div>
                    </a>
                </div>
            </ItemTemplate>
            <FooterTemplate></div></FooterTemplate>
        </asp:Repeater>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:IdentityConnectionString %>" SelectCommand="SELECT * FROM [tblProduct]"></asp:SqlDataSource>
    </section>

    <section id="social_media">
        <hr />
        <h3>Connect With Us:</h3>
        <a href="#" target="_blank" title="Facebook">
            <img src="images/facebook.png" alt="Go To Facebook" /></a>
        <a href="#" target="_blank" title="Instagram">
            <img src="images/instagram.png" alt="Go To Instagram" /></a>
        <a href="#" target="_blank" title="Twitter">
            <img src="images/twitter.png" alt="Go To Twitter" /></a>
        <a href="#" target="_blank" title="Call us at +673 8288684">
            <img src="images/contactus.png" alt="Call Us at +673 8288684" /></a>
    </section>
</asp:Content>
