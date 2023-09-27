using System.Configuration;

namespace Seguridad.BaseDeDatos
{
    public class BackupRestore
    {
        private readonly BLL.Sistema _bllSistema;

        public BackupRestore(BLL.Sistema bllSistema)
        {
            _bllSistema = bllSistema;
        }

        public bool BackUp()
        {
            return _bllSistema.Backup(ConfigurationManager.AppSettings["Base"],
                ConfigurationManager.AppSettings["Directorio"],
                ConfigurationManager.AppSettings["NombreArchivo"]);
        }

        public bool Restore(string directorio)
        {
            return _bllSistema.Restore(ConfigurationManager.AppSettings["Base"],
                ConfigurationManager.AppSettings["Directorio"],
                ConfigurationManager.AppSettings["NombreArchivo"]);
        }
    }
}
