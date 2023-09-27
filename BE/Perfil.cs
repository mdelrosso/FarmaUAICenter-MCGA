using System.Collections.Generic;

namespace BE
{
    public class Perfil : PerfilAbstracto
    {
        public int IdPerfil { get; set; }

        public string Descripcion { get; set; }

        public List<PerfilAbstracto> FamiliaPatente { get; set; }
    }
}
