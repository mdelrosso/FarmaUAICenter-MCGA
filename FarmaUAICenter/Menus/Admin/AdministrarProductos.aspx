<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/M1.Master"  CodeBehind="AdministrarProductos.aspx.cs" Inherits="FarmaUAICenter.Menus.Avanzado.AdministrarProductos" %>
<%@ MasterType VirtualPath="~/M1.Master" %> 
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style2 {
            width: 216px;
        }
    .auto-style3 {
        margin-left: 181;
    }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceTop" runat="server">
    <img src="../../img/Logo.jpg" id="logo1">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceFooter" runat="server">
    <div align="center"  style="color: white;background-color:steelblue;">    
        <b>Admin Productos</b>
        <br />
        <asp:Label ID="LInfo" runat="server" Text=""></asp:Label>
        <br />
        <asp:Panel ID="PanelGeneral" runat="server" style="color: white;background-color:steelblue;">
        
        <asp:Button ID="AltaProd" runat="server" Text="Alta Producto" Height="30px" 
                Width="160px" BackColor="Blue" />
        <asp:Button ID="BajaProd" runat="server" Text="Baja Producto" Height="30px" 
                Width="160px" BackColor="Blue" />
        <asp:Button ID="ModificaProd" runat="server" Text="Modifica Producto" Height="30px" 
                Width="160px" BackColor="Blue" />

        <asp:Panel ID="PanelAltaProducto" runat="server" Height="253px" style="color: white;background-color:steelblue;">
            
            <br />
<table width="45%">
<tr><td><p style="border: 2px solid #292C7B; font-family: verdana; font-size: 30px; font-weight: bold; font-style: italic; color: #292C7B; background-color: #FFFFFF;">
Alta Producto</p> 
</td></tr>
</table> 
            <table border="1" width="45%">
                <tr>
                    <td style="background-color:#007ACC; color:#FFFFFF" class="auto-style2">Proveedor</td>
                    <td align="left">
                        <asp:DropDownList ID="DropProveedores" runat="server" Height="26px" 
                            Width="160px" BackColor="Blue">
                            <asp:ListItem>elegir un proveedor</asp:ListItem>
                            <asp:ListItem>Laboratorio Pister</asp:ListItem>
                            <asp:ListItem>Laboratorio Yester</asp:ListItem>
                            <asp:ListItem>Laboratorio Abas</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td style="background-color:#007ACC; color:#FFFFFF" class="auto-style2">Nombre</td>
                    <td align="left">
                        <asp:TextBox ID="NomProd" runat="server" Width="159px" BackColor="Blue"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td style="background-color:#007ACC; color:#FFFFFF" class="auto-style2">Descripcion</td>
                    <td align="left">
                        <asp:TextBox ID="DescProd" runat="server" Width="159px" BackColor="Blue"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td style="background-color:#007ACC; color:#FFFFFF" class="auto-style2">Precio:</td>
                    <td align="left">
                        <asp:TextBox ID="PrecProd" runat="server" Width="159px" BackColor="Blue"></asp:TextBox>
                    </td>
                </tr>              
                <tr>
                    <td align="center" colspan="2">
                        <asp:Button ID="Button1" runat="server" Text="Agregar Producto" Width="183px" 
                            Height="30px" OnClick="Button1_Click1" BackColor="Blue"/>
                        <asp:Button ID="BAltaProd0" runat="server" CssClass="auto-style3" Height="30px" Text="Crear XML " Width="183px" OnClick="BAltaProd0_Click" BackColor="Blue" />
                    </td>
                </tr>
            </table>
        <br />

        </asp:Panel>

        <asp:Panel ID="PanelModificarProducto" runat="server" Height="326px" style="color: white;background-color:steelblue;">   
        <br/>
<table width="45%">
<tr><td><p style="border: 2px solid #292C7B; font-family: verdana; font-size: 30px; font-weight: bold; font-style: italic; color: #292C7B; background-color: #FFFFFF;">
Modificar Producto</p> 
</td></tr>
</table> 
         <br /> 
         Ingrese ID del Producto:
                        <table>
                <tr>
                    <td style="font-weight:bold">Ingrese ID de la Promo</td>
                    <td><asp:TextBox ID="MIDProducto" runat="server" Width="103px" BackColor="Blue"></asp:TextBox></td>
                    <td><asp:ImageButton ID="ImageButton1" runat="server" src="https://cdn1.iconfinder.com/data/icons/meBaze-Freebies/256/search.png" Width="20px" Height="20px"/></td>
                </tr>
            </table>
         <br />
        <table border="1">
                <tr>
                    <td style="background-color:#007ACC; color:#FFFFFF" class="auto-style2">Proveedor</td>
                    <td align="left">
                        <asp:DropDownList ID="MDropDownProv" runat="server" Height="26px" Width="160px" BackColor="Blue">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td style="background-color:#007ACC; color:#FFFFFF" class="auto-style2">Producto</td>
                    <td align="left">
                        <asp:TextBox ID="MNomProd" runat="server" Width="159px" BackColor="Blue"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td style="background-color:#007ACC; color:#FFFFFF" class="auto-style2">Descripcion</td>
                    <td align="left">
                        <asp:TextBox ID="MDescProd" runat="server" Width="159px" BackColor="Blue"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td style="background-color:#007ACC; color:#FFFFFF" class="auto-style2">Precio</td>
                    <td align="left">
                        <asp:TextBox ID="MPrecProd" runat="server" Width="159px" BackColor="Blue"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td align="center" colspan="2">
                        <asp:Button ID="BModificarProd" runat="server" Text="Modificar Producto" 
                            Width="355px" Height="30px" BackColor="Blue" />
                    </td>
                </tr>
            </table>
         <br />
            
        </asp:Panel>

        <asp:Panel ID="PanelBajaProducto" runat="server" Height="111px" 
                style="margin-top: 16px;color: white;background-color:steelblue;">   
        <br/>
<table width="45%">
<tr><td><p style="border: 2px solid #292C7B; font-family: verdana; font-size: 30px; font-weight: bold; font-style: italic; color: #292C7B; background-color: #FFFFFF;">
Baja Producto</p> 
</td></tr>
</table> 
        <table border="1" width="45%">
        <tr>
            <td  style="background-color:#007ACC; color:#FFFFFF" class="auto-style2"><asp:Label ID="LBLIDProd" runat="server" Text="Ingrese ID Producto:"></asp:Label></td>
            <td><asp:TextBox ID="IDProd" runat="server" Width="222px" BackColor="Blue"></asp:TextBox></td>
        </tr>
       
        <tr align="center">
            <td colspan="2">
                <asp:Button ID="BBajaProducto" runat="server" Text="Baja Producto" 
                    Width="355px" Height="30px" BackColor="Blue" /></td>
        </tr>
        </table>
        <br/><br/>
        </asp:Panel>
        <br/><br/>
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
 


