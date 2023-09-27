using DAL.Conexion;
using DAL.Interfaces;
using Helpers;
using System;
using System.Collections.Generic;
using System.Data;

namespace DAL
{
    public class Familia : IABM
    {
        private readonly AccesoBd _accesoBd = new AccesoBd();

        public ResultadoBd Insertar(object pObjeto)
        {
            var pars = new IDbDataParameter[1];
            pars[0] = _accesoBd.CrearParametro("@Nombre_Familia", ((BE.Familia)pObjeto).NombreFamilia);


            return _accesoBd.Escribir("sp_AltaFamilia", pars);
        }

        public ResultadoBd Actualizar(object pObjeto)
        {
            var pars = new IDbDataParameter[2];
            pars[0] = _accesoBd.CrearParametro("@ID_Familia", ((BE.Familia)pObjeto).IdFamilia);
            pars[1] = _accesoBd.CrearParametro("@Nombre_Familia", ((BE.Familia)pObjeto).NombreFamilia);

            return _accesoBd.Escribir("sp_ModificarFamilia", pars);
        }

        public ResultadoBd Eliminar(object pObjeto)
        {
            var pars = new IDbDataParameter[1];
            pars[0] = _accesoBd.CrearParametro("@ID_Familia", ((BE.Familia)pObjeto).IdFamilia);

            return _accesoBd.Escribir("sp_BajaFamilia", pars);

        }

        public List<object> Obtener()
        {
            var ls = new List<object>();
            var pars = new IDbDataParameter[2];
            pars[0] = _accesoBd.CrearParametro("@ID_Familia", 1);
            pars[1] = _accesoBd.CrearParametro("@Nombre_Familia", 1);
            pars[0].Value = DBNull.Value;
            pars[1].Value = DBNull.Value;


            var dt = _accesoBd.Leer("sp_LeerFamilia", pars);

            foreach (DataRow row in dt.Rows)
            {
                var unaFamilia = new BE.Familia()
                {
                    IdFamilia = Convert.ToInt32(row["ID_Familia"]),
                    NombreFamilia = row["Nombre_Familiam"].ToString()
                };

                ls.Add(unaFamilia);
            }

            return ls;
        }

        public List<object> ObtenerFamiliasPorIdUsuario(int pIdUsuario)
        {
            var ls = new List<object>();
            var pars = new IDbDataParameter[1];
            pars[0] = _accesoBd.CrearParametro("@ID_Usuario", pIdUsuario);

            var dt = _accesoBd.Leer("sp_LeerFamiliasPorIdUsuario", pars);

            foreach (DataRow row in dt.Rows)
            {
                var unaFamilia = new BE.Familia()
                {
                    IdFamilia = Convert.ToInt32(row["ID_Familia"]),
                    NombreFamilia = row["Nombre_Familia"].ToString()
                };

                ls.Add(unaFamilia);
            }

            return ls;
        }

        public object ObtenerEntidadPorId(int pIdFamilia)
        {
            BE.Familia unaFamilia = new BE.Familia();
            var pars = new IDbDataParameter[2];
            pars[0] = _accesoBd.CrearParametro("@ID_Familia", pIdFamilia);
            pars[1] = _accesoBd.CrearParametro("@Nombre_Familia", 1);
            pars[1].Value = DBNull.Value;

            var dt = _accesoBd.Leer("sp_LeerFamilia", pars);

            if (dt.Rows.Count > 0)
            {
                foreach (DataRow row in dt.Rows)
                {
                    unaFamilia = new BE.Familia()
                    {
                        IdFamilia = Convert.ToInt32(row["ID_Familia"]),
                        NombreFamilia = row["Nombre_Familia"].ToString()
                    };
                }

                return unaFamilia;

            }
            else
                return null;

        }
    }
}
