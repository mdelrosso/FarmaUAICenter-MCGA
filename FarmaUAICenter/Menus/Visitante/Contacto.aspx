<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/M1.Master"  CodeBehind="Contacto.aspx.cs" Inherits="FarmaUAICenter.Menus.Visitante.Contatco" %>
<%@ MasterType VirtualPath="~/M1.Master" %> 
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceTop" runat="server">
<div class="col-md-12">
    <div class="col-md-3" id="sec-logo">
        <img src="/../../img/Logo.jpg" id="logo">
    </div>
    <div class="col-md-9" id="sec-botones">

     </div>
   </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceCenter" runat="server">        
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceFooter" runat="server">

    <br />
    <div class="col-md-1">
    </div>
    <div style='background-color:steelblue;'>
        <h1 style="text-align:center;color: white;">Contactanos!</h1>     
        <br />
        <%--<div class="col-md-3">
            <img src="/../../img/Contacto.png" alt="contacto1"/>
        </div>--%>
        <div style="background-color:steelblue;color: white;">
            <b>Estamos comprometidos con vos todo el tiempo. Escucharte nos va ayudar a hacerlo mejor.</b><br /><br />
            <p>Buscanos en la FarmaUAICenter, seguro podemos ayudarte!<br />

            <br />
            Escribinos a: <a style="color:white" href="mailto:Consultas@farmauaicenter.com?Subject=Consulta" target="_top">Consultas@farmauaicenter.com</a><br /><br />  
        </div>
        
    </div>
    <div class="col-md-1">
    </div>
    <div align="center">
    <br/>
        <a href="../../Default.aspx">
            Volver
            <br/>
            <img src="../../img/Back.png"   width="52px" height="52px"/>
        </a>

    </div>
      
</asp:Content>
