<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/M1.Master"  CodeBehind="AdministrarPromos.aspx.cs" Inherits="FarmaUAICenter.Menus.Avanzado.AdministrarPromos" %>
<%@ MasterType VirtualPath="~/M1.Master" %> 
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style2 {
            width: 203px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceTop" runat="server">
      <img src="../../img/Logo.jpg" id="logo1">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceFooter" runat="server" style="color: white;background-color:steelblue;">
    <div align="center" style="color: white;background-color:steelblue;">   
        <table width="97%">
<tr><td><p style="border: 2px solid #292C7B; font-family: verdana; font-size: 30px; font-weight: bold; font-style: italic; color: #292C7B; background-color: #FFFFFF;">
Administrar Promociones</p> 
</td></tr>
</table> 
       <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
        <br />
        <table>
            <tr>
                <td><asp:Button ID="AltaPromo" runat="server" Text="Alta Promo" Height="30px" Width="160px" BackColor="Blue" /></td>
                <td><asp:Button ID="BajaPromo" runat="server" Text="Baja Promo" Height="30px" Width="160px" BackColor="Blue" /></td>
                <td><asp:Button ID="ModificaPromo" runat="server" Text="Modifica Promo" Height="30px" Width="160px" BackColor="Blue" /></td>
            </tr>
        </table>
        <asp:Panel ID="Panelgeneral" runat="server" style="color: white;background-color:steelblue;">
        <asp:Panel ID="PanelAltaPromo" runat="server" Height="258px" style="color: white;background-color:steelblue;">
            <br />
<table width="45%">
<tr><td><p style="border: 2px solid #292C7B; font-family: verdana; font-size: 30px; font-weight: bold; font-style: italic; color: #292C7B; background-color: #FFFFFF;">
Alta Promo</p> 
</td></tr>
</table> 
    <table border="1" width="45%">
    <tr>
    <td style="background-color:#007ACC; color:#FFFFFF" class="auto-style2">Nombre de la Promoción</td>
    <td align="left"><asp:TextBox ID="NomPromo" runat="server" Width="159px" BackColor="Blue"></asp:TextBox></td>
    </tr>
    <tr>
    <td style="background-color:#007ACC; color:#FFFFFF" class="auto-style2">Producto</td>
    <td align="left"><asp:TextBox ID="NomProd" runat="server" Width="159px" BackColor="Blue"></asp:TextBox></td>
    </tr>
    <tr>
    <td style="background-color:#007ACC; color:#FFFFFF" class="auto-style2">Descripcion</td>
    <td align="left"><asp:TextBox ID="DescPromo" runat="server" Width="159px" BackColor="Blue"></asp:TextBox></td>
    </tr>
    <tr>
    <td style="background-color:#007ACC; color:#FFFFFF" class="auto-style2">Precio</td>
    <td align="left"><asp:TextBox ID="PrecPromo" runat="server" Width="159px" BackColor="Blue"></asp:TextBox></td>
    </tr>              
    <tr>
    <td align="center" colspan="2">
        <asp:Button ID="Button1" runat="server" Height="30px" Text="Agregar Promo" Width="239px" OnClick="Button1_Click"  BackColor="Blue" />
    <asp:Button ID="BAltaPromo" runat="server" Text="Generar XML " Width="239px" 
    Height="30px" OnClick="BAltaPromo_Click1"  BackColor="Blue" />
    </td>
    </tr>
    </table>
        <br />

        </asp:Panel>

        <asp:Panel ID="PanelModificarPromo" runat="server" Height="315px" style="margin-top: 49px">   
        <br/>
<table width="45%">
<tr><td><p style="border: 2px solid #292C7B; font-family: verdana; font-size: 30px; font-weight: bold; font-style: italic; color: #292C7B; background-color: #FFFFFF;">
Modificar Promo</p> 
</td></tr>
</table> 
         <br /> 
            <table>
                <tr>
                    <td style="font-weight:bold">Ingrese ID de la Promo</td>
                    <td><asp:TextBox ID="MIDPromo" runat="server" Width="103px" BackColor="Blue"></asp:TextBox></td>
                    <td><asp:ImageButton ID="ImageButton1" runat="server" src="https://cdn1.iconfinder.com/data/icons/meBaze-Freebies/256/search.png" Width="20px" Height="20px"/></td>
                </tr>
            </table>
         
         
         
         <br />
        <table border="1">
                <tr>
                    <td style="background-color:#007ACC; color:#FFFFFF" class="auto-style2">Nombre:</td>
                    <td align="left"><asp:TextBox ID="MNomPromo" runat="server" Width="159px" BackColor="Blue"></asp:TextBox></td>
                </tr>
                <tr>
                    <td style="background-color:#007ACC; color:#FFFFFF" class="auto-style2">Producto</td>
                    <td align="left"><asp:TextBox ID="MNomProd" runat="server" Width="159px" BackColor="Blue"></asp:TextBox></td>
                </tr>
                <tr>
                    <td style="background-color:#007ACC; color:#FFFFFF" class="auto-style2">Descripcion</td>
                    <td align="left"><asp:TextBox ID="MDescPromo" runat="server" Width="159px" BackColor="Blue"></asp:TextBox></td>
                </tr>
                <tr>
                    <td style="background-color:#007ACC; color:#FFFFFF" class="auto-style2">Precio</td>
                    <td align="left"><asp:TextBox ID="MPrecPromo" runat="server" Width="159px" BackColor="Blue"></asp:TextBox></td>
                </tr>
                <tr>
                    <td align="center" colspan="2">
                        <asp:Button ID="BModificarPromo" runat="server" Text="Modificar Promo" 
                            Width="353px" Height="30px" BackColor="Blue" />
                    </td>
                </tr>
            </table>
         <br />
            
        </asp:Panel>

        <asp:Panel ID="PanelBajaPromo" runat="server" Height="159px" 
                style="margin-top: 15px">   
        <br/>
<table width="45%">
<tr><td><p style="border: 2px solid #292C7B; font-family: verdana; font-size: 30px; font-weight: bold; font-style: italic; color: #292C7B; background-color: #FFFFFF;">
Baja Promo</p> 
</td></tr>
</table> 
        <table border="1" width="45%">
        <tr>
            <td style="background-color:#007ACC; color:#FFFFFF" class="auto-style2"><asp:Label ID="LBLIDPromo" runat="server" Text="Ingrese ID Promo:"></asp:Label></td>
            <td><asp:TextBox ID="IDPromo" runat="server" Width="230px" BackColor="Blue"></asp:TextBox></td>
        </tr>
       
        <tr align="center" >
            <td colspan="2">
                <asp:Button ID="BBajaPromo" runat="server" Text="Baja Promo" 
                    Width="355px" Height="30px" BackColor="Blue" /></td>
        </tr>
        </table>
        <br/><br/>
        </asp:Panel>
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

