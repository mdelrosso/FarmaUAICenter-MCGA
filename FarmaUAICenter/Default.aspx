<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/M1.Master" CodeBehind="Default.aspx.cs" Inherits="FarmaUAICenter.Default" %>
<%@ MasterType VirtualPath="~/M1.Master" %> 

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceTop" runat="server">
    
    <div class="col-md-12">
    <div class="col-md-2" id="sec-logo">
        <img src="img/Logo.png" id="logo">
    </div>
        <div class="col-md-3" >
            <h3 style="font-weight:bold;margin-bottom:2px">FARMA UAI CENTER</h3>
            <b>Todo en un solo lugar</b>
        </div>
    <div class="col-md-6" id="sec-botones">
        <asp:Button ID="b1" runat="server" Text="" OnClick="b1_Click" CssClass="btn btn-primary"/>         
        <asp:Button ID="b2" runat="server" Text="" OnClick="b2_Click" CssClass="btn btn-warning"/>  
     </div>
   </div>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceCenter" runat="server">
      
    <div class="col-md-12 menu">
        <asp:PlaceHolder ID="PlaceHolder1" runat="server"></asp:PlaceHolder>
    </div>

    

</asp:Content>


<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceFooter" runat="server">

    <div class="col-md-12" style="text-align:center">
        <img src="img/Institucional.png">
    </div>

</asp:Content>