using BLL.Seguridad.DigitoVerificador;
using BLL.Seguridad.Sesion;
using System;

namespace FarmaUAICenter.Menus.Administrador
{
    public partial class DigitosVerificadores : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //CONTROLO QUE SEA LA FAMILIA QUE CORRESPONDE
            try
            {
                switch (Cookie.ComprobarCookies(Request.Cookies["usuario"]["familia"], "Administrador"))
                {
                    case "":
                        //SI ES, CARGO TODOS LOS CONTROLES
                        ComprobarDigitos();
                        Panelgeneral.Visible = true;
                        break;
                    case "No posee permiso":
                        registros.Text = "No posee permiso";
                        Panelgeneral.Visible = false;
                        break;
                    case "No hay sesión activa":
                        registros.Text = "No hay sesión activa";
                        Panelgeneral.Visible = false;
                        break;
                }
            }
            catch (Exception ex)
            {
                registros.Text = "No hay sesión activa";
                Panelgeneral.Visible = false;
            }
        }

        public void btnGrabar_Click(object sender, EventArgs e)
        {
            if (DigitoVerificador.GrabarDvhDeTodalaBase() == true)
            {
                registros.Text = "¡Se generaron nuevamente los digitos verificadores!";
            }
            else
            {
                registros.Text = "¡Hubo un problema al grabar nuevamente los digitos verificadores!";
            }
        }

        public void ComprobarDigitos()
        {
            ResultadoValidacionBaseDeDatos resultado = new ResultadoValidacionBaseDeDatos();

            resultado = DigitoVerificador.ValidarBasedeDatos();

            if (resultado.EsValida == false)
            {
                foreach (string registro in resultado.RegistrosCorruptos)
                {
                    registros.Text += registro + @" <br/>";
                }

                btnGrabar.Visible = true;
            }
        }
    }
}