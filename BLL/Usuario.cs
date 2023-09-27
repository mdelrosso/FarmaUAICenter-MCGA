using BE;
using BLL.Interfaces;
using BLL.Seguridad.DigitoVerificador;
using Helpers;
using System;
using System.Collections.Generic;

namespace BLL
{
    public class Usuario : IABM
    {
        private readonly DAL.Usuario _dalManagerUsuario = new DAL.Usuario();

        public ResultadoBd Alta(object pObjeto)
        {
            return _dalManagerUsuario.Insertar(pObjeto);
        }

        public ResultadoBd Modificacion(object pObjeto)
        {
            return _dalManagerUsuario.Actualizar(pObjeto);
        }

        public ResultadoBd Baja(object pObjeto)
        {
            return _dalManagerUsuario.Eliminar(pObjeto);
        }

        public List<BE.Usuario> Leer()
        {
            BLL.Familia bllFamilia = new BLL.Familia();
            List<BE.Usuario> lstUsuario = new List<BE.Usuario>();

            foreach (BE.Usuario unUsuario in _dalManagerUsuario.Obtener())
            {
                var nuevoUsuario = new BE.Usuario();
                nuevoUsuario.IdUsuario = unUsuario.IdUsuario;
                nuevoUsuario.Activo = unUsuario.Activo;
                nuevoUsuario.Apellido = unUsuario.Apellido;
                nuevoUsuario.Direccion = unUsuario.Direccion;
                nuevoUsuario.Email = unUsuario.Email;
                nuevoUsuario.Nombre = unUsuario.Nombre;
                nuevoUsuario.NombreUsuario = unUsuario.NombreUsuario;
                nuevoUsuario.PalabraRestitucion = unUsuario.PalabraRestitucion;
                nuevoUsuario.Password = unUsuario.Password;
                nuevoUsuario.Telefono = unUsuario.Telefono;
                nuevoUsuario.PerfilesAbstractos = new List<PerfilAbstracto>();

                nuevoUsuario.Familias = bllFamilia.LeerFamiliasPorIdUsuario(nuevoUsuario.IdUsuario);


                lstUsuario.Add(nuevoUsuario);
            }

            return lstUsuario;
        }

        public object ObtenerEntidadPorId(int pId)
        {
            BLL.Familia bllFamilia = new BLL.Familia();

            BE.Usuario beUsuario = (BE.Usuario)_dalManagerUsuario.ObtenerEntidadPorId(pId);
            beUsuario.PerfilesAbstractos = new List<PerfilAbstracto>();
            beUsuario.Familias = bllFamilia.LeerFamiliasPorIdUsuario(beUsuario.IdUsuario);

            return beUsuario;
        }

        public BE.Usuario ObtenerUsuarioPorNombreUsuario(string pNombreUsuario)
        {
            BLL.Familia bllFamilia = new BLL.Familia();

            BE.Usuario beUsuario = _dalManagerUsuario.LeerUsuarioPorNombreUsuario(pNombreUsuario);
            if (beUsuario != null)
            {
                beUsuario.PerfilesAbstractos = new List<PerfilAbstracto>();
                beUsuario.Familias = bllFamilia.LeerFamiliasPorIdUsuario(beUsuario.IdUsuario);
            }


            return beUsuario;
        }

        public BE.Usuario Validar(BE.Usuario beUsuario)
        {
            return Login(beUsuario);

        }
        public void Logout(BE.Usuario beUsuario)
        {

            Seguridad.Auditoria.Bitacora.GrabarBitacora("Se deslogueo el usuario: " + beUsuario.NombreUsuario + " ID: " + beUsuario.IdUsuario + "   ");
            DigitoVerificador.GrabarDvhPorTabla("Bitacora");

        }


        private BE.Usuario Login(BE.Usuario beUsuario)
        {

            try
            {
                BE.Usuario beUsuarioValido = ObtenerUsuarioPorNombreUsuario(beUsuario.NombreUsuario);

                if (beUsuarioValido != null)
                {
                    beUsuarioValido.ContadorIntentos = beUsuario.ContadorIntentos;

                    if (beUsuarioValido.ContadorIntentos <= 2)
                    {
                        if (beUsuario.Password.Equals(beUsuarioValido.Password))
                        {
                            //Si entró acá coincide la contraseña.
                            if (beUsuarioValido.Activo == true)
                            {
                                //Se comprueba si el usuario está o no bloqueado.
                                //Si entró, se trata de un usuario activo

                                //ACA SE ASIENTA EL EVENTO LOGUEO DEL USUARIO
                                if (beUsuarioValido.PrimerLogueo == true)
                                {

                                    Seguridad.Auditoria.Bitacora.GrabarBitacora("Se logueo el usuario: " + beUsuarioValido.NombreUsuario + " ID: " + beUsuarioValido.IdUsuario + "   ");
                                    DigitoVerificador.GrabarDvhPorTabla("Bitacora");
                                    beUsuarioValido.PrimerLogueo = false;

                                }
                            }
                            else
                            {
                                //Usuario bloqueado
                                beUsuarioValido.ContadorIntentos = 0;

                            }
                        }
                        else
                        {
                            beUsuarioValido.ContadorIntentos++;

                            if (beUsuarioValido.ContadorIntentos == 3)
                            {
                                beUsuarioValido = BloquearUsuario(beUsuarioValido);
                            }

                        }
                    }

                    return beUsuarioValido;
                }
                else
                {
                    return null;
                }
            }
            catch (Exception ex)
            {
                throw;
            }


        }

        private BE.Usuario BloquearUsuario(BE.Usuario beUsuarioValido)
        {
            beUsuarioValido.Activo = false;
            beUsuarioValido.Bloqueado = false;

            Modificacion(beUsuarioValido);

            DigitoVerificador.GrabarDvhPorTabla("Usuarios");
            Seguridad.Auditoria.Bitacora.GrabarBitacora("USUARIO BLOQUEADO: " + beUsuarioValido.NombreUsuario + "   ");
            DigitoVerificador.GrabarDvhPorTabla("Bitacora");

            beUsuarioValido.ContadorIntentos = 0;

            return beUsuarioValido;
        }
    }
}
