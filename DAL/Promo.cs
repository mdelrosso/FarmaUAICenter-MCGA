using DAL.Conexion;
using DAL.Interfaces;
using Helpers;
using System;
using System.Collections.Generic;
using System.Data;

namespace DAL
{
    public class Promo : IABM
    {
        private readonly AccesoBd _accesoBd = new AccesoBd();

        public ResultadoBd Insertar(object pObjeto)
        {
            var pars = new IDbDataParameter[4];
            pars[0] = _accesoBd.CrearParametro("@Nombre", ((BE.Promo)pObjeto).Nombre);
            pars[1] = _accesoBd.CrearParametro("@Producto", ((BE.Promo)pObjeto).NombreProducto);
            pars[2] = _accesoBd.CrearParametro("@Descripcion", ((BE.Promo)pObjeto).Descripcion);
            pars[3] = _accesoBd.CrearParametro("@Precio", ((BE.Promo)pObjeto).PrecioProducto);

            return _accesoBd.Escribir("sp_AltaPromos", pars);
        }

        public ResultadoBd Actualizar(object pObjeto)
        {
            var pars = new IDbDataParameter[5];
            pars[0] = _accesoBd.CrearParametro("@ID_Promo", ((BE.Promo)pObjeto).IdPromo);
            pars[1] = _accesoBd.CrearParametro("@Nombre", ((BE.Promo)pObjeto).Nombre);
            pars[2] = _accesoBd.CrearParametro("@Producto", ((BE.Promo)pObjeto).NombreProducto);
            pars[3] = _accesoBd.CrearParametro("@Descripcion", ((BE.Promo)pObjeto).Descripcion);
            pars[4] = _accesoBd.CrearParametro("@Precio", ((BE.Promo)pObjeto).PrecioProducto);

            return _accesoBd.Escribir("sp_ModificarPromos", pars);
        }

        public ResultadoBd Eliminar(object pObjeto)
        {
            var pars = new IDbDataParameter[1];
            pars[0] = _accesoBd.CrearParametro("@ID_Promo", ((BE.Promo)pObjeto).IdPromo);

            return _accesoBd.Escribir("sp_BajaPromos", pars);

        }

        public List<object> Obtener()
        {
            var ls = new List<object>();
  


            var dt = _accesoBd.Leer("sp_LeerPromosv1");

            foreach (DataRow row in dt.Rows)
            {
                var unaPromo = new BE.Promo()
                {
                    IdPromo = Convert.ToInt32(row["ID_Promo"]),
                    Nombre = row["Nombre"].ToString(),
                    NombreProducto = row["Producto"].ToString(),
                    Descripcion = row["Descripcion"].ToString(),
                    PrecioProducto = Convert.ToSingle(row["precio"])
                };

                ls.Add(unaPromo);
            }

            return ls;
        }

        public object ObtenerEntidadPorId(int pIdPromo)
        {
            BE.Promo unaPromo = new BE.Promo();
            var pars = new IDbDataParameter[4];
            pars[0] = _accesoBd.CrearParametro("@ID_Promo", pIdPromo);
            pars[1] = _accesoBd.CrearParametro("@Nombre", 1);
            pars[2] = _accesoBd.CrearParametro("@Producto", 1);
            pars[3] = _accesoBd.CrearParametro("@Descripcion", 1);

            pars[1].Value = DBNull.Value;
            pars[2].Value = DBNull.Value;
            pars[3].Value = DBNull.Value;

            var dt = _accesoBd.Leer("sp_LeerPromo", pars);

            if (dt.Rows.Count > 0)
            {
                foreach (DataRow row in dt.Rows)
                {
                    unaPromo = new BE.Promo()
                    {
                        IdPromo = Convert.ToInt32(row["ID_Promo"]),
                        Nombre = row["Nombre"].ToString(),
                        NombreProducto = row["@Producto"].ToString(),
                        Descripcion = row["Descripcion"].ToString(),
                        PrecioProducto = Convert.ToSingle(row["precio"])
                    };
                }

                return unaPromo;

            }
            else
                return null;

        }
    }
}
