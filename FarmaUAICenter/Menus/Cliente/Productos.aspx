<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/M1.Master"  CodeBehind="Productos.aspx.cs" Inherits="FarmaUAICenter.Menus.Cliente.Productos" %>
<%@ MasterType VirtualPath="~/M1.Master" %> 
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 128px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceTop" runat="server">
    <img src="../../img/Logo.jpg" id="logo1">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceFooter" runat="server">
    <table width="100%" style="color: white;background-color:steelblue;text-align:center">
<tr><td><p style="border: 2px solid #292C7B; font-family: verdana; font-size: 30px; font-weight: bold; font-style: italic; color: #292C7B; background-color: #FFFFFF;">
Productos</p> 
</td></tr>
</table> 
        <asp:Panel ID="PanelGeneral" runat="server" Height="236px" style="color: white;background-color:steelblue;text-align:center">

        
            <asp:GridView ID="GridView1" runat="server" CellPadding="4" ForeColor="#333333" 
                GridLines="None" Height="131px" Width="357px">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <EditRowStyle BackColor="#999999" />
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#E9E7E2" />
                <SortedAscendingHeaderStyle BackColor="#506C8C" />
                <SortedDescendingCellStyle BackColor="#FFFDF8" />
                <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
            </asp:GridView>
        <br />
        <br />
<asp:Panel ID="PanelCarrito" runat="server" Font-Bold="True" style="color: white;background-color:steelblue;text-align:center">
<table width="100%">
    <tr>
     <td><p style="border: 2px solid #FF4848; font-family: verdana; font-size: 30px; font-weight: bold; font-style: italic; color: #FF4848; background-color: #FFFFFF">Carrito de Compras</p></td>
    </tr>
</table>   
<br/>
    <table style="border-color: #FF4848; border-style: solid;">
        <tr>
            <td>Ingrese Producto:</td>
            <td class="auto-style1"><asp:TextBox ID="TextProducto" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
            <td>Ingrese Cantidad:</td>
            <td class="auto-style1"><asp:TextBox ID="TextCantidad" runat="server"></asp:TextBox></td>
        </tr>
    </table>
            <br />
            <asp:Button ID="AgregarAlCarrito" runat="server" Text="Agregar al carrito" OnClick="AgregarAlCarrito_Click" BackColor="Blue" />
            <br /><br />
                    <asp:Label ID="Label2" runat="server" 
        Text="Monto Total: $ 0,00" Font-Bold="True" Visible="False"></asp:Label>
            <br /><br />
            <asp:GridView ID="GridView2" runat="server" CellPadding="4" ForeColor="#333333" 
                GridLines="None" Height="131px" Width="357px" style="margin-top: 0px">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <EditRowStyle BackColor="#999999" />
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#E9E7E2" />
                <SortedAscendingHeaderStyle BackColor="#506C8C" />
                <SortedDescendingCellStyle BackColor="#FFFDF8" />
                <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
            </asp:GridView>

            <asp:Button ID="FinalizarCompra" runat="server" Text="Finalizar Compra!" Width="217px" BackColor="Blue" />
    <br />       
    
</asp:Panel>
</asp:Panel>
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
        <div class="col-md-12" style="display: flex; justify-content: center;">
        <br/>
        <a href="../../Default.aspx">
            Volver
            <br/>
            <img src="../../img/Back.png"   width="52px" height="52px"/>
        </a>
    </div>
</asp:Content>
