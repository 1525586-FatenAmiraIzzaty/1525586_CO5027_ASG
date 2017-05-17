<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="completePurchase.aspx.cs" Inherits="_1525586_CO5027_ASG.completePurchase" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ActiveNavigationLink" runat="server">
    <div class="menu">
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <section id="welcome">
        <h1>Complete Your Purchase</h1>
    </section>
    <section id="first_content">
        <p>By clicking Confirm Order button, you are agree to proceed the order.</p>
        <asp:Button ID="btnConfirmOrder" runat="server" Text="Confirm Order" OnClick="btnConfirmOrder_Click" />
        <div class="literal">
            <asp:Literal ID="litResult" runat="server"></asp:Literal>
        </div>
    </section>
</asp:Content>
