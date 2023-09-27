<%@ Page Language="C#" MasterPageFile="~/M1.Master" AutoEventWireup="true" CodeBehind="Registro.aspx.cs" Inherits="FarmaUAICenter.Account.Registro" %>
<%@ MasterType VirtualPath="~/M1.Master" %> 
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceTop" runat="server">
    <div class="col-md-12">
    <div class="col-md-3" id="sec-logo">
        <img src="../img/Logo.jpg" id="logo">
    </div>
    <div class="col-md-9" id="sec-botones">
            
     </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceCenter" runat="server">
    
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceFooter" runat="server">
    <div class="col-md-12 formulariocontent">
        <div class="col-md-4">
        </div>
        <div class="col-md-4 formulario" style="color: white;background-color:steelblue;">
            <h1 style="color: white;">Datos de Registro</h1><br/>
            <b>Ingrese su Usuario pretendido:</b>           
            <asp:TextBox ID="txt_usuario" runat="server"></asp:TextBox>
            <b>Ingrese contraseña:</b>

            <br/>
            <asp:TextBox ID="txt_contraseña" runat="server"></asp:TextBox>
            <b>Repetir contraseña:</b> <br/>
            <asp:TextBox ID="txt_contraseña2" runat="server"></asp:TextBox>
            <b>Ingrese su Nombre:</b>
            <br/>
            <asp:TextBox ID="txt_nombre" runat="server"></asp:TextBox>
            <b>Ingrese su Apellido:</b> <br/>
            <asp:TextBox ID="txt_apellido" runat="server"></asp:TextBox>
            <b>Ingrese su Direccion:</b> <br/>
            <asp:TextBox ID="txt_direccion" runat="server"></asp:TextBox>
            <b>Ingrese su e-mail:</b> <br/>
            <asp:TextBox ID="txt_mail" runat="server"></asp:TextBox>
            <b>Ingrese su Telefono:</b>
            <br/>
            <asp:TextBox ID="txt_telefono" runat="server"></asp:TextBox>
            <b>Ingrese palaba de restitucion de contraseña:</b>
            <br/>
            <asp:TextBox ID="txt_palabrarestitucion" runat="server"></asp:TextBox>
            <br />
                <div class="col-md-6">
                    <asp:Button ID="enviar" runat="server" Text="Enviar" Height="24px" Width="113px" ForeColor="#009933"/><br />
                </div>
                <div class="col-md-6">
                    <asp:Button ID="cancelar" runat="server" Text="Cancelar" Height="24px" Width="113px" ForeColor="#ff0000"/><br />
                </div>
        </div>
        <div class="col-md-4">
        </div>
    </div>
<script type="text/javascript">
    function pass() {
        if (pass1.value != pass2.value) {
            pass1.style.background = "#ff0000";
            pass2.style.background = "#ff0000";
            pass1.value = "";
            pass2.value = "";
            pass1.focus();
            alert("son distintas");
            return 0;
        } else {
            pass1.style.background = "#ffffff";
            pass2.style.background = "#ffffff";
        }
    }
</script>

        <div class="col-md-12" style="display: flex; justify-content: center;">
        <br/>
        <a href="../../Default.aspx">
            Volver
            <br/>
            <img src="../../img/Back.png"   width="52px" height="52px"/>
        </a>
    </div>
</asp:Content>