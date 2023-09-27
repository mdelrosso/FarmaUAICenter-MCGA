using BLL.Interfaces;
using Helpers;
using System.Collections.Generic;

namespace BLL
{
    public class Detalle : IABM
    {
        private readonly DAL.Detalle _dalManagerDetalle = new DAL.Detalle();

        public ResultadoBd Alta(object pObjeto)
        {
            return _dalManagerDetalle.Insertar(pObjeto);
        }

        public ResultadoBd Modificacion(object pObjeto)
        {
            return _dalManagerDetalle.Actualizar(pObjeto);
        }

        public ResultadoBd Baja(object pObjeto)
        {
            return _dalManagerDetalle.Eliminar(pObjeto);
        }

        public List<BE.Detalle> Leer()
        {
            BLL.Producto bllProducto = new Producto();
            List<BE.Detalle> lstDetalle = new List<BE.Detalle>();

            foreach (BE.Detalle unDetalle in _dalManagerDetalle.Obtener())
            {
                var nuevoDetalle = new BE.Detalle();
                nuevoDetalle.Producto = (BE.Producto)bllProducto.ObtenerEntidadPorId(nuevoDetalle.Producto.IdProducto);
                nuevoDetalle.IdFactura = unDetalle.IdFactura;
                nuevoDetalle.Cantidad = unDetalle.Cantidad;
                nuevoDetalle.PrecioUnitario = unDetalle.PrecioUnitario;


                lstDetalle.Add(nuevoDetalle);
            }

            return lstDetalle;
        }

        public List<BE.Detalle> LeerPorIdFactura(int pIdFactura)
        {
            return _dalManagerDetalle.ObtenerDetallesPorIdFactura(pIdFactura);
        }

        public object ObtenerEntidadPorId(int pId)
        {
            BLL.Producto bllProducto = new Producto();
            BE.Detalle beDetalle = (BE.Detalle)_dalManagerDetalle.ObtenerEntidadPorId(pId);
            beDetalle.Producto = (BE.Producto)bllProducto.ObtenerEntidadPorId(beDetalle.Producto.IdProducto);

            return beDetalle;
        }
    }
}
