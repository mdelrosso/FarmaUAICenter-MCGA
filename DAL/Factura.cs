using DAL.Conexion;
using DAL.Interfaces;
using Helpers;
using System;
using System.Collections.Generic;
using System.Data;

namespace DAL
{
    public class Factura : IABM
    {
        private readonly AccesoBd _accesoBd = new AccesoBd();

        public ResultadoBd Insertar(object pObjeto)
        {
            var pars = new IDbDataParameter[2];
            pars[0] = _accesoBd.CrearParametro("@ID_Cliente", ((BE.Factura)pObjeto).Usuario.IdUsuario);
            pars[1] = _accesoBd.CrearParametro("@Fecha", ((BE.Factura)pObjeto).Fecha);

            return _accesoBd.Escribir("sp_AltaFactura", pars);
        }

        public ResultadoBd Actualizar(object pObjeto)
        {
            var pars = new IDbDataParameter[3];
            pars[0] = _accesoBd.CrearParametro("@ID_Factura", ((BE.Factura)pObjeto).IdFactura);
            pars[0] = _accesoBd.CrearParametro("@ID_Cliente", ((BE.Factura)pObjeto).Usuario.IdUsuario);
            pars[1] = _accesoBd.CrearParametro("@Fecha", ((BE.Factura)pObjeto).Fecha);


            return _accesoBd.Escribir("sp_ModificarFactura", pars);
        }

        public ResultadoBd Eliminar(object pObjeto)
        {
            var pars = new IDbDataParameter[1];
            pars[0] = _accesoBd.CrearParametro("@ID_Factura", ((BE.Factura)pObjeto).IdFactura);

            return _accesoBd.Escribir("sp_BajaFactura", pars);

        }

        public List<object> Obtener()
        {
            var ls = new List<object>();
            var pars = new IDbDataParameter[1];
            pars[0] = _accesoBd.CrearParametro("@ID_Factura", 1);
            pars[0].Value = DBNull.Value;


            var dt = _accesoBd.Leer("sp_LeerFactura", pars);

            foreach (DataRow row in dt.Rows)
            {
                var unaFactura = new BE.Factura()
                {
                    IdFactura = Convert.ToInt32(row["ID_Factura"]),
                    Usuario = new BE.Usuario() { IdUsuario = Convert.ToInt32(row["ID_Cliente"].ToString()) },
                    Fecha = Convert.ToDateTime(row["Fecha"])
                };

                ls.Add(unaFactura);
            }

            return ls;
        }

        public object ObtenerEntidadPorId(int pIdFactura)
        {
            BE.Factura unaFactura = new BE.Factura();
            var pars = new IDbDataParameter[1];
            pars[0] = _accesoBd.CrearParametro("@ID_Factura", pIdFactura);

            var dt = _accesoBd.Leer("sp_LeerFactura", pars);

            if (dt.Rows.Count > 0)
            {
                foreach (DataRow row in dt.Rows)
                {
                    unaFactura = new BE.Factura()
                    {
                        IdFactura = Convert.ToInt32(row["ID_Factura"]),
                        Usuario = new BE.Usuario() { IdUsuario = Convert.ToInt32(row["ID_Cliente"].ToString()) },
                        Fecha = Convert.ToDateTime(row["Fecha"])
                    };
                }

                return unaFactura;

            }
            else
                return null;

        }

        public List<BE.Factura> ObtenerFacturasPorIdUsuario(int pIdUsuario)
        {
            var ls = new List<BE.Factura>();
            var pars = new IDbDataParameter[1];
            pars[0] = _accesoBd.CrearParametro("@ID_Cliente", pIdUsuario);
            pars[0].Value = DBNull.Value;


            var dt = _accesoBd.Leer("sp_LeerFacturasPorIdUsuario", pars);

            foreach (DataRow row in dt.Rows)
            {
                var unaFactura = new BE.Factura()
                {
                    IdFactura = Convert.ToInt32(row["ID_Factura"]),
                    Usuario = new BE.Usuario() { IdUsuario = Convert.ToInt32(row["ID_Cliente"].ToString()) },
                    Fecha = Convert.ToDateTime(row["Fecha"])
                };

                ls.Add(unaFactura);
            }

            return ls;

        }
    }
}
