using System;
using System.Collections.Generic;

namespace BE
{
    public class Compra
    {
        public int IdCompra { get; set; }

        public Usuario Usuario { get; set; }

        public List<Producto> ListaProductos { get; set; }

        public DateTime Fecha { get; set; }
    }
}
