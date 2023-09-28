using System;
using System.Data;
using System.Web.UI.WebControls;
using System.Web.UI;

namespace FarmaUAICenter.Menus.Visitante
{
    public partial class Productos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DataSet ds = new DataSet();
            ds.ReadXml(Server.MapPath("~/Menus/Admin/productos.xml"));
            GridView1.DataSource = ds;
            GridView1.DataBind();
        }

        protected void Back_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Default.aspx");
        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            // Verifica si la fila es una fila de datos y no un encabezado o pie de página.
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                // Puedes acceder a los datos de la fila de esta manera, por ejemplo, supongamos que tienes una columna llamada "Estado".
                string promo = DataBinder.Eval(e.Row.DataItem, "Farmaco").ToString();

                // Aplica tu condición personalizada aquí. Por ejemplo, cambia el color de fondo de la fila si el estado es "Aprobado".
                if (promo == "Ibuprofeno" || promo == "Aspirina" || promo == "Amoxicilina Jarabe")
                {
                    e.Row.BackColor = System.Drawing.Color.LightGreen;
                }
            }
        }

    }
}
