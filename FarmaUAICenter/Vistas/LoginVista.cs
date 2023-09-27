using System;

namespace FarmaUAICenter.Vistas
{
    public class LoginVista
    {
        public BE.Usuario BeUsuario = new BE.Usuario();
        private readonly BLL.Usuario _bllUsuario = new BLL.Usuario();
        private int _cantIntentos;

        //public string Usuario { get; set; }
        //public string Password { get; set; }

        public LoginVista()
        {
            _cantIntentos = 0;
        }

        public BE.Usuario Login(string usuario, string password)
        {
            try
            {
                _cantIntentos++;
                BeUsuario.NombreUsuario = usuario;
                BeUsuario.Password = password;
                BeUsuario.ContadorIntentos = _cantIntentos;

                return _bllUsuario.Validar(BeUsuario);
            }
            catch (Exception e)
            {
                throw;
            }
        }

        public BE.Usuario ObtenerUsuarioPorId(int usuId)
        {
            BLL.Usuario bllUsuario = new BLL.Usuario();
            return (BE.Usuario)bllUsuario.ObtenerEntidadPorId(usuId);
        }
    }
}