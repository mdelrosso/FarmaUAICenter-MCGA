using System;
using System.Data;

namespace FarmaUAICenter.Menus.Visitante
{
    public partial class Promos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DataSet ds = new DataSet();
            ds.ReadXml(Server.MapPath("~/Menus/promociones.xml"));
            GridView1.DataSource = ds;
            GridView1.DataBind();
        }

        protected void Back_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Default.aspx");
        }
    }
}