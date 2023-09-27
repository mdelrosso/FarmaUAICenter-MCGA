using BLL.Seguridad.Sesion;
using System;
using System.Web.UI.WebControls;

namespace FarmaUAICenter.Menus.Administrador
{
    public partial class Bitacora : System.Web.UI.Page
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
                        //Label1.Text = BLL.Seguridad.Auditoria.Bitacora.MostrarBitacora();
                        BindData("", "");
                        break;
                    case "No posee permiso":
                        Label2.Text = "No posee permiso";
                        Label1.Visible = false;
                        break;
                    case "No hay sesión activa":
                        Label2.Text = "No hay sesión activa";
                        Label1.Visible = false;
                        break;
                }
            }
            catch (Exception ex)
            {
                Label2.Text = "No hay sesión activa";
                Label1.Visible = false;
            }

        }

        private void BindData(string desde, string hasta)
        {

            grillaBitacora.DataSource = BLL.Seguridad.Auditoria.Bitacora.ObtenerBitacoraPorFechas(desde, hasta);
            grillaBitacora.DataBind();

        }

        protected void grillaBitacora_PageIndexChanged(object source, DataGridPageChangedEventArgs e)
        {
            grillaBitacora.CurrentPageIndex = e.NewPageIndex;

            BindData(txtFechaDesde.Text, txtFechaHasta.Text);
        }

        protected void btnFiltrar_Click(object sender, EventArgs e)
        {
            BindData(txtFechaDesde.Text, txtFechaHasta.Text);
        }
    }
}