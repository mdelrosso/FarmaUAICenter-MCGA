<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/M1.Master"  CodeBehind="Promos.aspx.cs" Inherits="FarmaUAICenter.Menus.Visitante.Promos" %>
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
    <div class="col-md-10" style="color: white;background-color:steelblue;">
        <h1 style="text-align:center">Promos</h1>     
        <br />
        <div class="col-md-12" align="center">
            <asp:Panel ID="PanelGeneral" runat="server" Height="196px">
            <br />
                <asp:GridView ID="GridView1" runat="server" CellPadding="4" ForeColor="#333333" 
                    GridLines="None" Height="131px" Width="70%" BorderColor="Black" 
                    BorderStyle="Solid" BorderWidth="3px">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <EditRowStyle BackColor="#999999" BorderColor="Black" BorderStyle="Solid" />
                    <FooterStyle BackColor="#158ABD" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#158ABD" Font-Bold="True" ForeColor="White" />
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
            </asp:Panel>
        </div>
        <br />

    </div>
    <div class="col-md-1">
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
