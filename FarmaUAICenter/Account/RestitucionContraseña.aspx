<%@ Page Language="C#" MasterPageFile="~/M1.Master" AutoEventWireup="true" CodeBehind="RestitucionContraseña.aspx.cs" Inherits="FarmaUAICenter.Account.RestitucionContraseña" %>
<%@ MasterType VirtualPath="~/M1.Master" %> 
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceTop" runat="server">
    <div class="col-md-12">
    <div class="col-md-3" id="sec-logo">
        <img src="../img/Logo.jpg" id="logo">
    </div>
    <div class="col-md-9" id="sec-botones">
           <asp:Label ID="Label1" runat="server" Text="Usuario: " Font-Bold="true"></asp:Label>
           <asp:TextBox ID="user" runat="server"></asp:TextBox>
           <asp:Label ID="Label2" runat="server" Text="Palabra Clave: " Font-Bold="true"></asp:Label>
           <asp:Label ID="Errorpalabraclave" runat="server" Text="Label"></asp:Label>
           <asp:TextBox ID="PalabraRestitucion" runat="server"></asp:TextBox>
           <asp:Button ID="enviar" runat="server" Text="Recuperar Contraseña" OnClick="enviar_Click"/>
           <br /> 
           <a href="../Default.aspx" style="color:#0000FF; class="Loginbtn" >Volver al menu </a>     
     </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceCenter" runat="server">

           </a>

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceFooter" runat="server">
        <br /><br />
        <asp:Label ID="Contraseña" runat="server" Text="" Font-Bold="true"></asp:Label>
        <br />
        <br />
        
</asp:Content>
