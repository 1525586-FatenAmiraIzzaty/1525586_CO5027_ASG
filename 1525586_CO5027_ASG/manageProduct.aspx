<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="manageProduct.aspx.cs" Inherits="_1525586_CO5027_ASG.manageProduct" %>

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
                <li><a href="~/login.aspx" title="Go to Account" runat="server">
                    <img src="images/account-icon.png" width="25" height="25" alt="Go To Account Page" />
                    Account</a></li>
                <li class="active"><a href="~/manageProduct.aspx" title="Go to Manage Products Page" runat="server">
                    <img src="images/admin-icon.png" width="25" height="25" alt="Go to Manage Products Page" />
                    Manage Products</a></li>
            </ul>
        </nav>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <section id="welcome">
        <h1>Manage Product</h1>
        <asp:Button ID="btnLogOut" runat="server" Text="Logout" OnClick="btnLogOut_Click" OnClientClick="return confirm('Are you certain you want to logout?')" />
    </section>

    <section id="first_content">

        <asp:GridView ID="ProductGridView" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource1" GridLines="None" CssClass="cssGridView" AlternatingRowStyle-CssClass="alt" PageSize="5">
            <AlternatingRowStyle CssClass="alt"></AlternatingRowStyle>
            <Columns>
                <asp:CommandField ButtonType="Button" ShowSelectButton="True" />
                <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
                <asp:BoundField DataField="product_name" HeaderText="Name" SortExpression="product_name" />
                <asp:BoundField DataField="product_desc" HeaderText="product_desc" SortExpression="product_desc" Visible="False" />
                <asp:BoundField DataField="product_price" HeaderText="Price" SortExpression="product_price" />
                <asp:BoundField DataField="product_qty" HeaderText="Quantity" SortExpression="product_qty" />
                <asp:TemplateField HeaderText="Images" SortExpression="product_images">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("product_images") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Image ID="Image1" runat="server" Height="200px" ImageUrl='<%# Eval("product_images") %>' Width="200px" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <PagerSettings Mode="NextPrevious" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:IdentityConnectionString %>" SelectCommand="SELECT * FROM [tblProduct]"></asp:SqlDataSource>

    </section>

    <section id="second_content">

        <asp:FormView ID="ProductFormView" runat="server" AllowPaging="True" DataKeyNames="Id" DataSourceID="SqlDataSource2" OnItemDeleted="ProductFormView_ItemDeleted" OnItemInserted="ProductFormView_ItemInserted" OnItemUpdated="ProductFormView_ItemUpdated">
            <EditItemTemplate>
                <div>
                    <asp:Label ID="ProductIdLabelEdit1" runat="server" Text="Product Id:" AssociatedControlID="ProductIdLabelEdit"></asp:Label>
                    <asp:Label ID="ProductIdLabelEdit" runat="server" Text='<%# Eval("Id") %>' />
                </div>
                <div>
                    <asp:Label ID="ProductNameLabelEdit1" runat="server" Text="Product Name:" AssociatedControlID="txtProductNameEdit"></asp:Label>
                    <asp:TextBox ID="txtProductNameEdit" runat="server" Text='<%# Bind("product_name") %>' />
                    <asp:RequiredFieldValidator ID="reqValProdNameEdit" runat="server" ErrorMessage="Product Name Required*" ControlToValidate="txtProductNameEdit" class="validation"></asp:RequiredFieldValidator>
                </div>
                <div>
                    <asp:Label ID="ProductDescLabelEdit1" runat="server" Text="Product Description:" AssociatedControlID="txtProductDescEdit"></asp:Label>
                </div>
                <div>
                    <asp:TextBox ID="txtProductDescEdit" runat="server" Text='<%# Bind("product_desc") %>' TextMode="MultiLine" Width="100%" />
                    <asp:RequiredFieldValidator ID="reqValProdDescEdit" runat="server" ErrorMessage="Product Description Required*" ControlToValidate="txtProductDescEdit" class="validation"></asp:RequiredFieldValidator>
                </div>
                <div>
                    <asp:Label ID="ProductPriceLabelEdit1" runat="server" Text="Product Price:$" AssociatedControlID="txtProductPriceEdit"></asp:Label>
                    <asp:TextBox ID="txtProductPriceEdit" runat="server" Text='<%# Bind("product_price") %>' />
                    <asp:RequiredFieldValidator ID="reqValProdPriceEdit" runat="server" ErrorMessage="Product Price Required*" ControlToValidate="txtProductPriceEdit" class="validation"></asp:RequiredFieldValidator>
                    <div>
                        <asp:RegularExpressionValidator ID="reqValExprProdPriceEdit" runat="server" ErrorMessage="Price must be greater than zero, for decimal up to two digits and cannot include the currency symbol*" ControlToValidate="txtProductPriceEdit" ValidationExpression="^[1-9]\d*(\.\d{1,2})?" class="validation"></asp:RegularExpressionValidator>
                    </div>
                </div>
                <div>
                    <asp:Label ID="ProductQtyLabelEdit1" runat="server" Text="Product Quantity:" AssociatedControlID="txtProductQtyEdit"></asp:Label>
                    <asp:TextBox ID="txtProductQtyEdit" runat="server" Text='<%# Bind("product_qty") %>' />
                    <asp:RequiredFieldValidator ID="reqValProdQtyEdit" runat="server" ErrorMessage="Product Quantity Required*" ControlToValidate="txtProductQtyEdit" class="validation"></asp:RequiredFieldValidator>
                    <div>
                        <asp:RegularExpressionValidator ID="reqValExprProdQtyEdit" runat="server" ErrorMessage="Quantity must be greater than 0 and less than 100*" ControlToValidate="txtProductQtyEdit" ValidationExpression="^[1-9]\d?" class="validation"></asp:RegularExpressionValidator>
                    </div>
                </div>
                <div>
                    <asp:Label ID="ProductImageLabelEdit1" runat="server" Text="Product Image:" AssociatedControlID="FileUploadImage"></asp:Label>
                </div>
                <div>
                    <asp:FileUpload ID="FileUploadImage" runat="server" />
                </div>
                <div>
                    <asp:LinkButton ID="SaveImageLink" runat="server" OnClick="SaveLinkButton_Click" ToolTip="Click here to update and save the image">Save Image</asp:LinkButton>
                    <span>
                        <asp:Label ID="ImageUrlLabel" runat="server" Text='<%# Bind("product_images") %>'></asp:Label></span>
                </div>
                <div>
                    <asp:Button ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" OnClientClick="return confirm('Are you certain you want to update this product?')" />
                    <span>
                        <asp:Button ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" /></span>
                </div>
            </EditItemTemplate>
            <InsertItemTemplate>
                <div>
                    <asp:Label ID="ProductNameLabelAdd" runat="server" Text="Product Name:" AssociatedControlID="txtProductNameAdd"></asp:Label>
                    <asp:TextBox ID="txtProductNameAdd" runat="server" Text='<%# Bind("product_name") %>' />
                    <asp:RequiredFieldValidator ID="reqValProdNameAdd" runat="server" ErrorMessage="Product Name Required*" ControlToValidate="txtProductNameAdd" class="validation"></asp:RequiredFieldValidator>
                </div>
                <div>
                    <asp:Label ID="ProductDescLabelAdd" runat="server" Text="Product Description:" AssociatedControlID="txtProductDescAdd"></asp:Label>
                    </div>
                <div>
                    <asp:TextBox ID="txtProductDescAdd" runat="server" Text='<%# Bind("product_desc") %>' TextMode="MultiLine" Width="100%" />
                    <asp:RequiredFieldValidator ID="reqValProdDescAdd" runat="server" ErrorMessage="Product Description Required*" ControlToValidate="txtProductDescAdd" class="validation"></asp:RequiredFieldValidator>
                </div>
                <div>
                    <asp:Label ID="ProductPriceLabelAdd" runat="server" Text="Product Price:$" AssociatedControlID="txtProductPriceAdd"></asp:Label>
                    <asp:TextBox ID="txtProductPriceAdd" runat="server" Text='<%# Bind("product_price") %>' />
                    <asp:RequiredFieldValidator ID="reqValProdPriceAdd" runat="server" ErrorMessage="Product Price Required*" ControlToValidate="txtProductPriceAdd" class="validation"></asp:RequiredFieldValidator>
                    <div>
                        <asp:RegularExpressionValidator ID="reqValExprProdPriceAdd" runat="server" ErrorMessage="Price must be greater than zero, for decimal up to two digits and cannot include the currency symbol*" ControlToValidate="txtProductPriceAdd" ValidationExpression="^[1-9]\d*(\.\d{1,2})?" class="validation"></asp:RegularExpressionValidator>
                    </div>
                </div>
                <div>
                    <asp:Label ID="ProductQtyLabelAdd" runat="server" Text="Product Quantity:" AssociatedControlID="txtProductQtyAdd"></asp:Label>
                    <asp:TextBox ID="txtProductQtyAdd" runat="server" Text='<%# Bind("product_qty") %>' />
                    <asp:RequiredFieldValidator ID="reqValProdQtyAdd" runat="server" ErrorMessage="Product Quantity Required*" ControlToValidate="txtProductQtyAdd" class="validation"></asp:RequiredFieldValidator>
                    <div>
                        <asp:RegularExpressionValidator ID="reqValExprProdQtyAdd" runat="server" ErrorMessage="Quantity must be greater than 0 and less than 100*" ControlToValidate="txtProductQtyAdd" ValidationExpression="^[1-9]\d?" class="validation"></asp:RegularExpressionValidator>
                    </div>
                </div>
                <div>
                    <asp:Label ID="ProductImageLabelAdd" runat="server" Text="Product Image:" AssociatedControlID="FileUploadImage"></asp:Label>
                </div>
                <asp:FileUpload ID="FileUploadImage" runat="server" />
                <div>
                    <asp:LinkButton ID="SaveLinkButtonAdd" runat="server" OnClick="SaveLinkButton_Click">Save Image</asp:LinkButton>
                </div>
                <asp:Label ID="ImageUrlLabel" runat="server" Text='<%# Bind("product_images") %>'></asp:Label>
                </div>
                <div>
                    <asp:Image ID="displayProductImage" runat="server" Height="200px" ImageUrl='<%# Eval("product_images") %>' Width="200px" />
                </div>
                <div>
                    <asp:Button ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" OnClientClick="return confirm('Are you certain you want to add this product?')" />
                    <span>
                        <asp:Button ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                    </span>
                </div>
            </InsertItemTemplate>
            <ItemTemplate>
                <div>
                    <asp:Label ID="ProductIdLabel" runat="server" Text="Product Id:" AssociatedControlID="txtProductId"></asp:Label>
                    <asp:Label ID="txtProductId" runat="server" Text='<%# Eval("Id") %>'></asp:Label>
                </div>
                <div>
                    <asp:Label ID="ProductNameLabel" runat="server" Text="Product Name:" AssociatedControlID="txtProductName"></asp:Label>
                    <asp:Label ID="txtProductName" runat="server" Text='<%# Bind("product_name") %>' />
                </div>
                <div>
                    <asp:Label ID="ProductDescLabel" runat="server" Text="Product Description:" AssociatedControlID="txtProductDesc"></asp:Label>
                </div>
                <div>
                    <asp:Label ID="txtProductDesc" runat="server" Text='<%# Bind("product_desc") %>' />
                </div>
                <div>
                    <asp:Label ID="ProductPriceLabel" runat="server" Text="Product Price:$" AssociatedControlID="txtProductPrice"></asp:Label>
                    <asp:Label ID="txtProductPrice" runat="server" Text='<%# Bind("product_price") %>' />
                </div>
                <div>
                    <asp:Label ID="ProductQtyLabel" runat="server" Text="Product Quantity:" AssociatedControlID="txtProductQty"></asp:Label>
                    <asp:Label ID="txtProductQty" runat="server" Text='<%# Bind("product_qty") %>' />
                </div>
                <div>
                    <asp:Label ID="ProductImageLabel" runat="server" Text="Product Image:" AssociatedControlID="product_imagesLabel"></asp:Label>
                </div>
                <div>
                    <asp:HiddenField ID="product_imagesLabel" runat="server" Value='<%# Bind("product_images") %>' />
                    <asp:Image ID="Image1" runat="server" Height="200px" ImageUrl='<%# Eval("product_images") %>' Width="200px" />
                </div>
                <div>
                    <asp:Button ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" />
                    <span>
                        <asp:Button ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" OnClientClick="return confirm('Are you certain you want to delete this product?')" /></span>
                    <span>
                        <asp:Button ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" /></span>
                </div>

            </ItemTemplate>
        </asp:FormView>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:IdentityConnectionString %>" DeleteCommand="DELETE FROM [tblProduct] WHERE [Id] = @original_Id AND (([product_name] = @original_product_name) OR ([product_name] IS NULL AND @original_product_name IS NULL)) AND (([product_desc] = @original_product_desc) OR ([product_desc] IS NULL AND @original_product_desc IS NULL)) AND (([product_price] = @original_product_price) OR ([product_price] IS NULL AND @original_product_price IS NULL)) AND (([product_qty] = @original_product_qty) OR ([product_qty] IS NULL AND @original_product_qty IS NULL)) AND (([product_images] = @original_product_images) OR ([product_images] IS NULL AND @original_product_images IS NULL))" InsertCommand="INSERT INTO [tblProduct] ([product_name], [product_desc], [product_price], [product_qty], [product_images]) VALUES (@product_name, @product_desc, @product_price, @product_qty, @product_images)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [tblProduct] WHERE ([Id] = @Id)" UpdateCommand="UPDATE [tblProduct] SET [product_name] = @product_name, [product_desc] = @product_desc, [product_price] = @product_price, [product_qty] = @product_qty, [product_images] = @product_images WHERE [Id] = @original_Id AND (([product_name] = @original_product_name) OR ([product_name] IS NULL AND @original_product_name IS NULL)) AND (([product_desc] = @original_product_desc) OR ([product_desc] IS NULL AND @original_product_desc IS NULL)) AND (([product_price] = @original_product_price) OR ([product_price] IS NULL AND @original_product_price IS NULL)) AND (([product_qty] = @original_product_qty) OR ([product_qty] IS NULL AND @original_product_qty IS NULL)) AND (([product_images] = @original_product_images) OR ([product_images] IS NULL AND @original_product_images IS NULL))">
            <DeleteParameters>
                <asp:Parameter Name="original_Id" Type="Int32" />
                <asp:Parameter Name="original_product_name" Type="String" />
                <asp:Parameter Name="original_product_desc" Type="String" />
                <asp:Parameter Name="original_product_price" Type="Double" />
                <asp:Parameter Name="original_product_qty" Type="Int32" />
                <asp:Parameter Name="original_product_images" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="product_name" Type="String" />
                <asp:Parameter Name="product_desc" Type="String" />
                <asp:Parameter Name="product_price" Type="Double" />
                <asp:Parameter Name="product_qty" Type="Int32" />
                <asp:Parameter Name="product_images" Type="String" />
            </InsertParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="ProductGridView" Name="Id" PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="product_name" Type="String" />
                <asp:Parameter Name="product_desc" Type="String" />
                <asp:Parameter Name="product_price" Type="Double" />
                <asp:Parameter Name="product_qty" Type="Int32" />
                <asp:Parameter Name="product_images" Type="String" />
                <asp:Parameter Name="original_Id" Type="Int32" />
                <asp:Parameter Name="original_product_name" Type="String" />
                <asp:Parameter Name="original_product_desc" Type="String" />
                <asp:Parameter Name="original_product_price" Type="Double" />
                <asp:Parameter Name="original_product_qty" Type="Int32" />
                <asp:Parameter Name="original_product_images" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>

    </section>
</asp:Content>
