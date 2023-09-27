using System;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using FarmaUAICenter.MessageBox.Codigo;
using FarmaUAICenter.Vistas;

namespace FarmaUAICenter.Account
{
    public partial class Login : Page
    {
        private LoginVista _loginVista;
        public BE.Usuario BeUsuario;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            IniciarSesion();
        }

        private void IniciarSesion()
        {
            _loginVista = new LoginVista();

            BeUsuario = _loginVista.Login(txtUsuario.Text, txtPassword.Text);

            if (BeUsuario != null)
            {
                var cookieUsuario = Response.Cookies["usuario"];

                if (cookieUsuario != null)
                {
                    cookieUsuario["nombreUsuario"] = BeUsuario.NombreUsuario;
                    cookieUsuario["password"] = BeUsuario.Password;
                    cookieUsuario["id"] = BeUsuario.IdUsuario.ToString();
                }

                Response.Redirect("~/Default.aspx");
            }
            else
            {
                //ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + ex.Message + "');", true);
                //Interaction.MsgBox("Usuario o contraseña incorrectos", Constants.vbCritical);
                //  
                Mensaje.Mostrar("Inicio de sesión", "Usuario o contraseña incorrectos", "OkClick", MessageBox.Codigo.MessageBox.MessageBoxIcons.Error, MessageBox.Codigo.MessageBox.MessageBoxButtons.Ok, MessageBox.Codigo.MessageBox.MessageBoxStyle.StyleA, this.Master.LiteralMensajes, this);

            }
            // Response.Redirect("~/Default.aspx");

        }

        [WebMethod]
        private static void OkClick(object sender, EventArgs e)
        {
            //return "";
            HttpContext.Current.Response.Redirect("Login.aspx");

        }
    }
}