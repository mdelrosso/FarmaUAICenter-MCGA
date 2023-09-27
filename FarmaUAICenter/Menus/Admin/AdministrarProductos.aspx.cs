using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Xml;

namespace FarmaUAICenter.Menus.Avanzado
{
    public partial class AdministrarProductos : System.Web.UI.Page
    {
        private XmlTextWriter _miEscritor;
        private int _cont;

        protected void Page_Load(object sender, EventArgs e)
        {
           /* if (!Page.IsPostBack)
            {
                if (File.Exists(Server.MapPath("productos.xml")))
                {
                    File.Delete(Server.MapPath("productos.xml"));
                    _cont = 1;
                }

                CrearDocumentoXML();

                this.Session["xmlDoc"] = _miEscritor;
                this.Session["cont"] = _cont;
            }
            else
            {
                _cont = Convert.ToInt32(this.Session["cont"]);
                _miEscritor = (XmlTextWriter)this.Session["xmlDoc"];

            }*/
        }

  
      

        private void CrearDocumentoXML()
        {
            _miEscritor = new XmlTextWriter(Server.MapPath("productos.xml"), null);
            _miEscritor.Formatting = Formatting.Indented;
            _miEscritor.WriteStartDocument();
            _miEscritor.WriteComment("Escribir datos en XML");
            _miEscritor.WriteStartElement("Productos");
        }

        private void AgregarElementoXML()
        {
            _miEscritor.WriteStartElement("DatosProductos");

            _miEscritor.WriteStartElement("Nombre", "");
            _miEscritor.WriteString(NomProd.Text);
            _miEscritor.WriteEndElement();//Cierro Nombre Prod

            _miEscritor.WriteStartElement("Descripcion", "");
            _miEscritor.WriteString(DescProd.Text);
            _miEscritor.WriteEndElement();//Cierro Producto

            _miEscritor.WriteStartElement("Precio", "");
            _miEscritor.WriteString(PrecProd.Text);
            _miEscritor.WriteEndElement();//Cierro Precio

            _miEscritor.WriteEndElement();//Cierro DatosPromo
        }

        private void GrabarDocumentoXML()
        {
            _miEscritor.WriteEndElement();
            _miEscritor.WriteEndDocument();
            _miEscritor.Flush();
            _miEscritor.Close();
        }

        protected void BAltaProd0_Click(object sender, EventArgs e)
        {
            GrabarDocumentoXML();
        }

        protected void Button1_Click1(object sender, EventArgs e)
        {
            _cont++;

            AgregarElementoXML();

            this.Session["cont"] = _cont;
        }
    
    }
}