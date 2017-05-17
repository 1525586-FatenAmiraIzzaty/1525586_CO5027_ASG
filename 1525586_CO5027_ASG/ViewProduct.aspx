<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="ViewProduct.aspx.cs" Inherits="_1525586_CO5027_ASG.ViewProduct" %>

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
        <h1>View Product</h1>
    </section>
    <section id="first_content">
        <div>
        <asp:FormView ID="ProductFormView" runat="server" DataKeyNames="Id" DataSourceID="SqlDataSource1">
            <ItemTemplate>
                <div>
                    <asp:Image ID="displayProductImage" runat="server" Height="300px" ImageUrl='<%# Eval("product_images") %>' Width="300px" AlternateText='<%# Eval("product_desc") %>' /></div>
                </div>
                <div>
                    <asp:Label ID="ProductIdLabel" runat="server" Text="Product Id:" AssociatedControlID="lblProductId"></asp:Label>
                    <asp:Label ID="lblProductId" runat="server" Text='<%# Eval("Id") %>'></asp:Label>
                </div>
                <div>
                    <asp:Label ID="ProductNameLabel" runat="server" Text="Product Name:" AssociatedControlID="lblProductName"></asp:Label>
                    <asp:Label ID="lblProductName" runat="server" Text='<%# Bind("product_name") %>' />
                </div>
                <div>
                    <asp:Label ID="ProductDescLabel" runat="server" Text="Product Description:" AssociatedControlID="lblProductDesc"></asp:Label>
                    <asp:Label ID="lblProductDesc" runat="server" Text='<%# Bind("product_desc") %>' />
                </div>
                <div>
                    <asp:Label ID="ProductPriceLabel" runat="server" Text="Product Price: $" AssociatedControlID="lblProductPrice"></asp:Label>
                    <asp:Label ID="lblProductPrice" runat="server" Text='<%# Bind("product_price") %>' />
                </div>
                <div>
                    <asp:Label ID="ProductQtyLabel" runat="server" Text="Product Quantity:" AssociatedControlID="ProductQtyDropDownList"></asp:Label>
                    <asp:DropDownList ID="ProductQtyDropDownList" runat="server">
                        <asp:ListItem Text="--Select--" Selected="True" Value="none"></asp:ListItem>
                        <asp:ListItem Text="1" Value="1"></asp:ListItem>
                        <asp:ListItem Text="2" Value="2"></asp:ListItem>
                        <asp:ListItem Text="3" Value="3"></asp:ListItem>
                        <asp:ListItem Text="4" Value="4"></asp:ListItem>
                        <asp:ListItem Text="5" Value="5"></asp:ListItem>
                        <asp:ListItem Text="6" Value="6"></asp:ListItem>
                        <asp:ListItem Text="7" Value="7"></asp:ListItem>
                        <asp:ListItem Text="8" Value="8"></asp:ListItem>
                        <asp:ListItem Text="9" Value="9"></asp:ListItem>
                        <asp:ListItem Text="10" Value="10"></asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="reqValProdQty" runat="server" ErrorMessage="Product Quantity Required*" InitialValue="none" ControlToValidate="ProductQtyDropDownList" class="validation"></asp:RequiredFieldValidator>
                </div>
            </ItemTemplate>
        </asp:FormView>

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:IdentityConnectionString %>" SelectCommand="SELECT * FROM [tblProduct] WHERE ([Id] = @Id)">
            <SelectParameters>
                <asp:QueryStringParameter Name="Id" QueryStringField="Id" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
            </div>
        <p>Info: Shipping and packing charges of $5.00 will be applied to your order.</p>
        <div>
            <asp:Button ID="btnBuyNow" runat="server" Text="Buy Now" OnClick="btnBuyNow_Click" ToolTip="Buy now" />
            <span>
                <asp:Button ID="btnMoreProduct" runat="server" Text="More Product" OnClick="btnMoreProduct_Click" CausesValidation="false" ToolTip="Go to product page" />
            </span>
        </div>
    </section>
</asp:Content>
