<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/M1.Master"  CodeBehind="Contacto.aspx.cs" Inherits="FarmaUAICenter.Menus.Visitante.Contatco" %>
<%@ MasterType VirtualPath="~/M1.Master" %> 
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceTop" runat="server">
    <div class="col-md-12">
    <div class="col-md-2" id="sec-logo">
        <img src="../../img/Logo.png" id="logo">
    </div>
        <div class="col-md-3" >
            <h3 style="font-weight:bold;margin-bottom:2px">FARMA UAI CENTER</h3>
            <b>Todo en un solo lugar</b>
        </div>
    <div class="col-md-6" id="sec-botones">
        <asp:Button ID="b1" runat="server" Text="Volver al inicio" OnClick="Back_Click" CssClass="btn btn-secondary"/>
     </div>
   </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceCenter" runat="server">
    
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceFooter" runat="server">

    <div class="col-md-12">
        <div class="col-md-12">
        <p></p>
        <h1 style="text-align:center"><b>Contactanos !</b></h1>
        <p></p>
        
        <div>
            <b>Estamos comprometidos con vos todo el tiempo. Escucharte nos va ayudar a hacerlo mejor.</b><br /><br />
            <p>Buscanos en la FarmaUAICenter, seguro podemos ayudarte!<br />

            <br />
            Escribinos a: <a href="mailto:Consultas@farmauaicenter.com?Subject=Consulta" target="_top">Consultas@farmauaicenter.com</a><br /><br />  
        </div>
        
    </div>
    </div>
      
</asp:Content>
