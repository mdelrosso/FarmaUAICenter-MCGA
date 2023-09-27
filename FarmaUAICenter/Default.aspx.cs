using BLL.Seguridad.DigitoVerificador;
using Helpers;
using System;
using System.Drawing;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using FarmaUAICenter.MessageBox.Codigo;
using FarmaUAICenter.Vistas;

namespace FarmaUAICenter
{
    public partial class Default : Page
    {
        private LoginVista _loginVista;
        private BE.Usuario _beUsuario;
        private bool _baseDeDatosValida;

        Button _button1;

        public Default()
        {
            Load += Page_Load;
        }

        protected void Page_Load(object sender, EventArgs e)
        {

            try
            {
                DarEstiloABotones();
                ConsultarSesion();
            }
            catch (Exception ex)
            {

            }
        }

        #region "Botones"

        public void DarEstiloABotones()
        {
            b1.Width = 136;
            b1.Height = 32;
            b2.Width = 136;
            b2.Height = 32;
        }

        public void InicializarBoton(string textoBoton)
        {
            _button1 = new Button()
            {
                Width = 200,
                Height = 32,
                Text = textoBoton,
                PostBackUrl = "Menus/Visitante/" + textoBoton + ".aspx"
            };
            Master.FindControl("ContentPlaceCenter").FindControl("PlaceHolder1").Controls.Add(_button1);
            _button1 = null;
        }

        public void CargarBotonesVisitante()
        {
            DarEstiloABotones();
            b1 = (Button)Master.FindControl("ContentPlaceTop").FindControl("b1");
            b1.Text = "Loguearse";
            b1.Visible = true;
            b2 = (Button)Master.FindControl("ContentPlaceTop").FindControl("b2");
            b2.Text = "Registrarse";
            b2.Visible = true;
            InicializarBoton("Sobre Nosotros");
            InicializarBoton("Productos");
            InicializarBoton("Promos");
            InicializarBoton("Contacto");
        }

        public void CargarBotonesUsuario()
        {
            DarEstiloABotones();
            b1 = (Button)Master.FindControl("ContentPlaceTop").FindControl("b1");
            b1.Visible = false;
            b2 = (Button)Master.FindControl("ContentPlaceTop").FindControl("b2");
            b2.Text = "Desloguearse";
            b2.Visible = true;
        }

        protected void b1_Click(object sender, EventArgs e)
        {
            Response.Redirect("Account/Login.aspx");
        }

        protected void b2_Click(object sender, EventArgs e)
        {
            if (this.b2.Text == "Registrarse")
            {
                Response.Redirect("Account/Registro.aspx");
            }
            else if (this.b2.Text == "Desloguearse")
            {
                LogOut();
                BLL.Usuario bllUsuario = new BLL.Usuario();
                bllUsuario.Logout(_beUsuario);
                Response.Redirect("~/Default.aspx");

            }
        }
        #endregion

        #region "Sesión"

        protected void ConsultarSesion()
        {
            try
            {
                if (Request.Cookies["usuario"] != null)
                {
                    CargarUsuario();
                }
                else
                {
                    CargarBotonesVisitante();
                }
            }
            catch (Exception ex)
            {
                Mensaje.Mostrar("Error", "Se produjo un error. Error: " + ex.Message, MessageBox.Codigo.MessageBox.MessageBoxIcons.Error, MessageBox.Codigo.MessageBox.MessageBoxButtons.Ok, MessageBox.Codigo.MessageBox.MessageBoxStyle.StyleA, this.Master.LiteralMensajes, this);
            }
        }

        protected void LogOut()
        {
            try
            {
                var responseCookie = Response.Cookies["usuario"];
                if (responseCookie != null)
                    responseCookie.Expires = DateTime.Now.AddDays(-10);

            }
            catch (Exception ex)
            {
                Mensaje.Mostrar("Error", "Se produjo un error al cerrar la sesión. Error: " + ex.Message, MessageBox.Codigo.MessageBox.MessageBoxIcons.Error, MessageBox.Codigo.MessageBox.MessageBoxButtons.Ok, MessageBox.Codigo.MessageBox.MessageBoxStyle.StyleA, this.Master.LiteralMensajes, this);
            }
        }

        private void SetearCookies(string user, string pass, string fam, string id, int dias)
        {
            HttpCookie responseCookie = Response.Cookies["usuario"];
            if (responseCookie != null)
            {
                responseCookie["nombreUsuario"] = user;
                responseCookie["password"] = pass;
                responseCookie["familia"] = fam;
                responseCookie["id"] = id;
                responseCookie.Expires = DateTime.Now.AddDays(dias);
            }
        }

        #endregion

        #region "Usuario"

        public BE.Usuario CrearUsuario()
        {
            _loginVista = new LoginVista();

            var resultadoValidacionBd = DigitoVerificador.ValidarBasedeDatos();

            if (resultadoValidacionBd.EsValida == false)
            {
                _baseDeDatosValida = false;
            }
            else
                _baseDeDatosValida = true;

            return _loginVista.ObtenerUsuarioPorId(Convert.ToInt32(Request.Cookies["usuario"]["id"]));
        }

        public void CargarUsuario()
        {
            try
            {
                _beUsuario = CrearUsuario();

                if (_beUsuario != null)
                {

                    bool esAdministrador = false;
                    try
                    {
                        foreach (BE.Familia familia in _beUsuario.Familias)
                        {
                            if (familia.NombreFamilia == "Administrador")
                                esAdministrador = true;

                            foreach (BE.Patente patente in familia.Patentes)
                            {

                                _button1 = new Button();
                                _button1.Text = Cadena.SepararCadenaPorMayuscula(patente.Descripcion);

                                if (_baseDeDatosValida == false && patente.Descripcion == "DigitosVerificadores")
                                {
                                    _button1.BackColor = Color.Red;
                                }

                                _button1.ID = patente.IdPatente.ToString();
                                _button1.Width = 200;
                                _button1.Height = 32;
                                _button1.PostBackUrl = "Menus/" + familia.NombreFamilia + "/" + patente.Descripcion +
                                                       ".aspx";
                                this.Master.FindControl("ContentPlaceCenter").Controls.Add(_button1);
                            }
                        }

                        if (esAdministrador == false && _baseDeDatosValida == false)
                        {
                            Master.FindControl("ContentPlaceCenter").FindControl("PlaceHolder1").Controls.Clear();
                            Label mensaje = new Label
                            {
                                Text =
                                    "Hay un problema en la Base de Datos, <br/> pongase en contacto con el Administrador."
                            };
                            Master.FindControl("ContentPlaceCenter").FindControl("PlaceHolder1").Controls.Add(mensaje);
                        }

                        SetearCookies(_beUsuario.NombreUsuario, _beUsuario.Password,
                            _beUsuario.Familias[0].NombreFamilia, _beUsuario.IdUsuario.ToString(), 1);
                        CargarBotonesUsuario();

                    }
                    catch (Exception ex)
                    {
                        Mensaje.Mostrar("Carga de Usuario", "Error al cargar el usuario. Error: " + ex.Message,
                            MessageBox.Codigo.MessageBox.MessageBoxIcons.System,
                            MessageBox.Codigo.MessageBox.MessageBoxButtons.Ok,
                            MessageBox.Codigo.MessageBox.MessageBoxStyle.StyleA, this.Master.LiteralMensajes, this);
                    }
                }
                else
                {
                    CargarBotonesVisitante();
                }

            }
            catch (Exception ex)
            {
                Mensaje.Mostrar("Error", "Se produjo un error al cargar el usuario. Error: " + ex.Message, MessageBox.Codigo.MessageBox.MessageBoxIcons.Error, MessageBox.Codigo.MessageBox.MessageBoxButtons.Ok, MessageBox.Codigo.MessageBox.MessageBoxStyle.StyleA, this.Master.LiteralMensajes, this);
            }

        }


        #endregion

        protected void Button1_Click(object sender, EventArgs e)
        {

        }
    }
}