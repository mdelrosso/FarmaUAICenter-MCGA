using BLL.Interfaces;
using Helpers;
using System.Collections.Generic;

namespace BLL
{
    public class Busqueda : IABM
    {
        private readonly DAL.Busqueda _dalManagerBusqueda = new DAL.Busqueda();

        public ResultadoBd Alta(object pObjeto)
        {
            return _dalManagerBusqueda.Insertar(pObjeto);
        }

        public ResultadoBd Modificacion(object pObjeto)
        {
            return _dalManagerBusqueda.Actualizar(pObjeto);
        }

        public ResultadoBd Baja(object pObjeto)
        {
            return _dalManagerBusqueda.Eliminar(pObjeto);
        }

        public List<BE.Busqueda> Leer()
        {
            BLL.Usuario bllUsuario = new BLL.Usuario();
            List<BE.Busqueda> lstBusqueda = new List<BE.Busqueda>();

            foreach (BE.Busqueda unaBusqueda in _dalManagerBusqueda.Obtener())
            {
                var nuevaBusqueda = new BE.Busqueda();
                nuevaBusqueda.Usuario = (BE.Usuario)bllUsuario.ObtenerEntidadPorId(nuevaBusqueda.Usuario.IdUsuario);
                nuevaBusqueda.Consulta = unaBusqueda.Consulta;
                nuevaBusqueda.Fecha = unaBusqueda.Fecha;
                nuevaBusqueda.IdConsulta = unaBusqueda.IdConsulta;

                lstBusqueda.Add(nuevaBusqueda);
            }

            return lstBusqueda;
        }

        public object ObtenerEntidadPorId(int pId)
        {
            BLL.Usuario bllUsuario = new BLL.Usuario();
            BE.Busqueda beBusqueda = (BE.Busqueda)_dalManagerBusqueda.ObtenerEntidadPorId(pId);
            beBusqueda.Usuario = (BE.Usuario)bllUsuario.ObtenerEntidadPorId(beBusqueda.Usuario.IdUsuario);

            return beBusqueda;
        }
    }
}
