using FarmaUAICenter.MessageBox.Codigo;
using System;
using System.Drawing;
using System.Security.Cryptography;
using System.Security.Policy;
using System.Web.Services.Description;

namespace FarmaUAICenter.Menus.Visitante
{
    public partial class Institucional : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
           
        }

        protected void Back_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Default.aspx");
        }

    }
}