using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Xml;
using System.Data;

namespace FarmaUAICenter.Menus.Avanzado
{
    public partial class AdministrarPedidos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DataSet ds = new DataSet();
            ds.ReadXml(Server.MapPath("~/Menus/Admin/compras.xml"));
            GridView2.DataSource = ds;
            GridView2.DataBind();
        }
    }
}