using System;
using System.Collections.Generic;
using System.IO;
using System.Web.Services;
using BLL;
using DAL;

namespace FarmaUAICenter
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
        public List<BE.Product> GetProducts()
        {
            try
            {
                
                string xmlFilePath = Path.Combine(AppDomain.CurrentDomain.BaseDirectory, "Menus", "promociones.xml");
                var xmlRepository = new PromosDAL(xmlFilePath);

                var productManager = new PromosBLL(xmlRepository);

                var products = productManager.GetProducts();

                return products;
            }
            catch (Exception ex)
            {
                throw new ApplicationException("Error al obtener productos: " + ex.Message);
            }
        }
    }
}
