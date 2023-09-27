using DAL.Conexion;
using DAL.Interfaces;
using Helpers;
using System;
using System.Collections.Generic;
using System.Data;

namespace DAL
{
    public class Producto : IABM
    {
        private readonly AccesoBd _accesoBd = new AccesoBd();

        public ResultadoBd Insertar(object pObjeto)
        {
            var pars = new IDbDataParameter[4];
            pars[0] = _accesoBd.CrearParametro("@ID_Proveedor", ((BE.Producto)pObjeto).Proveedor.IdProveedor);
            pars[1] = _accesoBd.CrearParametro("@Nombre", ((BE.Producto)pObjeto).Nombre);
            pars[2] = _accesoBd.CrearParametro("@Descripcion", ((BE.Producto)pObjeto).Descripcion);
            pars[3] = _accesoBd.CrearParametro("@Precio", ((BE.Producto)pObjeto).Precio);

            return _accesoBd.Escribir("sp_AltaProductos", pars);
        }

        public ResultadoBd Actualizar(object pObjeto)
        {
            var pars = new IDbDataParameter[5];
            pars[0] = _accesoBd.CrearParametro("@ID_Producto", ((BE.Producto)pObjeto).IdProducto);
            pars[1] = _accesoBd.CrearParametro("@ID_Proveedor", ((BE.Producto)pObjeto).Proveedor.IdProveedor);
            pars[2] = _accesoBd.CrearParametro("@Nombre", ((BE.Producto)pObjeto).Nombre);
            pars[3] = _accesoBd.CrearParametro("@Descripcion", ((BE.Producto)pObjeto).Descripcion);
            pars[4] = _accesoBd.CrearParametro("@Precio", ((BE.Producto)pObjeto).Precio);

            return _accesoBd.Escribir("sp_ModificarProductos", pars);
        }

        public ResultadoBd Eliminar(object pObjeto)
        {
            var pars = new IDbDataParameter[1];
            pars[0] = _accesoBd.CrearParametro("@ID_Producto", ((BE.Producto)pObjeto).IdProducto);

            return _accesoBd.Escribir("sp_BajaProductos", pars);

        }

        public List<object> Obtener()
        {
            var ls = new List<object>();
            var pars = new IDbDataParameter[4];
            pars[0] = _accesoBd.CrearParametro("@ID_Producto", 1);
            pars[1] = _accesoBd.CrearParametro("@ID_Proveedor", 1);
            pars[2] = _accesoBd.CrearParametro("@Nombre", 1);
            pars[3] = _accesoBd.CrearParametro("@Descripcion", 1);
            pars[0].Value = DBNull.Value;
            pars[1].Value = DBNull.Value;
            pars[2].Value = DBNull.Value;
            pars[3].Value = DBNull.Value;


            var dt = _accesoBd.Leer("sp_LeerProductos", pars);

            foreach (DataRow row in dt.Rows)
            {
                var unaProducto = new BE.Producto()
                {
                    IdProducto = Convert.ToInt32(row["ID_Producto"]),
                    Proveedor = new BE.Proveedor() { IdProveedor = Convert.ToInt32(row["ID_Proveedor"].ToString()) },
                    Nombre = row["Nombre"].ToString(),
                    Descripcion = row["Nombre"].ToString()
                };

                ls.Add(unaProducto);
            }

            return ls;
        }

        public object ObtenerEntidadPorId(int pIdProducto)
        {
            BE.Producto unaProducto = new BE.Producto();
            var pars = new IDbDataParameter[4];
            pars[0] = _accesoBd.CrearParametro("@ID_Producto", pIdProducto);
            pars[1] = _accesoBd.CrearParametro("@ID_Proveedor", 1);
            pars[2] = _accesoBd.CrearParametro("@Nombre", 1);
            pars[3] = _accesoBd.CrearParametro("@Descripcion", 1);

            pars[1].Value = DBNull.Value;
            pars[2].Value = DBNull.Value;
            pars[3].Value = DBNull.Value;
            var dt = _accesoBd.Leer("sp_LeerProducto", pars);

            if (dt.Rows.Count > 0)
            {
                foreach (DataRow row in dt.Rows)
                {
                    unaProducto = new BE.Producto()
                    {
                        IdProducto = Convert.ToInt32(row["ID_Producto"]),
                        Proveedor = new BE.Proveedor() { IdProveedor = Convert.ToInt32(row["ID_Proveedor"].ToString()) },
                        Nombre = row["Nombre"].ToString(),
                        Descripcion = row["Nombre"].ToString()
                    };
                }

                return unaProducto;

            }
            else
                return null;

        }
    }
}
