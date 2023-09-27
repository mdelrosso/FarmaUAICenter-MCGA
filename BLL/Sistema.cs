using Helpers;
using System.Collections.Generic;
using System.Data;

namespace BLL
{
    public class Sistema
    {
        private readonly DAL.Sistema _dalSistema = new DAL.Sistema();

        public List<string> ObtenerNombresDeTablas()
        {
            return _dalSistema.LeerNombresDeTablas();
        }

        public DataTable LeerTablaPorNombre(string nombre)
        {
            return _dalSistema.LeerTablaYColumnasEspecificas(nombre, "*");
        }

        public DataTable LeerTablaPorNombreYColumnas(string nombre, string columnas)
        {
            return _dalSistema.LeerTablaYColumnasEspecificas(nombre, columnas);
        }

        public void ActualizarTabla(string nombreTabla, DataTable dataTable)
        {
            _dalSistema.ActualizarGenerico(nombreTabla, dataTable);
        }

        public bool Backup(string nombreBase, string directorio, string nombreArchivo)
        {
            bool retorno = false;

            ResultadoBd resultado = _dalSistema.Backup(nombreBase, directorio, nombreArchivo);

            switch (resultado)
            {
                case ResultadoBd.OK:
                    retorno = true;
                    break;

                case ResultadoBd.ERROR:
                    retorno = false;
                    break;
            }

            return retorno;
        }

        public bool Restore(string nombreBase, string directorio, string nombreArchivo)
        {
            bool retorno = false;

            ResultadoBd resultado = _dalSistema.Restore(nombreBase, directorio, nombreArchivo);

            switch (resultado)
            {
                case ResultadoBd.OK:
                    retorno = true;
                    break;

                case ResultadoBd.ERROR:
                    retorno = false;
                    break;
            }

            return retorno;
        }
    }
}
