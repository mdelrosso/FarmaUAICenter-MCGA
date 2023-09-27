<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/M1.Master" CodeBehind="DigitosVerificadores.aspx.cs" Inherits="FarmaUAICenter.Menus.Administrador.DigitosVerificadores" %>
<%@ MasterType VirtualPath="~/M1.Master" %> 
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceTop" runat="server">
<div class="col-md-3" id="sec-logo">
        <img src="../../img/Logo.jpg" id="logodv">
    </div>

<div id="logo"></div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceCenter" runat="server">

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceFooter" runat="server" >
       <div align="center" style='background-color:cornflowerblue'><b>Volver a Grabar los Digitos Verificadores: </b> 
        <br />
        <br />
        <asp:label ID="registros" runat="server" text=""></asp:label>
        <asp:Panel ID="Panelgeneral" runat="server">
        <br/>
        <br/>
        <asp:Button ID="btnGrabar" runat="server" Text="Grabar Digitos Verificadores" OnClick="btnGrabar_Click" />
        <br />
        <br />
        </asp:Panel>
           <br />
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
