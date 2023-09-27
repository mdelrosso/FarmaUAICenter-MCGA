<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/M1.Master"  CodeBehind="MisCompras.aspx.cs" Inherits="FarmaUAICenter.Menus.Cliente.MisCompras" %>
<%@ MasterType VirtualPath="~/M1.Master" %> 

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceTop" runat="server">
    <img src="../../img/Logo.jpg" id="logo1">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceFooter" runat="server">
    <table width="100%" style="color: white;background-color:steelblue;text-align:center">
<tr><td><p style="border: 2px solid #292C7B; font-family: verdana; font-size: 30px; font-weight: bold; font-style: italic; color: #292C7B; background-color: #FFFFFF;">
Mis Compras</p> 
</td></tr>
</table> <div style="color: white;background-color:steelblue;text-align:center">              
        <br />
              <asp:GridView ID="GridView1" runat="server" CellPadding="4" ForeColor="#333333" 
                GridLines="None" Height="131px" Width="70%" BorderColor="Black" 
                BorderStyle="Solid" BorderWidth="3px">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <EditRowStyle BackColor="#999999" BorderColor="Black" BorderStyle="Solid" />
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" 
                      BorderColor="Black" BorderStyle="Solid" BorderWidth="3px" />
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" BorderColor="Black" 
                      BorderStyle="Solid" BorderWidth="3px" />
                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" 
                      BorderColor="Black" BorderStyle="Solid" BorderWidth="3px" />
                <SortedAscendingCellStyle BackColor="#E9E7E2" />
                <SortedAscendingHeaderStyle BackColor="#506C8C" />
                <SortedDescendingCellStyle BackColor="#FFFDF8" />
                <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
            </asp:GridView>
        <br />
        <table>
            </table>
<br />
    </div>
<table width="70%">
    <div class="col-md-12" style="display: flex; justify-content: center;">
        <br/>
        <a href="../../Default.aspx">
            Volver
            <br/>
            <img src="../../img/Back.png"   width="52px" height="52px"/>
        </a>
    </div>

</asp:Content>

