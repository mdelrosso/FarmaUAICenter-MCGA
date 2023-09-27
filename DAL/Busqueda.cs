using DAL.Conexion;
using DAL.Interfaces;
using Helpers;
using System;
using System.Collections.Generic;
using System.Data;

namespace DAL
{
    public class Busqueda : IABM
    {
        private readonly AccesoBd _accesoBd = new AccesoBd();

        public ResultadoBd Insertar(object pObjeto)
        {
            var pars = new IDbDataParameter[3];
            pars[0] = _accesoBd.CrearParametro("@ID_Usuario", ((BE.Busqueda)pObjeto).Usuario.IdUsuario);
            pars[1] = _accesoBd.CrearParametro("@Consulta", ((BE.Busqueda)pObjeto).Consulta);
            pars[2] = _accesoBd.CrearParametro("@Fecha", ((BE.Busqueda)pObjeto).Fecha);

            return _accesoBd.Escribir("sp_AltaBusquedas", pars);
        }

        public ResultadoBd Actualizar(object pObjeto)
        {
            var pars = new IDbDataParameter[4];
            pars[0] = _accesoBd.CrearParametro("@ID_Consulta", ((BE.Busqueda)pObjeto).IdConsulta);
            pars[1] = _accesoBd.CrearParametro("@ID_Usuario", ((BE.Busqueda)pObjeto).Usuario.IdUsuario);
            pars[2] = _accesoBd.CrearParametro("@Consulta", ((BE.Busqueda)pObjeto).Consulta);
            pars[3] = _accesoBd.CrearParametro("@Fecha", ((BE.Busqueda)pObjeto).Fecha);


            return _accesoBd.Escribir("sp_ModificarBusquedas", pars);
        }

        public ResultadoBd Eliminar(object pObjeto)
        {
            var pars = new IDbDataParameter[1];
            pars[0] = _accesoBd.CrearParametro("@ID_Consulta", ((BE.Busqueda)pObjeto).IdConsulta);

            return _accesoBd.Escribir("sp_BajaBusquedas", pars);

        }

        public List<object> Obtener()
        {
            var ls = new List<object>();
            var pars = new IDbDataParameter[1];
            pars[0] = _accesoBd.CrearParametro("@ID_Consulta", 1);
            pars[0].Value = DBNull.Value;


            var dt = _accesoBd.Leer("sp_LeerBusquedas", pars);

            foreach (DataRow row in dt.Rows)
            {
                var unaBusqueda = new BE.Busqueda()
                {
                    IdConsulta = Convert.ToInt32(row["ID_Consulta"]),
                    Usuario = new BE.Usuario() { IdUsuario = Convert.ToInt32(row["ID_Usuario"].ToString()) },
                    Consulta = row["Consulta"].ToString(),
                    Fecha = Convert.ToDateTime(row["Fecha"].ToString())
                };

                ls.Add(unaBusqueda);
            }

            return ls;
        }

        public object ObtenerEntidadPorId(int pId)
        {
            BE.Busqueda unaBusqueda = new BE.Busqueda();
            var pars = new IDbDataParameter[1];
            pars[0] = _accesoBd.CrearParametro("@ID_Evento", pId);

            var dt = _accesoBd.Leer("sp_LeerBusquedas", pars);

            if (dt.Rows.Count > 0)
            {
                foreach (DataRow row in dt.Rows)
                {
                    unaBusqueda = new BE.Busqueda()
                    {
                        IdConsulta = Convert.ToInt32(row["ID_Consulta"]),
                        Usuario = new BE.Usuario() { IdUsuario = Convert.ToInt32(row["ID_Usuario"].ToString()) },
                        Consulta = row["Consulta"].ToString(),
                        Fecha = Convert.ToDateTime(row["Fecha"].ToString())
                    };
                }

                return unaBusqueda;

            }
            else
                return null;

        }

    }
}
