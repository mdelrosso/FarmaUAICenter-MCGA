using System;

namespace FarmaUAICenter.Menus.Visitante
{
    public partial class Promos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
            if (!IsPostBack)
            {
                WebServicePromo ws = new WebServicePromo();
                var products = ws.GetProducts();
                GridView1.DataSource = products;
                GridView1.DataBind();
            }
        }

        protected void Back_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Default.aspx");
        }
    }
}