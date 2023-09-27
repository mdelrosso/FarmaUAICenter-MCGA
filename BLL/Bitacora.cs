using BLL.Interfaces;
using Helpers;
using System.Collections.Generic;
using System.Data;

namespace BLL
{
    public class Bitacora : IABM
    {
        private readonly DAL.Bitacora _dalManagerBitacora = new DAL.Bitacora();

        public ResultadoBd Alta(object pObjeto)
        {
            return _dalManagerBitacora.Insertar(pObjeto);
        }

        public ResultadoBd Modificacion(object pObjeto)
        {
            return _dalManagerBitacora.Actualizar(pObjeto);
        }

        public ResultadoBd Baja(object pObjeto)
        {
            return _dalManagerBitacora.Eliminar(pObjeto);
        }

        public List<object> Leer()
        {
            List<object> bitacoras = new List<object>();

            foreach (BE.Bitacora unaBitacora in _dalManagerBitacora.Obtener())
            {
                var nuevaBitacora = new BE.Bitacora();
                nuevaBitacora.IdEvento = unaBitacora.IdEvento;
                nuevaBitacora.Descripcion = unaBitacora.Descripcion;
                nuevaBitacora.Fecha = unaBitacora.Fecha;

                bitacoras.Add(nuevaBitacora);
            }

            return bitacoras;
        }

        public DataTable LeerDataTable()
        {
            return _dalManagerBitacora.ObtenerDataTable();
        }
        public DataTable LeerPorFechas(string desde, string hasta)
        {
            return _dalManagerBitacora.ObtenerPorFecha(desde, hasta);
        }

        public object ObtenerEntidadPorId(int pId)
        {
            BE.Bitacora bitacora = (BE.Bitacora)_dalManagerBitacora.ObtenerEntidadPorId(pId);

            return bitacora;
        }

    }
}
