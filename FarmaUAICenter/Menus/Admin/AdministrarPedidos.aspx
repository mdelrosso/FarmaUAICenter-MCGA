<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/M1.Master"  CodeBehind="AdministrarPedidos.aspx.cs" Inherits="FarmaUAICenter.Menus.Avanzado.AdministrarPedidos" %>
<%@ MasterType VirtualPath="~/M1.Master" %> 
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            font-weight: bold;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceTop" runat="server">
    <img src="../../img/Logo.jpg" id="logo1">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceFooter" runat="server" style="color: white;background-color:steelblue;">
    <div align="center" style="color: white;background-color:steelblue;">    
        <span class="auto-style1">Pedidos</span><br />
        <br />
        <asp:Panel ID="PanelGeneral" runat="server">
        
            <asp:GridView ID="GridView2" runat="server">
            </asp:GridView>
        <br/><br/>
        </asp:Panel>

        </div>
       <div class="col-md-12" style="display: flex; justify-content: center;">
        <br/>
        <a href="../../Default.aspx">
            Volver
            <br/>
            <img src="../../img/Back.png"   width="52px" height="52px"/>
        </a>
    </div>    
</asp:Content>
 


