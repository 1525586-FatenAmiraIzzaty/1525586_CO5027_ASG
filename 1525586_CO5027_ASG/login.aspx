<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="_1525586_CO5027_ASG.login" %>

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
            </ul>
        </nav>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <section id="welcome">
        <h1>Account</h1>
    </section>

    <section id="first_content">
        <h2>Don't have an account yet?</h2>
        <p>Creating one is really simple.</p>

        <div>
            <asp:Label ID="lblRegEmail" runat="server" Text="Email" AssociatedControlID="txtRegEmail" class="style-label"></asp:Label>
            <asp:TextBox ID="txtRegEmail" runat="server" class="style-input" ToolTip="Enter your email address" AutoCompleteType="Disabled"></asp:TextBox>
        </div>

        <div>
            <asp:RequiredFieldValidator ID="reqValRegEmail" runat="server" ControlToValidate="txtRegEmail" ErrorMessage="Enter your email." ValidationGroup="PersonalInfoGroup" class="validation"></asp:RequiredFieldValidator>
        </div>
        <div>
            <asp:RegularExpressionValidator ID="reqValExprRegEmail" runat="server" ErrorMessage="Invalid email format." ControlToValidate="txtRegEmail" ValidationGroup="PersonalInfoGroup"  class="validation" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
        </div>

        <div>
            <asp:Label ID="lblRegPassword" runat="server" Text="Password" AssociatedControlID="txtRegPassword" class="style-label"></asp:Label>
            <asp:TextBox ID="txtRegPassword" runat="server" TextMode="Password" class="style-input" ToolTip="Enter your password" AutoCompleteType="Disabled"></asp:TextBox>
        </div>
        <div>
            <asp:RequiredFieldValidator ID="reqValRegPassword" runat="server" ControlToValidate="txtRegPassword" ErrorMessage="Enter your password." ValidationGroup="PersonalInfoGroup" class="validation"></asp:RequiredFieldValidator>
        </div>
                <div>
            <asp:RegularExpressionValidator ID="reqValExprRegPassword" runat="server" ErrorMessage="The password must be eight characters." ControlToValidate="txtRegPassword" ValidationGroup="PersonalInfoGroup"  class="validation" ValidationExpression="^.{8}$"></asp:RegularExpressionValidator>
        </div>

        <div>
            <asp:Label ID="lblRegConfirmPassword" runat="server" Text="Confirm Password" AssociatedControlID="txtRegConfirmPassword" class="style-label"></asp:Label>
        </div>

        <div>
            <asp:TextBox ID="txtRegConfirmPassword" runat="server" TextMode="Password" class="style-input" ToolTip="Confirm your password" AutoCompleteType="Disabled"></asp:TextBox>
        </div>
        <div>
            <asp:CompareValidator ID="compareValRegConfirmPassword" runat="server" ErrorMessage="Password did not match." ControlToValidate="txtRegConfirmPassword" ControlToCompare="txtRegPassword" ValidationGroup="PersonalInfoGroup" class="validation"></asp:CompareValidator>
        </div>
        <div>
            <asp:RequiredFieldValidator ID="reqValRegConfirmPassword" runat="server" ControlToValidate="txtRegConfirmPassword" ErrorMessage="Enter your confirm password." ValidationGroup="PersonalInfoGroup" class="validation"></asp:RequiredFieldValidator>
        </div>
        <div>
            <span class="literal">
                <asp:Literal ID="litRegisterError" runat="server"></asp:Literal></span>
        </div>
        <!--When Button1 is clicked, only validation controls that are a part of PersonalInfoGroup are validated.-->
        <asp:Button ID="btnRegister" runat="server" Text="Register" CausesValidation="true" ValidationGroup="PersonalInfoGroup" class="style-button" OnClick="btnRegister_Click" ToolTip="Click to complete registration" />

    </section>

    <section id="second_content">
        <h2>Registered member?</h2>
        <p>Login using the following form.</p>

        <div>
            <asp:Label ID="lblLoginEmail" runat="server" Text="Email" AssociatedControlID="txtLoginEmail" class="style-label"></asp:Label>
            <asp:TextBox ID="txtLoginEmail" runat="server" class="style-input" ToolTip="Enter your valid email / username" AutoCompleteType="Disabled"></asp:TextBox>
        </div>

        <div>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtLoginEmail" ErrorMessage="Enter your registered email." ValidationGroup="RegisterInfoGroup" class="validation"></asp:RequiredFieldValidator>
        </div>

        <div>
            <asp:Label ID="lblLoginPassword" runat="server" Text="Password" AssociatedControlID="txtLoginPassword" class="style-label"></asp:Label>
            <asp:TextBox ID="txtLoginPassword" runat="server" TextMode="Password" class="style-input" ToolTip="Enter your password" AutoCompleteType="Disabled"></asp:TextBox>
        </div>

        <div>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtLoginPassword" ErrorMessage="Enter your password." ValidationGroup="RegisterInfoGroup" class="validation"></asp:RequiredFieldValidator>
        </div>

        <div>
            <span class="literal">
                <asp:Literal ID="litLoginError" runat="server"></asp:Literal></span>
        </div>
        <!--When Button1 is clicked, only validation controls that are a part of PersonalInfoGroup are validated.-->
        <asp:Button ID="btnLogin" runat="server" Text="Login" CausesValidation="true" ValidationGroup="RegisterInfoGroup" class="style-button" OnClick="btnLogin_Click" />

    </section>
</asp:Content>
