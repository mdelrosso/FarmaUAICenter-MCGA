using BLL.Interfaces;
using Helpers;
using System.Collections.Generic;

namespace BLL
{
    public class Factura : IABM
    {
        private readonly DAL.Factura _dalManagerFactura = new DAL.Factura();

        public ResultadoBd Alta(object pObjeto)
        {
            return _dalManagerFactura.Insertar(pObjeto);
        }

        public ResultadoBd Modificacion(object pObjeto)
        {
            return _dalManagerFactura.Actualizar(pObjeto);
        }

        public ResultadoBd Baja(object pObjeto)
        {
            return _dalManagerFactura.Eliminar(pObjeto);
        }

        public List<BE.Factura> Leer()
        {
            BLL.Detalle bllDetalle = new BLL.Detalle();
            BLL.Usuario bllUsuario = new BLL.Usuario();
            List<BE.Factura> lstFactura = new List<BE.Factura>();

            foreach (BE.Factura unFactura in _dalManagerFactura.Obtener())
            {
                var nuevoFactura = new BE.Factura();
                nuevoFactura.Usuario = (BE.Usuario)bllUsuario.ObtenerEntidadPorId(nuevoFactura.Usuario.IdUsuario);
                nuevoFactura.IdFactura = unFactura.IdFactura;
                nuevoFactura.Fecha = unFactura.Fecha;

                nuevoFactura.Detalles = bllDetalle.LeerPorIdFactura(nuevoFactura.IdFactura);


                lstFactura.Add(nuevoFactura);
            }

            return lstFactura;
        }

        public object ObtenerEntidadPorId(int pId)
        {
            BLL.Detalle bllDetalle = new BLL.Detalle();
            BLL.Usuario bllUsuario = new BLL.Usuario();
            BE.Factura beFactura = (BE.Factura)_dalManagerFactura.ObtenerEntidadPorId(pId);
            beFactura.Usuario = (BE.Usuario)bllUsuario.ObtenerEntidadPorId(beFactura.Usuario.IdUsuario);
            beFactura.Detalles = bllDetalle.LeerPorIdFactura(beFactura.IdFactura);

            return beFactura;
        }

        public List<BE.Factura> ObtenerFacturasPorUsuario(int pIdUsuario)
        {

            BLL.Detalle bllDetalle = new BLL.Detalle();
            BLL.Usuario bllUsuario = new BLL.Usuario();
            List<BE.Factura> lstFactura = new List<BE.Factura>();
            var nuevoFactura = new BE.Factura();

            foreach (BE.Factura unFactura in _dalManagerFactura.ObtenerFacturasPorIdUsuario(pIdUsuario))
            {

                nuevoFactura.Usuario = (BE.Usuario)bllUsuario.ObtenerEntidadPorId(pIdUsuario);
                nuevoFactura.IdFactura = unFactura.IdFactura;
                nuevoFactura.Fecha = unFactura.Fecha;

                //  nuevoFactura.Detalles = bllDetalle.LeerPorIdFactura(nuevoFactura.IdFactura);


                lstFactura.Add(nuevoFactura);
            }

            return lstFactura;

        }
    }
}
