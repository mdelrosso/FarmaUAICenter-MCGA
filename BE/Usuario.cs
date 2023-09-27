using System.Collections.Generic;

namespace BE
{
    public class Usuario
    {
        public int IdUsuario { get; set; }

        public string NombreUsuario { get; set; }

        public string Password { get; set; }

        public string Nombre { get; set; }

        public string Apellido { get; set; }

        public string Direccion { get; set; }

        public string Email { get; set; }

        public string Telefono { get; set; }

        public bool Activo { get; set; }

        public string PalabraRestitucion { get; set; }

        public List<Familia> Familias { get; set; }

        public List<PerfilAbstracto> PerfilesAbstractos { get; set; }

        public bool PrimerLogueo { get; set; }

        public bool Bloqueado { get; set; }

        public int ContadorIntentos { get; set; }


    }
}
