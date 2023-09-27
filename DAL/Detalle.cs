using DAL.Conexion;
using DAL.Interfaces;
using Helpers;
using System;
using System.Collections.Generic;
using System.Data;

namespace DAL
{
    public class Detalle : IABM
    {
        private readonly AccesoBd _accesoBd = new AccesoBd();

        public ResultadoBd Insertar(object pObjeto)
        {
            var pars = new IDbDataParameter[4];
            pars[0] = _accesoBd.CrearParametro("@ID_Factura", ((BE.Detalle)pObjeto).IdFactura);
            pars[1] = _accesoBd.CrearParametro("@ID_Producto", ((BE.Detalle)pObjeto).Producto.IdProducto);
            pars[2] = _accesoBd.CrearParametro("@cantidad", ((BE.Detalle)pObjeto).Cantidad);
            pars[3] = _accesoBd.CrearParametro("@PrecioUnitario", ((BE.Detalle)pObjeto).PrecioUnitario);

            return _accesoBd.Escribir("sp_AltaDetalle", pars);
        }

        public ResultadoBd Actualizar(object pObjeto)
        {
            var pars = new IDbDataParameter[4];
            pars[0] = _accesoBd.CrearParametro("@ID_Factura", ((BE.Detalle)pObjeto).IdFactura);
            pars[1] = _accesoBd.CrearParametro("@ID_Producto", ((BE.Detalle)pObjeto).Producto.IdProducto);
            pars[2] = _accesoBd.CrearParametro("@cantidad", ((BE.Detalle)pObjeto).Cantidad);
            pars[3] = _accesoBd.CrearParametro("@PrecioUnitario", ((BE.Detalle)pObjeto).PrecioUnitario);


            return _accesoBd.Escribir("sp_ModificarDetalle", pars);
        }

        public ResultadoBd Eliminar(object pObjeto)
        {
            var pars = new IDbDataParameter[2];
            pars[0] = _accesoBd.CrearParametro("@ID_Factura", ((BE.Detalle)pObjeto).IdFactura);
            pars[1] = _accesoBd.CrearParametro("@ID_Producto", ((BE.Detalle)pObjeto).Producto.IdProducto);

            return _accesoBd.Escribir("sp_BajaDetalle", pars);

        }

        public List<object> Obtener()
        {
            var ls = new List<object>();
            var pars = new IDbDataParameter[2];
            pars[0] = _accesoBd.CrearParametro("@ID_Factura", 1);
            pars[0].Value = DBNull.Value;


            var dt = _accesoBd.Leer("sp_LeerDetalle", pars);

            foreach (DataRow row in dt.Rows)
            {
                var unaDetalle = new BE.Detalle()
                {
                    IdFactura = Convert.ToInt32(row["ID_Factura"]),
                    Producto = new BE.Producto() { IdProducto = Convert.ToInt32(row["ID_Producto"].ToString()) },
                    Cantidad = Convert.ToInt32(row["cantidad"]),
                    PrecioUnitario = Convert.ToSingle(row["PrecioUnitario"])
                };

                ls.Add(unaDetalle);
            }

            return ls;
        }

        public object ObtenerEntidadPorId(int pIdFactura, int pIdProducto)
        {
            BE.Detalle unaDetalle = new BE.Detalle();
            var pars = new IDbDataParameter[2];
            pars[0] = _accesoBd.CrearParametro("@ID_Factura", pIdFactura);
            pars[1] = _accesoBd.CrearParametro("@ID_Producto", pIdProducto);


            var dt = _accesoBd.Leer("sp_LeerDetalle", pars);

            if (dt.Rows.Count > 0)
            {
                foreach (DataRow row in dt.Rows)
                {
                    unaDetalle = new BE.Detalle()
                    {
                        IdFactura = Convert.ToInt32(row["ID_Factura"]),
                        Producto = new BE.Producto() { IdProducto = Convert.ToInt32(row["ID_Producto"].ToString()) },
                        Cantidad = Convert.ToInt32(row["cantidad"]),
                        PrecioUnitario = Convert.ToSingle(row["PrecioUnitario"])
                    };
                }

                return unaDetalle;

            }
            else
                return null;

        }

        public List<BE.Detalle> ObtenerDetallesPorIdFactura(int pIdFactura)
        {
            var ls = new List<BE.Detalle>();
            var pars = new IDbDataParameter[2];
            pars[0] = _accesoBd.CrearParametro("@ID_Factura", pIdFactura);
            //  pars[0].Value = DBNull.Value;


            var dt = _accesoBd.Leer("sp_LeerDetalle", pars);

            foreach (DataRow row in dt.Rows)
            {
                var unDetalle = new BE.Detalle()
                {
                    IdFactura = Convert.ToInt32(row["ID_Factura"]),
                    Producto = new BE.Producto() { IdProducto = Convert.ToInt32(row["ID_Producto"].ToString()) },
                    Cantidad = Convert.ToInt32(row["cantidad"]),
                    PrecioUnitario = Convert.ToSingle(row["PrecioUnitario"])
                };

                ls.Add(unDetalle);
            }

            return ls;

        }

        public object ObtenerEntidadPorId(int pId)
        {
            return null;
        }
    }
}
