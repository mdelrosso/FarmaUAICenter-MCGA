﻿<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/M1.Master"  CodeBehind="Productos.aspx.cs" Inherits="FarmaUAICenter.Menus.Visitante.Productos" %>
<%@ MasterType VirtualPath="~/M1.Master" %> 
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceTop" runat="server">
     <div class="col-md-12">
        <div class="col-md-2" id="sec-logo">
            <img src="../../img/Logo.png" id="logo">
        </div>
            <div class="col-md-3" >
                <h3 style="font-weight:bold;margin-bottom:2px">FARMA UAI CENTER</h3>
                <b>Todo en un solo lugar</b>
            </div>
        <div class="col-md-6" id="sec-botones">
            <asp:Button ID="b1" runat="server" Text="Volver al inicio" OnClick="Back_Click" CssClass="btn btn-secondary"/>
        </div>
    </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceFooter" runat="server">
    <p></p>
    <h4 style="font-weight:bold;text-align:center;font-style:italic;color:red">El listado de fármacos disponibles es publicado desde un archivo XML</h4>
    <hr style="border-color:black"/>
        <asp:Panel ID="PanelGeneral" runat="server" CssClass="custom-table">
              <asp:GridView ID="GridView1" runat="server" class="table table-bordered table-hover table-striped" OnRowDataBound="GridView1_RowDataBound">
                
            </asp:GridView>
        </asp:Panel>

</asp:Content>

