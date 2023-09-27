<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/M1.Master" CodeBehind="BackupRestore.aspx.cs" Inherits="FarmaUAICenter.Menus.Administrador.BackupRestore" %>
<%@ MasterType VirtualPath="~/M1.Master" %> 

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceTop" runat="server">

    <div class="col-md-12">
    <div class="col-md-3" id="sec-logo">
        <img src="../../img/Logo.jpg" alt="logobkp" />
    </div>

   </div>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceFooter" runat="server" BackColor="#6495ED">
    <div align="center" style="background-color:steelblue;">    

<table width="90%">
<tr><td>
    <h1  style="text-align:center;color: white;background-color:steelblue;" dir="ltr">Backup & Restore</h1> 
           
        </td>
        </tr>
        </table>       
    </div>
      
  <div align="center" style="background-color:steelblue;">
        <br /><br />
        <asp:Button ID="BackUp" Text="Realizar BackUp" runat="server" OnClick="BackUp_Click" />
        <br />
        <br />
        ------------------------------
        <br />
        <br />
        Seleccione el archivo .bak
        <br />
        <br />
        <asp:FileUpload ID="FileUpload1" runat="server" />
        <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
        <br />
        <br />
        <asp:Button ID="Restore" Text="Realizar Restore" runat="server" OnClick="Restore_Click1" />
         <br />
        <br />
    <div/>
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

