using System;
using System.Collections.Generic;
using System.Configuration;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml;

namespace DAL
{
    public class PromosDAL
    {
        public CultureInfo cultureInfo = new CultureInfo("es-AR");

        private readonly string xmlFilePath;

        public PromosDAL(string filePath)
        {
            xmlFilePath = filePath;
        }

        public List<BE.Product> GetProducts()
        {
            var products = new List<BE.Product>();

            try
            {
                var xmlDoc = new XmlDocument();
                xmlDoc.Load(xmlFilePath);

                foreach (XmlNode productNode in xmlDoc.SelectNodes("//producto"))
                {
                    var nameNode = productNode.SelectSingleNode("Farmaco");
                    var normalPriceNode = productNode.SelectSingleNode("PrecioNormal");
                    var priceNode = productNode.SelectSingleNode("Precio");
                    var discountNode = productNode.SelectSingleNode("Descuento");

                    if (nameNode != null && priceNode != null && discountNode != null)
                    {
                        var name = nameNode.InnerText;
                        var normalprice = decimal.Parse(normalPriceNode.InnerText);
                        var price = decimal.Parse(priceNode.InnerText);
                        var discount = decimal.Parse(discountNode.InnerText);

                        products.Add(new BE.Product
                        {
                            Nombre = name,
                            PrecioNormal = normalprice,
                            Precio = price,
                            Descuento = discount
                        });
                    }
                }
            }
            catch (Exception ex)
            {
                
            }

            return products;
        }
    }
}