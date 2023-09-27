using System.Collections.Generic;

namespace BLL.Seguridad.DigitoVerificador
{
    public class ResultadoValidacionBaseDeDatos
    {
        public bool EsValida { get; set; }
        public List<string> RegistrosCorruptos { get; set; }

        public ResultadoValidacionBaseDeDatos()
        {
            RegistrosCorruptos = new List<string>();
        }
    }
}
