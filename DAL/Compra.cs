using DAL.Conexion;
using DAL.Interfaces;
using Helpers;
using System;
using System.Collections.Generic;
using System.Data;

namespace DAL
{
    public class Compra : IABM
    {
        private readonly AccesoBd _accesoBd = new AccesoBd();

        public ResultadoBd Insertar(object pObjeto)
        {
    
            throw new NotImplementedException();

        }

        public ResultadoBd Actualizar(object pObjeto)
        {
            throw new NotImplementedException();
        }

        public ResultadoBd Eliminar(object pObjeto)
        {
            throw new NotImplementedException();
        }

        public List<object> Obtener()
        {
            throw new NotImplementedException();
        }

        public object ObtenerEntidadPorId(int pId)
        {
            throw new NotImplementedException();
        }

        public List<object> ObtenerEntidad(object pObjeto)
        {
            throw new NotImplementedException();
        }

        public int ObtenerCantidadProductosPorId(int prodId)
        {
            var pars = new IDbDataParameter[1];
            int cantidad = 0;
            pars[0] = _accesoBd.CrearParametro("@ID_Producto", prodId);

            var dt = _accesoBd.Leer("sp_LeerCantProductosPorId", pars);

            if (dt.Rows.Count > 0)
            {
                foreach (DataRow row in dt.Rows)
                {
                    cantidad = Convert.ToInt32(row["cantidad"].ToString());

                }

                return cantidad;

            }
            else
                return -1;
        }
    }
}
