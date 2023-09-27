using System;
using System.Net;
using System.Net.Mail;

namespace FarmaUAICenter.Account
{
    public partial class RestitucionContraseña : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void enviar_Click(object sender, EventArgs e)
        {
            BE.Usuario usuario = new BE.Usuario();
            BLL.Usuario gestorusuario = new BLL.Usuario();
            string body = "";
            string correo = "";


            try
            {
                usuario = gestorusuario.ObtenerUsuarioPorNombreUsuario(user.Text);
                if (usuario.PalabraRestitucion == PalabraRestitucion.Text & usuario != null)
                {
                    correo = usuario.Email.ToString();
                    body = "Su password es: " + usuario.Password.ToString();
                    EnviarCorreo(body, correo);
                }
                else
                {
                    Errorpalabraclave.Text = "Error, Contacte con el Administrador";
                }
            }
            catch (Exception)
            {

                throw;
            }






        }



        private void EnviarCorreo(string body1, string correo1)
        {
            string body = body1;
            string correo = correo1;

            try
            {
                var client = new SmtpClient("smtp.mailtrap.io", 2525)
                {
                    Credentials = new NetworkCredential("3286e0854f68fb", "cef1650de24e29"),
                    EnableSsl = true
                };
                client.Send("soporte@tiendamoda.com", correo.ToString(), "Recuperar Password", body.ToString());

            }
            catch (Exception)
            {

                throw;
            }


        }
    }
}