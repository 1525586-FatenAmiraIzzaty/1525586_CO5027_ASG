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
    <div class="contact_container">
        <div class="info">
            <h1>Contact Us</h1>
            <p>Fill in the form below and we'll get back to you within 24 hours.</p>
            <p>Thank you in advance for your feedback.</p>
        </div>
        <div class="contact-form">
            <asp:Label ID="lblName" runat="server" Text="Name:" class="contact-label"></asp:Label><asp:RequiredFieldValidator ID="reqNameValidator" runat="server" ErrorMessage="*Required" ControlToValidate="txtName" class="validation" ValidationGroup="validatedControls"></asp:RequiredFieldValidator>
            <asp:TextBox ID="txtName" runat="server" type="text" placeholder="Name is required" class="contact-input"></asp:TextBox>
            <asp:Label ID="lblEmail" runat="server" Text="Email:" class="contact-label"></asp:Label><asp:RequiredFieldValidator ID="reqEmailValidator" runat="server" ErrorMessage="*Required" ControlToValidate="txtEmail" class="validation" ValidationGroup="validatedControls"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="regExprChkEmail" runat="server" ControlToValidate="txtEmail" ErrorMessage="*e.g. someone@example.com" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" class="validation" ValidationGroup="validatedControls"></asp:RegularExpressionValidator>
            <asp:TextBox ID="txtEmail" runat="server" type="email" placeholder="Email Address" class="contact-input"></asp:TextBox>
            <asp:Label ID="lblSubject" runat="server" Text="Subject:" class="contact-label"></asp:Label><asp:RequiredFieldValidator ID="reqSubjectValidator" runat="server" ErrorMessage="*Required" ControlToValidate="txtSubject" class="validation" ValidationGroup="validatedControls"></asp:RequiredFieldValidator>
            <asp:TextBox ID="txtSubject" runat="server" type="text" placeholder="Subject" class="contact-input"></asp:TextBox>
            <asp:Label ID="lblMessage" runat="server" Text="Message:" class="contact-label"></asp:Label><asp:RequiredFieldValidator ID="reqMessageValidator" runat="server" ErrorMessage="*Required" ControlToValidate="txtMessage" class="validation" ValidationGroup="validatedControls"></asp:RequiredFieldValidator>
            <asp:TextBox ID="txtMessage" runat="server" type="text" placeholder="Message" class="contact-input" TextMode="MultiLine"></asp:TextBox>
            <asp:Button ID="btnReset" EnableClientScript="False" runat="server" Text="Reset" type="reset" title="Reset" class="contact-button" OnClick="btnReset_Click" CausesValidation="False" ValidationGroup="unvalidatedControls" />
            <asp:Button ID="btnSend" runat="server" Text="Send" OnClick="btnSend_Click" type="send" title="Submit" class="contact-button" ValidationGroup="validatedControls" />
            <span class="literal">
                <asp:Literal ID="litResult" runat="server"></asp:Literal></span>
        </div>
    </div>
    <div id="address">
        <div class="info">
            <h1>Our Location</h1>
            <p class="infoHeader">Address:</p>
            <p>Roof Top, Plaza Abdul Razak,</p>
            <p>Jalan Laksamana Abdul Razak, Bandar Seri Begawan</p>
            <p class="bottom_para">Negara Brunei Darussalam</p>
            <p class="infoHeader">Opening Hours:</p>
            <p>Monday - Sunday : 9.00AM - 6.00PM</p>
            <p class="bottom_para">Friday : 9.00AM - 12.00PM, 2.00PM - 6.00PM</p>
        </div>

        <div id="map">

            <!-- Static map display -->
            <img src="https://api.mapbox.com/styles/v1/mapbox/streets-v10/static/114.931669,4.885731,16.90,0.00,0.00/900x500@2x?access_token=pk.eyJ1IjoiMTUyNTU4Ni1mYXRlbmFtaXJhaXp6YXR5IiwiYSI6ImNqMTRqZzR3NDAwOHgzNG82enJtb2k1aWcifQ.Z90ZApEnbOHHeZ7IrTVmjQ" alt="Fleur.com.bn is located at Freshco Batu Satu near KFC and Jollibee" />
            <script>

                // This example displays a marker at the center of Australia.
                // When the user clicks the marker, an info window opens.

                function initMap() {
                    var myLatLng = { lat: 4.885731, lng: 114.931669 };
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

                    var infowindow = new google.maps.InfoWindow({
                        content: contentString
                    });

                    var marker = new google.maps.Marker({
                        position: myLatLng,
                        map: map,
                        title: 'Fleur.com.bn'
                    });
                    marker.addListener('click', function () {
                        infowindow.open(map, marker);
                    });
                }
            </script>
            <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyArNa_y6KM7_ymMw7Hwq0cwd4HMYnl78k4&callback=initMap"
                async="async" defer="defer"></script>
        </div>
    </div>
</asp:Content>
