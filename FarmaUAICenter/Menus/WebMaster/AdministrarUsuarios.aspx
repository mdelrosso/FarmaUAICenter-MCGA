<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/M1.Master"  CodeBehind="AdministrarUsuarios.aspx.cs" Inherits="FarmaUAICenter.Menus.Administrador.AdministrarUsuarios" %>
<%@ MasterType VirtualPath="~/M1.Master" %> 
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server" BackColor="#6495ED">
    <style type="text/css">
        #textboxreg {
            width: 97%;
        }
        .auto-style1 {
            width: 200px;
        }
        
        .auto-style2 {
            width: 200px;
            height: 33px;
        }
        .auto-style3 {
            height: 33px;
        }
        
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceTop" runat="server" BackColor="#6495ED">
<div class="col-md-12">
    <div class="col-md-3" id="sec-logo">
        <img src="../../img/Logo.jpg" id="logo">
    </div>
    <div class="col-md-9" id="sec-botones">
    </div>
   </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceCenter" runat="server" BackColor="#6495ED">
    
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceFooter" runat="server" BackColor="#6495ED">
     <br />
    <div class="col-md-1">
    </div>
    <div  style='background-color:steelblue;'>
            
        <br />
        <div class="col-md-12" align="center" style='background-color:steelblue;'>
        <asp:Label ID="Label11" runat="server" Text=""></asp:Label>
        <br />
        <asp:Panel ID="PanelGeneral" runat="server" BackColor="#6495ED">
            <h1 style="text-align:center;color: white;">Usuarios</h1> 
        <asp:Panel ID="PanelGridview" runat="server" BackColor="#6495ED">
        <asp:GridView ID="GridView1" runat="server" CellPadding="4" ForeColor="#333333" 
            GridLines="None" Height="131px" Width="357px"  border="1" BorderColor="Black">
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
        </asp:Panel>
        <br/><br/>
        <asp:Button ID="AltaUsuario" runat="server" Text="Alta Usuario" Height="30px" 
                Width="200px" BackColor="Blue" Font-Bold="True" ForeColor="White" />
        <asp:Button ID="ModificarUsuario" runat="server" Text="Modificar Usuario" Height="30px" 
                Width="200px" BackColor="Blue" Font-Bold="True" ForeColor="White" />
        <asp:Panel ID="PanelAltaUsuario" runat="server" Height="500px">
        <br /> 
<table width="45%">
    <caption>
        <h1 style="text-align:center;color: white;">Registrar Usuario</h1>
    </caption>
</table> 
        <br />
        <table border="1" bordercolor="black" width="45%">
            <tr>
                <td style="background-color:#007ACC; color:#FFFFFF" class="auto-style1">Nombre de Usuario</td>
                <td align="left">
                    <asp:TextBox ID="txt_usuario" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="background-color:#007ACC; color:#FFFFFF" class="auto-style1">Ingrese Contraseña</td>
                <td align="left">
                    <asp:TextBox ID="txt_contraseña" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="background-color:#007ACC; color:#FFFFFF" class="auto-style1">Repetir Contraseña</td>
                <td align="left">
                    <asp:TextBox ID="txt_contraseña2" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="background-color:#007ACC; color:#FFFFFF" class="auto-style1">Nombre</td>
                <td align="left">
                    <asp:TextBox ID="txt_nombre" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="background-color:#007ACC; color:#FFFFFF" class="auto-style1">Apellido</td>
                <td align="left">
                    <asp:TextBox ID="txt_apellido" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="background-color:#007ACC; color:#FFFFFF" class="auto-style2">Direccion</td>
                <td align="left" class="auto-style3">
                    <asp:TextBox ID="txt_direccion" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="background-color:#007ACC; color:#FFFFFF" class="auto-style1">E-mail</td>
                <td align="left">
                    <asp:TextBox ID="txt_mail" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="background-color:#007ACC; color:#FFFFFF" class="auto-style1">Telefono</td>
                <td align="left">
                    <asp:TextBox ID="txt_telefono" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="background-color:#007ACC; color:#FFFFFF" class="auto-style1">Familia:</td>
                <td><asp:DropDownList ID="DropFamilia" runat="server" Height="30px" Width="100%">
                        <asp:ListItem>Cliente</asp:ListItem>
                        <asp:ListItem>Avanzado</asp:ListItem>
                        <asp:ListItem>Administrador</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td align="center" colspan="2">
                    <asp:Button ID="Button1" runat="server" Text="Enviar" width="80%" BackColor="Blue" Font-Bold="True" ForeColor="White"/>
                </td>
            </tr>
        </table>        
        </asp:Panel>

        <asp:Panel ID="PanelModificarUsuario" runat="server" Height="600px" BackColor="#6495ED">   
        <br />
<table width="45%">
    <caption>
        <h1 style="text-align:center;color: white;">Modificar Usuario</h1>
    </caption>
</table> 
               <table>
                <tr>
                    <td style="font-weight:bold">Ingrese ID Usuario</td>
                    <td><asp:TextBox ID="ID_Usuario" runat="server"></asp:TextBox></td>
                    <td><asp:ImageButton ID="ImageButton1" runat="server" src="https://cdn1.iconfinder.com/data/icons/meBaze-Freebies/256/search.png" Width="20px" Height="20px"/></td>
                </tr>
            </table>

        <asp:Panel ID="PanelTabla" runat="server" Height="401px">
        <br />
            <b>Modifique los datos deseados y luego oprima &quot;Modificar&quot; </b>
        <br />
        <table border="1" bordercolor="black">
        <tr>
            <td style="background-color:#007ACC; color:#FFFFFF" class="auto-style1"><asp:Label ID="Label1" runat="server" Text="ID_Usuario"></asp:Label></td>
            <td><asp:TextBox ID="TextBox1" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
            <td style="background-color:#007ACC; color:#FFFFFF" class="auto-style1"><asp:Label ID="Label2" runat="server" Text="Usuario"></asp:Label></td>
            <td><asp:TextBox ID="TextBox2" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
            <td style="background-color:#007ACC; color:#FFFFFF" class="auto-style1"><asp:Label ID="Label3" runat="server" Text="Contraseña"></asp:Label></td>
            <td><asp:TextBox ID="TextBox3" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
            <td style="background-color:#007ACC; color:#FFFFFF" class="auto-style1"><asp:Label ID="Label4" runat="server" Text="Nombre"></asp:Label></td>
            <td><asp:TextBox ID="TextBox4" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
            <td style="background-color:#007ACC; color:#FFFFFF" class="auto-style1"><asp:Label ID="Label5" runat="server" Text="Apellido"></asp:Label></td>
            <td><asp:TextBox ID="TextBox5" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
            <td style="background-color:#007ACC; color:#FFFFFF" class="auto-style1"><asp:Label ID="Label6" runat="server" Text="Direccion"></asp:Label></td>
            <td><asp:TextBox ID="TextBox6" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
            <td style="background-color:#007ACC; color:#FFFFFF" class="auto-style1"><asp:Label ID="Label7" runat="server" Text="E-mail"></asp:Label></td>
            <td><asp:TextBox ID="TextBox7" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
            <td style="background-color:#007ACC; color:#FFFFFF" class="auto-style1"><asp:Label ID="Label8" runat="server" Text="Telefono"></asp:Label></td>
            <td><asp:TextBox ID="TextBox8" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
            <td style="background-color:#007ACC; color:#FFFFFF" class="auto-style1"><asp:Label ID="Label9" runat="server" Text="Activo"></asp:Label></td>
            <td><asp:CheckBox ID="CheckBox1" runat="server" /></td>
        </tr>
        <tr>
            <td style="background-color:#007ACC; color:#FFFFFF" class="auto-style1"><asp:Label ID="Label10" runat="server" Text="DVH"></asp:Label></td>
            <td><asp:TextBox ID="TextBox10" runat="server"></asp:TextBox></td>
        </tr>
        <tr align="center">
            <td colspan="2"><asp:Button ID="Modificar" runat="server" Text="Modificar" 
                    Height="36px" Width="207px" BackColor="Blue" ForeColor="White" /></td>
        </tr>
        </table>
        </asp:Panel>            
        </asp:Panel>
        </asp:Panel>
        </div>
        <br /><br />
            <center><a href="../../Default.aspx">
            Volver
            <br/>
            <img src="../../img/Back.png"   width="52px" height="52px"/>
        </a></center>
    </div>
    <div class="col-md-1">
    </div>  
</asp:Content>

