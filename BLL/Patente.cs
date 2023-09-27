using BLL.Interfaces;
using Helpers;
using System.Collections.Generic;

namespace BLL
{
    public class Patente : IABM
    {
        private readonly DAL.Patente _dalManagerPatente = new DAL.Patente();

        public ResultadoBd Alta(object pObjeto)
        {
            return _dalManagerPatente.Insertar(pObjeto);
        }

        public ResultadoBd Modificacion(object pObjeto)
        {
            return _dalManagerPatente.Actualizar(pObjeto);
        }

        public ResultadoBd Baja(object pObjeto)
        {
            return _dalManagerPatente.Eliminar(pObjeto);
        }

        public List<BE.Patente> Leer()
        {
            List<BE.Patente> lstPatente = new List<BE.Patente>();

            foreach (BE.Patente unPatente in _dalManagerPatente.Obtener())
            {
                var nuevoPatente = new BE.Patente();
                nuevoPatente.IdPatente = unPatente.IdPatente;
                nuevoPatente.Detalle = unPatente.Detalle;
                nuevoPatente.Grupo = unPatente.Grupo;
                nuevoPatente.Descripcion = unPatente.Descripcion;


                lstPatente.Add(nuevoPatente);
            }

            return lstPatente;
        }

        public List<BE.Patente> LeerPatentesPorIdFamilia(int pIdFamilia)
        {
            return _dalManagerPatente.ObtenerPatentesPorIdFamilia(pIdFamilia);
        }

        public object ObtenerEntidadPorId(int pId)
        {
            BE.Patente bePatente = (BE.Patente)_dalManagerPatente.ObtenerEntidadPorId(pId);

            return bePatente;
        }
    }
}
