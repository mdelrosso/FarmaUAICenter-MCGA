using BLL.Interfaces;
using Helpers;
using System.Collections.Generic;

namespace BLL
{
    public class Promo : IABM
    {
        private readonly DAL.Promo _dalManagerPromo = new DAL.Promo();

        public ResultadoBd Alta(object pObjeto)
        {
            return _dalManagerPromo.Insertar(pObjeto);
        }

        public ResultadoBd Modificacion(object pObjeto)
        {
            return _dalManagerPromo.Actualizar(pObjeto);
        }

        public ResultadoBd Baja(object pObjeto)
        {
            return _dalManagerPromo.Eliminar(pObjeto);
        }

        public List<BE.Promo> Leer()
        {
            List<BE.Promo> lstPromo = new List<BE.Promo>();

            foreach (BE.Promo unaPromo in _dalManagerPromo.Obtener())
            {
                var nuevoPromo = new BE.Promo();

                nuevoPromo.IdPromo = unaPromo.IdPromo;
                nuevoPromo.Descripcion = unaPromo.Descripcion;
                nuevoPromo.Nombre = unaPromo.Nombre;
                nuevoPromo.NombreProducto = unaPromo.NombreProducto;
                nuevoPromo.PrecioProducto = unaPromo.PrecioProducto;


                lstPromo.Add(nuevoPromo);
            }

            return lstPromo;
        }

        public object ObtenerEntidadPorId(int pId)
        {
            BE.Promo bePromo = (BE.Promo)_dalManagerPromo.ObtenerEntidadPorId(pId);

            return bePromo;
        }
    }
}
