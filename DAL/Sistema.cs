using DAL.Conexion;
using Helpers;
using System;
using System.Collections.Generic;
using System.Data;

namespace DAL
{
    public class Sistema
    {
        private readonly AccesoBd _accesoBd = new AccesoBd();
        public DataTable LeerTablaYColumnasEspecificas(string nombreTabla, string columnas)
        {
            var pars = new IDbDataParameter[2];
            pars[0] = _accesoBd.CrearParametro("@NombreTabla", nombreTabla);
            pars[1] = _accesoBd.CrearParametro("@ListaColumnas", String.Empty);

            pars[1].Value = String.IsNullOrEmpty(columnas) ? "*" : columnas;

            DataTable dt = _accesoBd.Leer("sp_LeerTabla", pars);

            return dt;
        }

        public List<string> LeerNombresDeTablas()
        {
            List<string> listaNombres = new List<string>();

            var pars = new IDbDataParameter[0];

            DataTable dt = _accesoBd.Leer("sp_ObtenerNombresDeTablas", pars);

            foreach (DataRow row in dt.Rows)
            {

                listaNombres.Add(row["NAME"].ToString());
            }

            return listaNombres;
        }

        public ResultadoBd Backup(string nombreBase, string directorio, string nombreArchivo)
        {
            var pars = new IDbDataParameter[3];
            pars[0] = _accesoBd.CrearParametro("@Base", nombreBase);
            pars[1] = _accesoBd.CrearParametro("@Directorio", directorio);
            pars[2] = _accesoBd.CrearParametro("@NombreArchivo", nombreArchivo);


            return _accesoBd.Escribir("sp_Backup", pars);


        }

        public ResultadoBd Restore(string nombreBase, string directorio, string nombreArchivo)
        {
            ResultadoBd resultado = ResultadoBd.OK;

            try
            {
                string query = "USE MASTER \n";
                query += "ALTER DATABASE " + nombreBase + " SET SINGLE_USER WITH ROLLBACK IMMEDIATE \n";
                query += "DROP DATABASE " + nombreBase + " \n";
                query += "RESTORE DATABASE " + nombreBase + " FROM DISK = '" + directorio +@"\\"+nombreArchivo + "' WITH REPLACE;";

                _accesoBd.EjecutarQuery(query);
            }
            catch (Exception ex)
            {
                resultado = ResultadoBd.ERROR;
            }

            return resultado;
        }

        public ResultadoBd ActualizarGenerico(string nombreTabla, DataTable dataTable)
        {
            return _accesoBd.Actualizar(nombreTabla, dataTable);
        }
    }
}
