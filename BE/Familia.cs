using System.Collections.Generic;

namespace BE
{
    public class Familia
    {
        public int IdFamilia { get; set; }

        public string NombreFamilia { get; set; }

        public List<Patente> Patentes { get; set; }

    }
}
