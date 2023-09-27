<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/M1.Master" CodeBehind="Default.aspx.cs" Inherits="FarmaUAICenter.Default" %>
<%@ MasterType VirtualPath="~/M1.Master" %> 

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        #img_usuario {
            height: 33px;
            width: 39px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceTop" runat="server">

    <div class="col-md-12">
    <div class="col-md-3" id="sec-logo">
        <img src="./img/Logo.jpg" id="logo">
    </div>
    <div class="col-md-9" id="sec-botones">
        <img src="./img/Usuario.png" id="img_usuario" /> 
        <asp:Button ID="b1" runat="server" Text="" OnClick="b1_Click" BackColor="#999999" BorderStyle="Dotted" Height="35px" Width="46px" />         
        <asp:Button ID="b2" runat="server" Text="" OnClick="b2_Click" BackColor="#999999" BorderStyle="Dotted" Height="35px" Width="42px"/>  
     </div>
   </div>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceCenter" runat="server">
      
    <div class="col-md-12 menu">
        <asp:PlaceHolder ID="PlaceHolder1" runat="server"></asp:PlaceHolder>

      

    </div>

   
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceFooter" runat="server">

</asp:Content>