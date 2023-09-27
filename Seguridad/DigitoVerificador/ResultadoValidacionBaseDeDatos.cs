using System.Collections.Generic;

namespace Seguridad.DigitoVerificador
{
    public class ResultadoValidacionBaseDeDatos
    {
        public bool EsValida { get; set; }
        public List<string> RegistrosCorruptos { get; set; }
    }
}
