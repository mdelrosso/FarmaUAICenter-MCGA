using DAL.Conexion;
using DAL.Interfaces;
using Helpers;
using System;
using System.Collections.Generic;
using System.Data;

namespace DAL
{
    public class DigitoVerificadorVertical : IABM
    {
        private readonly AccesoBd _accesoBd = new AccesoBd();

        public ResultadoBd Insertar(object pObjeto)
        {
            var pars = new IDbDataParameter[1];
            pars[0] = _accesoBd.CrearParametro("@DVV", ((BE.DigitoVerificadorVertical)pObjeto).Dvv);

            return _accesoBd.Escribir("sp_AltaDVV", pars);
        }

        public ResultadoBd Actualizar(object pObjeto)
        {
            var pars = new IDbDataParameter[1];
            pars[0] = _accesoBd.CrearParametro("@DVV", ((BE.DigitoVerificadorVertical)pObjeto).Dvv);

            return _accesoBd.Escribir("sp_ModificarDVV", pars);
        }

        public ResultadoBd Eliminar(object pObjeto)
        {
            var pars = new IDbDataParameter[1];
            pars[0] = _accesoBd.CrearParametro("@DVV", ((BE.DigitoVerificadorVertical)pObjeto).Dvv);

            return _accesoBd.Escribir("sp_BajaDVV", pars);

        }

        public List<object> Obtener()
        {
            var ls = new List<object>();
            var pars = new IDbDataParameter[1];
            pars[0] = _accesoBd.CrearParametro("@DVV", 1);
            pars[0].Value = DBNull.Value;


            var dt = _accesoBd.Leer("sp_LeerDVV", pars);

            foreach (DataRow row in dt.Rows)
            {
                var unDvv = new BE.DigitoVerificadorVertical()
                {
                    Dvv = row["DVV"].ToString()

                };

                ls.Add(unDvv);
            }

            return ls;
        }

        public object ObtenerEntidadPorId(int pId)
        {
            return null;
        }
    }
}
