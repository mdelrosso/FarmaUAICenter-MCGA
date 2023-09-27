using BLL.Interfaces;
using Helpers;
using System.Collections.Generic;

namespace BLL
{
    public class Stock : IABM
    {
        private readonly DAL.Stock _dalManagerStock = new DAL.Stock();

        public ResultadoBd Alta(object pObjeto)
        {
            return _dalManagerStock.Insertar(pObjeto);
        }

        public ResultadoBd Modificacion(object pObjeto)
        {
            return _dalManagerStock.Actualizar(pObjeto);
        }

        public ResultadoBd Baja(object pObjeto)
        {
            return _dalManagerStock.Eliminar(pObjeto);
        }

        public List<BE.Stock> Leer()
        {
            BLL.Producto bllProducto = new BLL.Producto();
            List<BE.Stock> lstStock = new List<BE.Stock>();

            foreach (BE.Stock unStock in _dalManagerStock.Obtener())
            {
                var nuevoStock = new BE.Stock();
                nuevoStock.Producto = (BE.Producto)bllProducto.ObtenerEntidadPorId(nuevoStock.Producto.IdProducto);
                nuevoStock.Cantidad = unStock.Cantidad;

                lstStock.Add(nuevoStock);
            }

            return lstStock;
        }

        public object ObtenerEntidadPorId(int pId)
        {
            BLL.Producto bllProducto = new BLL.Producto();
            BE.Stock beStock = (BE.Stock)_dalManagerStock.ObtenerEntidadPorId(pId);
            beStock.Producto = (BE.Producto)bllProducto.ObtenerEntidadPorId(beStock.Producto.IdProducto);

            return beStock;
        }
    }
}
