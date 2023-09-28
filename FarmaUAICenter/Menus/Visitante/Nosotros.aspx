<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/M1.Master"  CodeBehind="Nosotros.aspx.cs" Inherits="FarmaUAICenter.Menus.Visitante.Institucional" %>
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

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceCenter" runat="server">
      
    <div class="col-md-12 menu">
        <asp:PlaceHolder ID="PlaceHolder1" runat="server"></asp:PlaceHolder>
    </div>

</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceFooter" runat="server">
   
    <div class="col-md-12">
        <div class="col-md-12">
            <p></p>
            <h1 style="text-align:center"><b>¿Quienes somos?</b></h1>
            <p></p>
            <p>En FarmaUAICenter trabajamos con excelencia y responsabilidad para brindar cada día servicios farmacéuticos de máxima calidad 

            a más de diez millones de personas.</p>

            <p>Desde nuestra fundación, en 1997, trajimos a la Argentina las mejores prácticas del mundo en el servicio a pacientes y consumidores 

            en temas de salud. Centrados en superar sus expectativas, ofrecemos atención personalizada en nuestras farmacias, mediante experimentados 

            Directores Técnicos Farmacéuticos y sus respectivos equipos, integrados por los mejores talentos de la especialidad. 

            Nuestro compromiso es responder a las necesidades de los argentinos basándonos en valores y aptitudes que inspiran confianza. Por ello, 

            contamos con un Consejo Médico Asesor e implementamos pautas de máxima calidad en el manejo, distribución y preservación de la amplia 

            gama de medicamentos de marca y sus genéricos, tanto prescriptivos como de venta libre. Además, trabajamos con más de 60 Obras Sociales, 

            Prepagas y Coseguros de prestigio.</p>

            <p>En FarmaUAICenter empleamos a más de 4.500 personas en todo el país. Con 190 farmacias distribuidas en 13 provincias, es actualmente la 

            principal empresa de venta minorista de medicamentos y la que nuclea al mayor número de profesionales farmacéuticos. Farmacias Curarte es una 

            compañía comprometida con la calidad y la excelencia del servicio al cliente. Lleva invertidos en Argentina más de 400 millones de pesos 

            desde su fundación hace ya más de 15 años.</p>

            <p>Nuestra compañía está fuertemente involucrada con el desarrollo del sector y de la comunidad, llevando adelante proyectos de 

            responsabilidad social con reconocidas instituciones nacionales e internacionales.</p>

        </div>
    </div>

</asp:Content>