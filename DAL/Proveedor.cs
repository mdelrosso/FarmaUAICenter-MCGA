using DAL.Conexion;
using DAL.Interfaces;
using Helpers;
using System;
using System.Collections.Generic;
using System.Data;

namespace DAL
{
    public class Proveedor : IABM
    {
        private readonly AccesoBd _accesoBd = new AccesoBd();

        public ResultadoBd Insertar(object pObjeto)
        {
            var pars = new IDbDataParameter[4];
            pars[0] = _accesoBd.CrearParametro("@Nombre", ((BE.Proveedor)pObjeto).Nombre);
            pars[1] = _accesoBd.CrearParametro("@Direccion", ((BE.Proveedor)pObjeto).Direccion);
            pars[2] = _accesoBd.CrearParametro("@Telefono", ((BE.Proveedor)pObjeto).Telefono);
            pars[3] = _accesoBd.CrearParametro("@Descripcion", ((BE.Proveedor)pObjeto).Descripcion);

            return _accesoBd.Escribir("sp_AltaProveedores", pars);
        }

        public ResultadoBd Actualizar(object pObjeto)
        {
            var pars = new IDbDataParameter[5];
            pars[0] = _accesoBd.CrearParametro("@ID_Proveedor", ((BE.Proveedor)pObjeto).IdProveedor);
            pars[1] = _accesoBd.CrearParametro("@Nombre", ((BE.Proveedor)pObjeto).Nombre);
            pars[2] = _accesoBd.CrearParametro("@Direccion", ((BE.Proveedor)pObjeto).Direccion);
            pars[3] = _accesoBd.CrearParametro("@Telefono", ((BE.Proveedor)pObjeto).Telefono);
            pars[4] = _accesoBd.CrearParametro("@Descripcion", ((BE.Proveedor)pObjeto).Descripcion);

            return _accesoBd.Escribir("sp_ModificarProveedores", pars);
        }

        public ResultadoBd Eliminar(object pObjeto)
        {
            var pars = new IDbDataParameter[1];
            pars[0] = _accesoBd.CrearParametro("@ID_Proveedor", ((BE.Proveedor)pObjeto).IdProveedor);

            return _accesoBd.Escribir("sp_BajaProveedores", pars);

        }

        public List<object> Obtener()
        {
            var ls = new List<object>();
            var pars = new IDbDataParameter[5];
            pars[0] = _accesoBd.CrearParametro("@ID_Proveedor", 1);
            pars[1] = _accesoBd.CrearParametro("@Nombre", 1);
            pars[2] = _accesoBd.CrearParametro("@Direccion", 1);
            pars[3] = _accesoBd.CrearParametro("@Telefono", 1);
            pars[4] = _accesoBd.CrearParametro("@Descripcion", 1);
            pars[0].Value = DBNull.Value;
            pars[1].Value = DBNull.Value;
            pars[2].Value = DBNull.Value;
            pars[3].Value = DBNull.Value;
            pars[4].Value = DBNull.Value;


            var dt = _accesoBd.Leer("sp_LeerProveedores", pars);

            foreach (DataRow row in dt.Rows)
            {
                var unaProveedor = new BE.Proveedor()
                {
                    IdProveedor = Convert.ToInt32(row["ID_Proveedor"]),
                    Nombre = row["Nombre"].ToString(),
                    Direccion = row["Nombre"].ToString(),
                    Telefono = row["Nombre"].ToString(),
                    Descripcion = row["Nombre"].ToString()
                };

                ls.Add(unaProveedor);
            }

            return ls;
        }

        public object ObtenerEntidadPorId(int pIdProveedor)
        {
            BE.Proveedor unaProveedor = new BE.Proveedor();
            var pars = new IDbDataParameter[5];
            pars[0] = _accesoBd.CrearParametro("@ID_Proveedor", pIdProveedor);
            pars[1] = _accesoBd.CrearParametro("@Nombre", 1);
            pars[2] = _accesoBd.CrearParametro("@Direccion", 1);
            pars[3] = _accesoBd.CrearParametro("@Telefono", 1);
            pars[4] = _accesoBd.CrearParametro("@Descripcion", 1);

            pars[1].Value = DBNull.Value;
            pars[2].Value = DBNull.Value;
            pars[3].Value = DBNull.Value;
            pars[4].Value = DBNull.Value;
            var dt = _accesoBd.Leer("sp_LeerProveedores", pars);

            if (dt.Rows.Count > 0)
            {
                foreach (DataRow row in dt.Rows)
                {
                    unaProveedor = new BE.Proveedor()
                    {
                        IdProveedor = Convert.ToInt32(row["ID_Proveedor"]),
                        Nombre = row["Nombre"].ToString(),
                        Direccion = row["Nombre"].ToString(),
                        Telefono = row["Nombre"].ToString(),
                        Descripcion = row["Nombre"].ToString()
                    };
                }

                return unaProveedor;

            }
            else
                return null;

        }
    }
}
