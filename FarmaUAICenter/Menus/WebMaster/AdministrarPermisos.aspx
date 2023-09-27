<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/M1.Master"  CodeBehind="AdministrarPermisos.aspx.cs" Inherits="FarmaUAICenter.Menus.Administrador.AdministrarPermisos" %>
<%@ MasterType VirtualPath="~/M1.Master" %> 
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceTop" runat="server">
<div class="col-md-12">
    <div class="col-md-3" id="sec-logo">
        <img src="../../img/Logo.jpg" id="logo">
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
    
        <div class="col-md-12" align="center">
    <asp:Panel ID="Panelgeneral" runat="server" BackColor="#6495ED">
        <h1  style="text-align:center;color: white;">Administrar Permisos</h1> 
        <table>     
            <tr><td>Ingrese ID Usuario:</td><td><asp:TextBox ID="ID_Usuario" runat="server"></asp:TextBox></td><td><asp:Button ID="Enviar" runat="server" Text="OK" /></td></tr>
        </table>
        <br />   
        <asp:Panel ID="Panel1" runat="server" Height="26px">
        <asp:DropDownList ID="DropDownList1" runat="server">
                <asp:ListItem>Cliente</asp:ListItem>
                <asp:ListItem>Avanzado</asp:ListItem>
                <asp:ListItem>Administrador</asp:ListItem>
        </asp:DropDownList> 
        </asp:Panel> 
        <asp:GridView ID="GridView1" runat="server" CellPadding="4" ForeColor="#333333" 
                GridLines="None" Height="131px" Width="357px" border="1" BorderColor="black">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <EditRowStyle BackColor="#999999" />
                <FooterStyle BackColor="#158ABD" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#158ABD" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#E9E7E2" />
                <SortedAscendingHeaderStyle BackColor="#506C8C" />
                <SortedDescendingCellStyle BackColor="#FFFDF8" />
                <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
            </asp:GridView>         
        <br />
        <asp:Button ID="Modificar" runat="server" Text="Modificar" width="150px"/>
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
    <div class="col-md-1">
    </div>
         
</asp:Content>
