using BLL.Interfaces;
using Helpers;
using System.Collections.Generic;

namespace BLL
{
    public class Producto : IABM
    {
        private readonly DAL.Producto _dalManagerProducto = new DAL.Producto();

        public ResultadoBd Alta(object pObjeto)
        {
            return _dalManagerProducto.Insertar(pObjeto);
        }

        public ResultadoBd Modificacion(object pObjeto)
        {
            return _dalManagerProducto.Actualizar(pObjeto);
        }

        public ResultadoBd Baja(object pObjeto)
        {
            return _dalManagerProducto.Eliminar(pObjeto);
        }

        public List<BE.Producto> Leer()
        {
            BLL.Proveedor bllProveedor = new BLL.Proveedor();
            List<BE.Producto> lstProducto = new List<BE.Producto>();

            foreach (BE.Producto unProducto in _dalManagerProducto.Obtener())
            {
                var nuevoProducto = new BE.Producto();
                nuevoProducto.Proveedor = (BE.Proveedor)bllProveedor.ObtenerEntidadPorId(nuevoProducto.Proveedor.IdProveedor);
                nuevoProducto.IdProducto = unProducto.IdProducto;
                nuevoProducto.Descripcion = unProducto.Descripcion;
                nuevoProducto.Nombre = unProducto.Nombre;
                nuevoProducto.Precio = unProducto.Precio;


                lstProducto.Add(nuevoProducto);
            }

            return lstProducto;
        }

        public object ObtenerEntidadPorId(int pId)
        {
            BLL.Proveedor bllProveedor = new BLL.Proveedor();
            BE.Producto beProducto = (BE.Producto)_dalManagerProducto.ObtenerEntidadPorId(pId);
            beProducto.Proveedor = (BE.Proveedor)bllProveedor.ObtenerEntidadPorId(beProducto.Proveedor.IdProveedor);

            return beProducto;
        }
    }
}
