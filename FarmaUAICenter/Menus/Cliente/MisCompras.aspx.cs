using System;
using System.Data;

namespace FarmaUAICenter.Menus.Cliente
{
    public partial class MisCompras : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            DataSet ds = new DataSet();
            ds.ReadXml(Server.MapPath("~/Menus/Admin/compras.xml"));
            GridView1.DataSource = ds;
            GridView1.DataBind();
        }


    }
}