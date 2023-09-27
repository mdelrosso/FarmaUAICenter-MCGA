using System;
using System.Collections.Generic;

namespace BE
{
    public class Factura
    {
        public int IdFactura { get; set; }

        public Usuario Usuario { get; set; }

        public List<Detalle> Detalles { get; set; }

        public DateTime Fecha { get; set; }

    }

}
