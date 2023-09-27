using System;
using System.Web.UI.WebControls;

namespace FarmaUAICenter
{
    public partial class M1 : System.Web.UI.MasterPage
    {
        public Literal LiteralMensajes
        {
            get
            {
                return literalMensajes;
            }
            set
            {
                literalMensajes = value;
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {

        }
    }
}