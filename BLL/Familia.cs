using BLL.Interfaces;
using Helpers;
using System.Collections.Generic;

namespace BLL
{
    public class Familia : IABM
    {
        private readonly DAL.Familia _dalManagerFamilia = new DAL.Familia();

        public ResultadoBd Alta(object pObjeto)
        {
            return _dalManagerFamilia.Insertar(pObjeto);
        }

        public ResultadoBd Modificacion(object pObjeto)
        {
            return _dalManagerFamilia.Actualizar(pObjeto);
        }

        public ResultadoBd Baja(object pObjeto)
        {
            return _dalManagerFamilia.Eliminar(pObjeto);
        }

        public List<BE.Familia> Leer()
        {
            BLL.Patente bllPatente = new BLL.Patente();
            List<BE.Familia> lstFamilia = new List<BE.Familia>();

            foreach (BE.Familia unaFamilia in _dalManagerFamilia.Obtener())
            {
                var nuevaFamilia = new BE.Familia();
                nuevaFamilia.IdFamilia = unaFamilia.IdFamilia;
                nuevaFamilia.NombreFamilia = unaFamilia.NombreFamilia;
                nuevaFamilia.Patentes = bllPatente.LeerPatentesPorIdFamilia(nuevaFamilia.IdFamilia);


                lstFamilia.Add(nuevaFamilia);
            }

            return lstFamilia;
        }

        public List<BE.Familia> LeerFamiliasPorIdUsuario(int pIdUsuario)
        {
            BLL.Patente bllPatente = new BLL.Patente();
            List<BE.Familia> lstFamilia = new List<BE.Familia>();

            foreach (BE.Familia unaFamilia in _dalManagerFamilia.ObtenerFamiliasPorIdUsuario(pIdUsuario))
            {
                var nuevaFamilia = new BE.Familia();
                nuevaFamilia.IdFamilia = unaFamilia.IdFamilia;
                nuevaFamilia.NombreFamilia = unaFamilia.NombreFamilia;
                nuevaFamilia.Patentes = bllPatente.LeerPatentesPorIdFamilia(nuevaFamilia.IdFamilia);


                lstFamilia.Add(nuevaFamilia);
            }

            return lstFamilia;
        }

        public object ObtenerEntidadPorId(int pId)
        {
            BLL.Patente bllPatente = new BLL.Patente();
            BE.Familia beFamilia = (BE.Familia)_dalManagerFamilia.ObtenerEntidadPorId(pId);
            beFamilia.Patentes = bllPatente.LeerPatentesPorIdFamilia(beFamilia.IdFamilia);

            return beFamilia;
        }
    }
}
