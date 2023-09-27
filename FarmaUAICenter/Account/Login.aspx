<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/M1.Master" CodeBehind="Login.aspx.cs" Inherits="FarmaUAICenter.Account.Login" %>
<%@ MasterType VirtualPath="~/M1.Master" %> 
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceTop" runat="server">
    <div class="col-md-12">
    <div class="col-md-3" id="sec-logo">
        <img src="../img/Logo.jpg" id="logo">
    </div>
    <div class="col-md-9" id="sec-botones">
           <asp:Label ID="Label1" runat="server" class="Login" Text="Usuario: "></asp:Label>
           <asp:TextBox ID="txtUsuario" runat="server"></asp:TextBox>
           <asp:Label ID="Label2" runat="server" class="Login" Text="Contraseña: "></asp:Label>
           <asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox>
           <asp:Button ID="btnLogin" runat="server" Text="Iniciar Sesión" OnClick="btnLogin_Click"/>
           <br />
        
           <a href="RestitucionContraseña.aspx" style="color:#0000FF;   class="Loginbtn">¿Olvidaste tu contraseña? </a>
     </div> 
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceCenter" runat="server">
    <div class="col-md-12 menu">
        <asp:PlaceHolder ID="PlaceHolder1" runat="server"></asp:PlaceHolder>
</div>
</asp:Content>


<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceFooter" runat="server">

</asp:Content>