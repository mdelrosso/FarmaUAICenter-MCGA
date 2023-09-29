using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BE
{
    public class Product
    {
        public string Nombre { get; set; }
        public decimal PrecioNormal { get; set; }

        public decimal PrecioVenta { get; set; }
        public decimal Descuento { get; set; }
    }
}
