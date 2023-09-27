using BLL.Interfaces;
using Helpers;
using System.Collections.Generic;

namespace BLL
{
    public class DigitoVerificadorVertical : IABM
    {
        private readonly DAL.DigitoVerificadorVertical _dalManagerDigitoVerificadorVertical = new DAL.DigitoVerificadorVertical();

        public ResultadoBd Alta(object pObjeto)
        {
            return _dalManagerDigitoVerificadorVertical.Insertar(pObjeto);
        }

        public ResultadoBd Modificacion(object pObjeto)
        {
            return _dalManagerDigitoVerificadorVertical.Actualizar(pObjeto);
        }

        public ResultadoBd Baja(object pObjeto)
        {
            return _dalManagerDigitoVerificadorVertical.Eliminar(pObjeto);
        }

        public List<BE.DigitoVerificadorVertical> Leer()
        {
            BLL.Producto bllProducto = new Producto();
            List<BE.DigitoVerificadorVertical> lstDigitoVerificadorVertical = new List<BE.DigitoVerificadorVertical>();

            foreach (BE.DigitoVerificadorVertical unDigitoVerificadorVertical in _dalManagerDigitoVerificadorVertical.Obtener())
            {
                var nuevoDigitoVerificadorVertical = new BE.DigitoVerificadorVertical();
                nuevoDigitoVerificadorVertical.Dvv = unDigitoVerificadorVertical.Dvv;


                lstDigitoVerificadorVertical.Add(nuevoDigitoVerificadorVertical);
            }

            return lstDigitoVerificadorVertical;
        }

        public object ObtenerEntidadPorId(int pId)
        {
            return null;
        }
    }
}
