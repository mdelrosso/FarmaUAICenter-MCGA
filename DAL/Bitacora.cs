using DAL.Conexion;
using DAL.Interfaces;
using Helpers;
using System;
using System.Collections.Generic;
using System.Data;

namespace DAL
{
    public class Bitacora : IABM
    {
        private readonly AccesoBd _accesoBd = new AccesoBd();

        public ResultadoBd Insertar(object pObjeto)
        {
            var pars = new IDbDataParameter[2];
            pars[0] = _accesoBd.CrearParametro("@Descripcion", ((BE.Bitacora)pObjeto).Descripcion);
            pars[1] = _accesoBd.CrearParametro("@Fecha", ((BE.Bitacora)pObjeto).Fecha);

            return _accesoBd.Escribir("sp_AltaBitacora", pars);
        }

        public ResultadoBd Actualizar(object pObjeto)
        {
            var pars = new IDbDataParameter[3];
            pars[0] = _accesoBd.CrearParametro("@ID_Evento", ((BE.Bitacora)pObjeto).IdEvento);
            pars[1] = _accesoBd.CrearParametro("@Descripcion", ((BE.Bitacora)pObjeto).Descripcion);
            pars[2] = _accesoBd.CrearParametro("@Fecha", ((BE.Bitacora)pObjeto).Fecha);

            return _accesoBd.Escribir("sp_ModificarBitacora", pars);
        }

        public ResultadoBd Eliminar(object pObjeto)
        {
            var pars = new IDbDataParameter[1];
            pars[0] = _accesoBd.CrearParametro("@ID_Evento", ((BE.Bitacora)pObjeto).IdEvento);

            return _accesoBd.Escribir("sp_BajaBitacora", pars);

        }

        public List<object> Obtener()
        {
            var ls = new List<object>();
            var pars = new IDbDataParameter[1];
            pars[0] = _accesoBd.CrearParametro("@ID_Evento", 1);
            pars[0].Value = DBNull.Value;


            var dt = _accesoBd.Leer("sp_LeerBitacora", pars);

            foreach (DataRow row in dt.Rows)
            {
                var unaBitacora = new BE.Bitacora()
                {
                    IdEvento = Convert.ToInt32(row["ID_Evento"]),
                    Descripcion = row["Descripcion"].ToString(),
                    Fecha = Convert.ToDateTime(row["Fecha"].ToString())
                };

                ls.Add(unaBitacora);
            }

            return ls;
        }

        public DataTable ObtenerPorFecha(string desde, string hasta)
        {

            var pars = new IDbDataParameter[2];
            pars[0] = _accesoBd.CrearParametro("@Desde", "");
            pars[1] = _accesoBd.CrearParametro("@Hasta", "");

            pars[0].Value = String.IsNullOrEmpty(desde) ? (object)DBNull.Value : desde;
            pars[1].Value = String.IsNullOrEmpty(hasta) ? (object)DBNull.Value : hasta;

            var dt = _accesoBd.Leer("sp_LeerBitacoraPorFechas", pars);

            return dt;
        }

        public DataTable ObtenerDataTable()
        {
            var pars = new IDbDataParameter[1];
            pars[0] = _accesoBd.CrearParametro("@ID_Evento", 1);
            pars[0].Value = DBNull.Value;


            var dt = _accesoBd.Leer("sp_LeerBitacora", pars);

            return dt;
        }

        public object ObtenerEntidadPorId(int pId)
        {
            BE.Bitacora unaBitacora = new BE.Bitacora();
            var pars = new IDbDataParameter[1];
            pars[0] = _accesoBd.CrearParametro("@ID_Evento", pId);

            var dt = _accesoBd.Leer("sp_LeerBitacora", pars);

            if (dt.Rows.Count > 0)
            {
                foreach (DataRow row in dt.Rows)
                {
                    unaBitacora = new BE.Bitacora()
                    {
                        IdEvento = Convert.ToInt32(row["ID_Evento"]),
                        Descripcion = row["Descripcion"].ToString(),
                        Fecha = Convert.ToDateTime(row["Fecha"].ToString())
                    };
                }

                return unaBitacora;

            }
            else
                return null;

        }

    }
}
