using DAL.Conexion;
using DAL.Interfaces;
using Helpers;
using System;
using System.Collections.Generic;
using System.Data;

namespace DAL
{
    public class Stock : IABM
    {
        private readonly AccesoBd _accesoBd = new AccesoBd();

        public ResultadoBd Insertar(object pObjeto)
        {
            var pars = new IDbDataParameter[2];
            pars[0] = _accesoBd.CrearParametro("@ID_Producto", ((BE.Stock)pObjeto).Producto.IdProducto);
            pars[1] = _accesoBd.CrearParametro("@Cantidad", ((BE.Stock)pObjeto).Cantidad);

            return _accesoBd.Escribir("sp_AltaStock", pars);
        }

        public ResultadoBd Actualizar(object pObjeto)
        {
            var pars = new IDbDataParameter[2];
            pars[0] = _accesoBd.CrearParametro("@ID_Producto", ((BE.Stock)pObjeto).Producto.IdProducto);
            pars[1] = _accesoBd.CrearParametro("@Cantidad", ((BE.Stock)pObjeto).Cantidad);

            return _accesoBd.Escribir("sp_ModificarStock", pars);
        }

        public ResultadoBd Eliminar(object pObjeto)
        {
            var pars = new IDbDataParameter[1];
            pars[0] = _accesoBd.CrearParametro("@ID_Producto", ((BE.Stock)pObjeto).Producto.IdProducto);

            return _accesoBd.Escribir("sp_BajaStock", pars);

        }

        public List<object> Obtener()
        {
            var ls = new List<object>();
            var pars = new IDbDataParameter[1];
            pars[0] = _accesoBd.CrearParametro("@ID_Stock", 1);

            pars[0].Value = DBNull.Value;



            var dt = _accesoBd.Leer("sp_LeerStock", pars);

            foreach (DataRow row in dt.Rows)
            {
                var unaStock = new BE.Stock()
                {
                    Producto = new BE.Producto() { IdProducto = Convert.ToInt32(row["ID_Producto"].ToString()) },
                    Cantidad = Convert.ToInt32(row["Cantidad"])
                };

                ls.Add(unaStock);
            }

            return ls;
        }

        public object ObtenerEntidadPorId(int pIdStock)
        {
            BE.Stock unaStock = new BE.Stock();
            var pars = new IDbDataParameter[1];
            pars[0] = _accesoBd.CrearParametro("@ID_Stock", pIdStock);

            pars[0].Value = DBNull.Value;

            var dt = _accesoBd.Leer("sp_LeerStock", pars);

            if (dt.Rows.Count > 0)
            {
                foreach (DataRow row in dt.Rows)
                {
                    unaStock = new BE.Stock()
                    {
                        Producto = new BE.Producto() { IdProducto = Convert.ToInt32(row["ID_Producto"].ToString()) },
                        Cantidad = Convert.ToInt32(row["Cantidad"])
                    };
                }

                return unaStock;

            }
            else
                return null;

        }
    }
}
