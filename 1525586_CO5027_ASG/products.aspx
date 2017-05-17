<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="products.aspx.cs" Inherits="_1525586_CO5027_ASG.product" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ActiveNavigationLink" runat="server">
        <div class="menu">
        <nav>
            <ul>
                <li><a href="~/default.aspx" title="Go to Home" runat="server">
                    <img src="images/home-icon.png" width="25" height="25" alt="Go To Home Page" />
                    Home</a></li>
                <li class="active"><a href="~/products.aspx" title="Go to Products" runat="server">
                    <img src="images/product-icon.png" width="25" height="25" alt="Go To Product Page" />
                    Products</a></li>
                <li><a href="~/contactUs.aspx" title="Go to Contact Us" runat="server">
                    <img src="images/contact-icon.png" width="25" height="25" alt="Go To Contact Us Page" />
                    Contact Us</a></li>
                <li><a href="~/cart.aspx" title="Go to Cart" runat="server">
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
        <h1>Products</h1>
    </section>
    <section id="first_content">
        <p><strong>Minimal price, maximum impression.</strong> These flower bouquets still pack all the style, charm and freshness you’ve come to expect from us. So go ahead, save a few dollars. We won’t tell.</p>
        <asp:Repeater ID="rptrProducts" runat="server" DataSourceID="SqlDataSource1">
            <HeaderTemplate><div></HeaderTemplate>
            <ItemTemplate>
                <div class="rptrProduct">
                    <a href="<%# Eval ("Id", "ViewProduct.aspx?Id={0}") %>">
                        <div>
                            <asp:Image ID="displayProductImage" runat="server" Height="200px" ImageUrl='<%# Eval("product_images") %>' Width="200px" AlternateText='<%# Eval("product_desc") %>' /></div>
                        <div><%# Eval ("product_name") %></div>
                        <div>$<%# Eval ("product_price") %></div>
                        <div>Qty: <%# Eval ("product_qty") %></div>
                        <div>
                            View Details</div>
                    </a>
                </div>
            </ItemTemplate>
            <FooterTemplate></div></FooterTemplate>
        </asp:Repeater>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:IdentityConnectionString %>" SelectCommand="SELECT * FROM [tblProduct]"></asp:SqlDataSource>
    </section>
</asp:Content>
