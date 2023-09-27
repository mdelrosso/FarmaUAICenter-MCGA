using DAL.Conexion;
using DAL.Interfaces;
using Helpers;
using System;
using System.Collections.Generic;
using System.Data;

namespace DAL
{
    public class Patente : IABM
    {
        private readonly AccesoBd _accesoBd = new AccesoBd();

        public ResultadoBd Insertar(object pObjeto)
        {
            var pars = new IDbDataParameter[3];
            pars[0] = _accesoBd.CrearParametro("@Descripcion", ((BE.Patente)pObjeto).Descripcion);
            pars[1] = _accesoBd.CrearParametro("@Grupo", ((BE.Patente)pObjeto).Grupo);
            pars[2] = _accesoBd.CrearParametro("@Detalle", ((BE.Patente)pObjeto).Detalle);

            return _accesoBd.Escribir("sp_AltaPatente", pars);
        }

        public ResultadoBd Actualizar(object pObjeto)
        {
            var pars = new IDbDataParameter[4];
            pars[0] = _accesoBd.CrearParametro("@ID_Patente", ((BE.Patente)pObjeto).IdPatente);
            pars[1] = _accesoBd.CrearParametro("@Descripcion", ((BE.Patente)pObjeto).Descripcion);
            pars[2] = _accesoBd.CrearParametro("@Grupo", ((BE.Patente)pObjeto).Grupo);
            pars[3] = _accesoBd.CrearParametro("@Detalle", ((BE.Patente)pObjeto).Detalle);


            return _accesoBd.Escribir("sp_ModificarPatente", pars);
        }

        public ResultadoBd Eliminar(object pObjeto)
        {
            var pars = new IDbDataParameter[1];
            pars[0] = _accesoBd.CrearParametro("@ID_Patente", ((BE.Patente)pObjeto).IdPatente);

            return _accesoBd.Escribir("sp_BajaPatente", pars);

        }

        public List<object> Obtener()
        {
            var ls = new List<object>();
            var pars = new IDbDataParameter[4];
            pars[0] = _accesoBd.CrearParametro("@ID_Patente", 1);
            pars[1] = _accesoBd.CrearParametro("@Descripcion", 1);
            pars[2] = _accesoBd.CrearParametro("@Grupo", 1);
            pars[3] = _accesoBd.CrearParametro("@Detalle", 1);
            pars[0].Value = DBNull.Value;
            pars[1].Value = DBNull.Value;
            pars[2].Value = DBNull.Value;
            pars[3].Value = DBNull.Value;


            var dt = _accesoBd.Leer("sp_LeerPatente", pars);

            foreach (DataRow row in dt.Rows)
            {
                var unaPatente = new BE.Patente()
                {
                    IdPatente = Convert.ToInt32(row["ID_Patente"]),
                    Descripcion = row["Descripcion"].ToString(),
                    Grupo = row["Grupo"].ToString(),
                    Detalle = row["Detalle"].ToString()
                };

                ls.Add(unaPatente);
            }

            return ls;
        }

        public List<BE.Patente> ObtenerPatentesPorIdFamilia(int pIdFamilia)
        {
            var ls = new List<BE.Patente>();
            var pars = new IDbDataParameter[1];
            pars[0] = _accesoBd.CrearParametro("@ID_Familia", pIdFamilia);

            var dt = _accesoBd.Leer("sp_LeerPatentePorIdFamilia", pars);

            foreach (DataRow row in dt.Rows)
            {
                var unaPatente = new BE.Patente()
                {
                    IdPatente = Convert.ToInt32(row["ID_Patente"]),
                    Descripcion = row["Descripcion"].ToString(),
                    Grupo = row["Grupo"].ToString(),
                    Detalle = row["Detalle"].ToString()
                };

                ls.Add(unaPatente);
            }

            return ls;
        }

        public object ObtenerEntidadPorId(int pIdPatente)
        {
            BE.Patente unaPatente = new BE.Patente();
            var pars = new IDbDataParameter[4];
            pars[0] = _accesoBd.CrearParametro("@ID_Patente", pIdPatente);
            pars[1] = _accesoBd.CrearParametro("@Descripcion", 1);
            pars[2] = _accesoBd.CrearParametro("@Grupo", 1);
            pars[3] = _accesoBd.CrearParametro("@Detalle", 1);
            pars[1].Value = DBNull.Value;
            pars[2].Value = DBNull.Value;
            pars[3].Value = DBNull.Value;

            var dt = _accesoBd.Leer("sp_LeerPatente", pars);

            if (dt.Rows.Count > 0)
            {
                foreach (DataRow row in dt.Rows)
                {
                    unaPatente = new BE.Patente()
                    {
                        IdPatente = Convert.ToInt32(row["ID_Patente"]),
                        Descripcion = row["Descripcion"].ToString(),
                        Grupo = row["Grupo"].ToString(),
                        Detalle = row["Detalle"].ToString()
                    };
                }

                return unaPatente;

            }
            else
                return null;

        }
    }
}
