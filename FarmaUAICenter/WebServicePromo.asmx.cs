using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;

namespace PharmaCiudad
{
    /// <summary>
    /// Summary description for WebServicePromo
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    // [System.Web.Script.Services.ScriptService]
    public class WebServicePromo : System.Web.Services.WebService
    {

        [WebMethod]
        public string HelloWorld()
        {
            return "probando";
        }

        [WebMethod]
        public List<BE.Promo> ListarPromo()
        {
            BLL.Promo prom = new BLL.Promo();
            List<BE.Promo> listapromo = new List<BE.Promo>();
            listapromo= prom.Leer();

            return listapromo;

        }
    }
}
