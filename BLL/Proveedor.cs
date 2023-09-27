using BLL.Interfaces;
using Helpers;
using System.Collections.Generic;

namespace BLL
{
    public class Proveedor : IABM
    {
        private readonly DAL.Proveedor _dalManagerProveedor = new DAL.Proveedor();

        public ResultadoBd Alta(object pObjeto)
        {
            return _dalManagerProveedor.Insertar(pObjeto);
        }

        public ResultadoBd Modificacion(object pObjeto)
        {
            return _dalManagerProveedor.Actualizar(pObjeto);
        }

        public ResultadoBd Baja(object pObjeto)
        {
            return _dalManagerProveedor.Eliminar(pObjeto);
        }

        public List<BE.Proveedor> Leer()
        {
            List<BE.Proveedor> lstProveedor = new List<BE.Proveedor>();

            foreach (BE.Proveedor unProveedor in _dalManagerProveedor.Obtener())
            {
                var nuevoProveedor = new BE.Proveedor();
                nuevoProveedor.IdProveedor = unProveedor.IdProveedor;
                nuevoProveedor.Descripcion = unProveedor.Descripcion;
                nuevoProveedor.Direccion = unProveedor.Direccion;
                nuevoProveedor.Nombre = unProveedor.Nombre;
                nuevoProveedor.Telefono = unProveedor.Telefono;

                lstProveedor.Add(nuevoProveedor);
            }

            return lstProveedor;
        }

        public object ObtenerEntidadPorId(int pId)
        {
            BE.Proveedor beProveedor = (BE.Proveedor)_dalManagerProveedor.ObtenerEntidadPorId(pId);

            return beProveedor;
        }
    }
}
