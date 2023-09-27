using System.Collections.Generic;

namespace BLL
{
    public class Compra
    {
        private readonly DAL.Compra _dalManagerCompra = new DAL.Compra();

        public bool AgregarAlCarrito(BE.Producto pProducto, int pCantProd)
        {
            int cantidadStock = _dalManagerCompra.ObtenerCantidadProductosPorId(pProducto.IdProducto);

            if (cantidadStock >= pCantProd)
                return true;


            return false;
        }

        public float CalcularTotal(BE.Compra pCompra)
        {
            float total = 0;

            foreach (BE.Producto item in pCompra.ListaProductos)
            {
                total += item.Precio;
            }

            return total;
        }

        public void Comprar(BE.Compra pCompra)
        {
            //this.CompraDAL_D.Comprar(compra);
        }

        public List<BE.Compra> MisCompras(BE.Usuario pUsuario)
        {
            List<BE.Compra> compras = new List<BE.Compra>();
            BLL.Factura bllFactura = new BLL.Factura();

            var facturas = bllFactura.ObtenerFacturasPorUsuario(pUsuario.IdUsuario);

            foreach (BE.Factura unaFactura in facturas)
            {
                BE.Compra unaCompra = new BE.Compra();

                unaCompra.IdCompra = unaFactura.IdFactura;
                unaCompra.Fecha = unaFactura.Fecha;
                unaCompra.Usuario = unaFactura.Usuario;

                //foreach (BE.Detalle unaFacturaDetalle in unaFactura.Detalles)
                //{
                //    unaCompra.ListaProductos.Add(unaFacturaDetalle.Producto);
                //}

                compras.Add(unaCompra);
            }



            return compras;
        }

        public BE.Detalle MiDetalleCompra(BE.Compra pCompra)
        {
            BLL.Detalle bllDetalle = new BLL.Detalle();

            return (BE.Detalle)bllDetalle.ObtenerEntidadPorId(pCompra.IdCompra);

        }
    }
}
