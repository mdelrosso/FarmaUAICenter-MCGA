<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/M1.Master"  CodeBehind="Bitacora.aspx.cs" Inherits="FarmaUAICenter.Menus.Administrador.Bitacora" %>
<%@ MasterType VirtualPath="~/M1.Master" %> 
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceTop" runat="server">
         <div class="col-md-3" id="sec-logo">
        <img src="../../img/Logo.jpg" id="logobitacora">
    </div>
    <div id="logo" align="center" style="font-size: xx-large; font-weight: bold; font-style: normal; font-variant: small-caps; text-transform: capitalize; color: #FFFFFF; ">
    BITACORA<br />   
    </div>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceCenter" runat="server">

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceFooter" runat="server">
        <div align="center">
<table border="0" cellspacing="0" cellpadding="1" style="width: 750px"> 



<tr> 
<td>
<table width="100%" border="0" cellspacing="0" cellpadding="4"> 
<tr><td align="center">
    <asp:Panel ID="Panel1" runat="server" Visible="True" BackColor="#6495ED">

        <br/>
        <div align="center" style="float:initial;">

        <div  style="float:left;width:50%">
       <asp:Label ID="lblFechaDesde" runat="server" Text="Fecha desde" Font-Bold="True" Font-Size="Medium" ForeColor="#0000CC"></asp:Label>
        <br/>
        <asp:TextBox ID="txtFechaDesde" runat="server" ></asp:TextBox>
        <asp:CalendarExtender ID="desdeCalendar" runat="server" Enabled="True"
                        TargetControlID="txtFechaDesde" Format="yyyy-MM-dd">
                    </asp:CalendarExtender>     
            </div>
        
        <div  style="float:right;width:50%" align="center">
               <asp:Label ID="lblFechaHasta" runat="server" Text="Fecha hasta" Font-Bold="True" Font-Size="Medium" ForeColor="#0000CC"></asp:Label>
            <br/>
            <asp:TextBox ID="txtFechaHasta" runat="server" ></asp:TextBox>
        <asp:CalendarExtender ID="hastaCalendar" runat="server" Enabled="True"
                        TargetControlID="txtFechaHasta" Format="yyyy-MM-dd">
                    </asp:CalendarExtender>
        </div>
      
        </div>
        <asp:Button ID="btnFiltrar" runat="server" Text="Filtrar" OnClick="btnFiltrar_Click" />
        <br/>
        <br/>

  <asp:DataGrid ID="grillaBitacora" runat="server" PageSize="10" AllowPaging="True" DataKeyField="ID_Evento"
AutoGenerateColumns="False" CellPadding="4" ForeColor="#FF0066" GridLines="None" OnPageIndexChanged="grillaBitacora_PageIndexChanged" >
<Columns>
<asp:BoundColumn HeaderText="Id Evento" DataField="ID_Evento" FooterStyle-HorizontalAlign="Center" FooterStyle-VerticalAlign="Middle" HeaderStyle-HorizontalAlign="Center" HeaderStyle-VerticalAlign="Middle" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle" FooterStyle-BorderColor="White" FooterStyle-BorderStyle="Double" ItemStyle-BorderColor="White" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="3" HeaderStyle-BorderColor="White" HeaderStyle-BorderStyle="Solid" HeaderStyle-BorderWidth="3">
    <FooterStyle BorderColor="White" BorderStyle="Double" HorizontalAlign="Center" VerticalAlign="Middle" />
    <HeaderStyle BorderColor="White" BorderStyle="Solid" BorderWidth="3px" HorizontalAlign="Center" VerticalAlign="Middle" />
    <ItemStyle BorderColor="White" BorderStyle="Solid" BorderWidth="3px" HorizontalAlign="Center" VerticalAlign="Middle" />
</asp:BoundColumn>
<asp:BoundColumn HeaderText="Descripción" DataField="Descripcion" HeaderStyle-HorizontalAlign="Center" HeaderStyle-VerticalAlign="Middle" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle" HeaderStyle-BorderColor="White" HeaderStyle-BorderStyle="Solid" HeaderStyle-BorderWidth="3" ItemStyle-BorderColor="White" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="3">
    <HeaderStyle BorderColor="White" BorderStyle="Solid" BorderWidth="3px" HorizontalAlign="Center" VerticalAlign="Middle" />
    <ItemStyle BorderColor="White" BorderStyle="Solid" BorderWidth="3px" HorizontalAlign="Center" VerticalAlign="Middle" />
</asp:BoundColumn>
<asp:BoundColumn HeaderText="Fecha" DataField="Fecha" ItemStyle-VerticalAlign="Middle" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" HeaderStyle-VerticalAlign="Middle" ItemStyle-BorderColor="White" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="3" HeaderStyle-BorderColor="White" HeaderStyle-BorderStyle="Solid" HeaderStyle-BorderWidth="3">
    <HeaderStyle BorderColor="White" BorderStyle="Solid" BorderWidth="3px" HorizontalAlign="Center" VerticalAlign="Middle" />
    <ItemStyle BorderColor="White" BorderStyle="Solid" BorderWidth="3px" HorizontalAlign="Center" VerticalAlign="Middle" />
</asp:BoundColumn>
</Columns>
<FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
<SelectedItemStyle BackColor="#CCCCFF" Font-Bold="True" ForeColor="Navy" />
<PagerStyle BackColor="#FFCCFF" ForeColor="#333333" HorizontalAlign="Center" Mode="NumericPages" />
<AlternatingItemStyle BackColor="#CCCCFF" />
<ItemStyle BackColor="#FFCCFF" ForeColor="#333333" />
<HeaderStyle BackColor="#CC99FF" Font-Bold="True" ForeColor="White" />
</asp:DataGrid>
        <br />
    </asp:Panel>
<asp:Label ID="Label2" runat="server" Text=""></asp:Label>
<asp:Label ID="Label1" runat="server" Text=""></asp:Label>
</td></tr>
</table>
</td>
</tr> 
</table>
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
