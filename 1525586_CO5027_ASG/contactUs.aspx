<%@ Page Title="Contact Us Page | Fleur.com.bn." Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="contactUs.aspx.cs" Inherits="_1525586_CO5027_ASG.contactUs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ActiveNavigationLink" runat="server">
    <div class="menu">
        <nav>
            <ul>
                <li><a href="~/default.aspx" title="Home" runat="server">
                    <img src="images/home-icon.png" width="25" height="25" alt="Go To Home Page" />
                    Home</a></li>
                <li><a href="~/products.aspx" title="Products" runat="server">
                    <img src="images/product-icon.png" width="25" height="25" alt="Go To Product Page" />
                    Products</a></li>
                <li class="active"><a href="~/contactUs.aspx" title="Contact Us" runat="server">
                    <img src="images/contact-icon.png" width="25" height="25" alt="Go To Contact Us Page" />
                    Contact Us</a></li>
                <li><a href="~/cart.aspx" title="Cart" runat="server">
                    <img src="images/shoppingcart-icon.png" width="25" height="25" alt="Go To Cart Page" />
                    Cart</a></li>
                <li><a href="~/account.aspx" title="Account" runat="server">
                    <img src="images/account-icon.png" width="25" height="25" alt="Go To Account Page" />
                    Account</a></li>
            </ul>
        </nav>
    </div>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <section id="first_content">
        <div class="contact-form">
            <h1>Contact Us</h1>
            <p>Fill in the form below and we'll get back to you within 24 hours.</p>
            <p>Thank you in advance for your feedback.</p>
            <asp:Label ID="lblName" runat="server" Text="Name:" class="contact-label"></asp:Label><asp:RequiredFieldValidator ID="reqNameValidator" runat="server" ErrorMessage="*Required" ControlToValidate="txtName" class="validation" ValidationGroup="validatedControls"></asp:RequiredFieldValidator>
            <asp:TextBox ID="txtName" runat="server" placeholder="Name is required" class="contact-input" TabIndex="1"></asp:TextBox>
            <asp:Label ID="lblEmail" runat="server" Text="Email:" class="contact-label"></asp:Label><asp:RequiredFieldValidator ID="reqEmailValidator" runat="server" ErrorMessage="*Required" ControlToValidate="txtEmail" class="validation" ValidationGroup="validatedControls"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="regExprChkEmail" runat="server" ControlToValidate="txtEmail" ErrorMessage="*e.g. someone@example.com" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" class="validation" ValidationGroup="validatedControls"></asp:RegularExpressionValidator>
            <asp:TextBox ID="txtEmail" runat="server" placeholder="Email Address is required" class="contact-input" TabIndex="2"></asp:TextBox>
            <asp:Label ID="lblSubject" runat="server" Text="Subject:" class="contact-label"></asp:Label><asp:RequiredFieldValidator ID="reqSubjectValidator" runat="server" ErrorMessage="*Required" ControlToValidate="txtSubject" class="validation" ValidationGroup="validatedControls"></asp:RequiredFieldValidator>
            <asp:TextBox ID="txtSubject" runat="server" placeholder="Subject is required" class="contact-input" TabIndex="3"></asp:TextBox>
            <asp:Label ID="lblMessage" runat="server" Text="Message:" class="contact-label"></asp:Label><asp:RequiredFieldValidator ID="reqMessageValidator" runat="server" ErrorMessage="*Required" ControlToValidate="txtMessage" class="validation" ValidationGroup="validatedControls"></asp:RequiredFieldValidator>
            <asp:TextBox ID="txtMessage" runat="server" placeholder="Message is required" class="contact-input" TextMode="MultiLine" TabIndex="4"></asp:TextBox>
            <asp:Button ID="btnReset" runat="server" Text="Reset"  title="Reset" class="contact-button" OnClick="btnReset_Click" CausesValidation="False" ValidationGroup="unvalidatedControls" />
            <asp:Button ID="btnSend" runat="server" Text="Send" OnClick="btnSend_Click" title="Submit" class="contact-button" ValidationGroup="validatedControls" />
            <span class="literal">
                <asp:Literal ID="litResult" runat="server"></asp:Literal></span>
        </div>
    </section>

    <section id="second_content">
        <h2>Opening Hours</h2>
        <p>Monday - Sunday : 9.00AM - 6.00PM</p>
        <p class="bottom_para">Friday : 9.00AM - 12.00PM, 2.00PM - 6.00PM</p>
        <h2>Our Location</h2>
        <p>Roof Top, Plaza Abdul Razak,</p>
        <p>Jalan Laksamana Abdul Razak, Bandar Seri Begawan</p>
        <p class="bottom_para">Negara Brunei Darussalam</p>
        <div id="map">
            <script>

                // This example displays a marker at the center of Australia.
                // When the user clicks the marker, an info window opens.

                function initMap() {
                    var myLatLng = { lat: 4.885991, lng: 114.931261 };
                    var collegeLatLng = { lat: 4.885731, lng: 114.931669 };
                    var map = new google.maps.Map(document.getElementById('map'), {
                        zoom: 19,
                        center: myLatLng
                    });

                    var contentString = '<div id="content">' +
                        '<div id="siteNotice">' +
                        '</div>' +
                        '<h1 id="firstHeading" class="firstHeading">Fleur.com.bn.</h1>' +
                        '<div id="bodyContent">' +
                        '<p><b>We are located here!</b></p>' +
                        '</div>' +
                        '</div>';

                    var contentString1 = '<div id="content">' +
                        '<div id="siteNotice">' +
                        '</div>' +
                        '<h1 id="firstHeading" class="firstHeading">Laksamana College of Business</h1>' +
                        '<div id="bodyContent">' +
                        '<p><b>College located here!</b></p>' +
                        '</div>' +
                        '</div>';

                    var infowindow = new google.maps.InfoWindow({
                        content: contentString
                    });

                    var infowindow1 = new google.maps.InfoWindow({
                        content: contentString1
                    });

                    var marker = new google.maps.Marker({
                        position: myLatLng,
                        map: map,
                        title: 'Fleur.com.bn'
                    });
                    marker.addListener('click', function () {
                        infowindow.open(map, marker);
                    });

                    var marker1 = new google.maps.Marker({
                        position: collegeLatLng,
                        map: map,
                        title: 'Laksamana College of Business'
                    });
                    marker1.addListener('click', function () {
                        infowindow1.open(map, marker1);
                    });
                }
            </script>
            <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyArNa_y6KM7_ymMw7Hwq0cwd4HMYnl78k4&callback=initMap"
                async="async" defer="defer"></script>
        </div>
    </section>
</asp:Content>
