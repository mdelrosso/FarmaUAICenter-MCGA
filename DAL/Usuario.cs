using DAL.Conexion;
using DAL.Interfaces;
using Helpers;
using System;
using System.Collections.Generic;
using System.Data;

namespace DAL
{
    public class Usuario : IABM
    {
        private readonly AccesoBd _accesoBd = new AccesoBd();

        public ResultadoBd Insertar(object pObjeto)
        {
            var pars = new IDbDataParameter[5];
            pars[0] = _accesoBd.CrearParametro("@Usuario", ((BE.Usuario)pObjeto).NombreUsuario);
            pars[1] = _accesoBd.CrearParametro("@Password", ((BE.Usuario)pObjeto).Password);
            pars[2] = _accesoBd.CrearParametro("@Nombre", ((BE.Usuario)pObjeto).Nombre);
            pars[3] = _accesoBd.CrearParametro("@Apellido", ((BE.Usuario)pObjeto).Apellido);
            pars[4] = _accesoBd.CrearParametro("@Direccion", ((BE.Usuario)pObjeto).Direccion);
            pars[5] = _accesoBd.CrearParametro("@email", ((BE.Usuario)pObjeto).Email);
            pars[6] = _accesoBd.CrearParametro("@Telefono", ((BE.Usuario)pObjeto).Telefono);
            pars[7] = _accesoBd.CrearParametro("@Activo", ((BE.Usuario)pObjeto).Activo);
            pars[8] = _accesoBd.CrearParametro("@PalabraRestitucion", ((BE.Usuario)pObjeto).PalabraRestitucion);

            return _accesoBd.Escribir("sp_AltaUsuarios", pars);
        }

        public ResultadoBd Actualizar(object pObjeto)
        {

            var pars = new IDbDataParameter[10];
            pars[0] = _accesoBd.CrearParametro("@ID_Usuario", ((BE.Usuario)pObjeto).IdUsuario);
            pars[1] = _accesoBd.CrearParametro("@Usuario", ((BE.Usuario)pObjeto).NombreUsuario);
            pars[2] = _accesoBd.CrearParametro("@Password", ((BE.Usuario)pObjeto).Password);
            pars[3] = _accesoBd.CrearParametro("@Nombre", ((BE.Usuario)pObjeto).Nombre);
            pars[4] = _accesoBd.CrearParametro("@Apellido", ((BE.Usuario)pObjeto).Apellido);
            pars[5] = _accesoBd.CrearParametro("@Direccion", ((BE.Usuario)pObjeto).Direccion);
            pars[6] = _accesoBd.CrearParametro("@email", ((BE.Usuario)pObjeto).Email);
            pars[7] = _accesoBd.CrearParametro("@Telefono", ((BE.Usuario)pObjeto).Telefono);
            pars[8] = _accesoBd.CrearParametro("@Activo", ((BE.Usuario)pObjeto).Activo);
            pars[9] = _accesoBd.CrearParametro("@PalabraRestitucion", ((BE.Usuario)pObjeto).PalabraRestitucion);


            return _accesoBd.Escribir("sp_ModificarUsuarios", pars);
        }

        public ResultadoBd Eliminar(object pObjeto)
        {
            var pars = new IDbDataParameter[1];
            pars[0] = _accesoBd.CrearParametro("@ID_Usuario", ((BE.Usuario)pObjeto).IdUsuario);

            return _accesoBd.Escribir("sp_BajaUsuarios", pars);

        }

        public List<object> Obtener()
        {
            var ls = new List<object>();
            var pars = new IDbDataParameter[4];
            pars[0] = _accesoBd.CrearParametro("@ID_Usuario", 1);
            pars[1] = _accesoBd.CrearParametro("@Usuario", 1);
            pars[2] = _accesoBd.CrearParametro("@Nombre", 1);
            pars[3] = _accesoBd.CrearParametro("@Apellido", 1);
            pars[0].Value = DBNull.Value;
            pars[1].Value = DBNull.Value;
            pars[2].Value = DBNull.Value;
            pars[3].Value = DBNull.Value;


            var dt = _accesoBd.Leer("sp_LeerUsuarios", pars);

            foreach (DataRow row in dt.Rows)
            {
                var unaUsuario = new BE.Usuario()
                {
                    IdUsuario = Convert.ToInt32(row["ID_Usuario"]),
                    NombreUsuario = row["Usuario"].ToString(),
                    Password = row["Password"].ToString(),
                    Nombre = row["Nombre"].ToString(),
                    Apellido = row["Apellido"].ToString(),
                    Direccion = row["Direccion"].ToString(),
                    Email = row["email"].ToString(),
                    Activo = Convert.ToBoolean(row["Activo"].ToString()),
                    PalabraRestitucion = row["PalabraRestitucion"].ToString()
                };

                ls.Add(unaUsuario);
            }

            return ls;
        }

        public object ObtenerEntidadPorId(int pIdUsuario)
        {
            BE.Usuario unaUsuario = new BE.Usuario();
            var pars = new IDbDataParameter[4];
            pars[0] = _accesoBd.CrearParametro("@ID_Usuario", pIdUsuario);
            pars[1] = _accesoBd.CrearParametro("@Usuario", 1);
            pars[2] = _accesoBd.CrearParametro("@Nombre", 1);
            pars[3] = _accesoBd.CrearParametro("@Apellido", 1);

            pars[1].Value = DBNull.Value;
            pars[2].Value = DBNull.Value;
            pars[3].Value = DBNull.Value;
            var dt = _accesoBd.Leer("sp_LeerUsuarios", pars);

            if (dt.Rows.Count > 0)
            {
                foreach (DataRow row in dt.Rows)
                {
                    unaUsuario = new BE.Usuario()
                    {
                        IdUsuario = Convert.ToInt32(row["ID_Usuario"]),
                        NombreUsuario = row["Usuario"].ToString(),
                        Password = row["Password"].ToString(),
                        Nombre = row["Nombre"].ToString(),
                        Apellido = row["Apellido"].ToString(),
                        Direccion = row["Direccion"].ToString(),
                        Email = row["email"].ToString(),
                        Activo = Convert.ToBoolean(row["Activo"].ToString()),
                        PalabraRestitucion = row["PalabraRestitucion"].ToString()
                    };
                }

                return unaUsuario;

            }
            else
                return null;

        }

        public BE.Usuario LeerUsuarioPorNombreUsuario(string pNombreUsuario)
        {
            BE.Usuario unaUsuario = new BE.Usuario();
            var pars = new IDbDataParameter[4];
            pars[0] = _accesoBd.CrearParametro("@ID_Usuario", 1);
            pars[1] = _accesoBd.CrearParametro("@Usuario", pNombreUsuario);
            pars[2] = _accesoBd.CrearParametro("@Nombre", 1);
            pars[3] = _accesoBd.CrearParametro("@Apellido", 1);

            pars[0].Value = DBNull.Value;
            pars[2].Value = DBNull.Value;
            pars[3].Value = DBNull.Value;
            var dt = _accesoBd.Leer("sp_LeerUsuarios", pars);

            if (dt.Rows.Count > 0)
            {
                foreach (DataRow row in dt.Rows)
                {
                    unaUsuario = new BE.Usuario()
                    {
                        IdUsuario = Convert.ToInt32(row["ID_Usuario"]),
                        NombreUsuario = row["Usuario"].ToString(),
                        Password = row["Password"].ToString(),
                        Nombre = row["Nombre"].ToString(),
                        Apellido = row["Apellido"].ToString(),
                        Direccion = row["Direccion"].ToString(),
                        Email = row["email"].ToString(),
                        Activo = Convert.ToBoolean(row["Activo"].ToString()),
                        PalabraRestitucion = row["PalabraRestitucion"].ToString(),
                        PrimerLogueo = true
                    };
                }

                return unaUsuario;

            }
            else
                return null;

        }



    }
}
