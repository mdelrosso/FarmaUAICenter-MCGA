using System;
using System.Data;

namespace FarmaUAICenter.Menus.Cliente
{
    public partial class Promos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DataSet ds = new DataSet();
            ds.ReadXml(Server.MapPath("~/Menus/Admin/promosclientes.xml"));
            GridView1.DataSource = ds;
            GridView1.DataBind();
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            /*FarmaUAICenter.ServiceReference1.WebServicePromoSoapClient wspromo = new FarmaUAICenter.ServiceReference1.WebServicePromoSoapClient();
            
            GridView1.DataSource= wspromo.ListarPromo();
            GridView1.DataBind();*/
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}