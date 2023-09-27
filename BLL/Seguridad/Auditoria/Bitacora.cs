using System;
using System.Collections.Generic;
using System.Data;

namespace BLL.Seguridad.Auditoria
{
    public static class Bitacora
    {
        public static string MostrarBitacora()
        {

            BLL.Bitacora bllBitacora = new BLL.Bitacora();

            List<object> lstBitacora = bllBitacora.Leer();

            string mensaje = "Se registraron los siguientes " + lstBitacora.Count + " eventos: <br /><br />";

            foreach (BE.Bitacora bitacora in lstBitacora)
            {
                mensaje += " ID_Evento: " + bitacora.IdEvento + " | " + " Descripcion: " + bitacora.Descripcion + " | " + " Fecha: " + bitacora.Fecha + "<br />";

            }

            return mensaje;

        }

        public static DataTable ObtenerBitacora()
        {

            BLL.Bitacora bllBitacora = new BLL.Bitacora();

            return bllBitacora.LeerDataTable();

        }

        public static DataTable ObtenerBitacoraPorFechas(string desde, string hasta)
        {

            BLL.Bitacora bllBitacora = new BLL.Bitacora();

            return bllBitacora.LeerPorFechas(desde, hasta);

        }

        public static void GrabarBitacora(string mensaje)
        {
            BLL.Bitacora bllBitacora = new BLL.Bitacora();
            BE.Bitacora beBitacora = new BE.Bitacora();

            beBitacora.Descripcion = mensaje;
            beBitacora.Fecha = DateTime.Now;

            bllBitacora.Alta(beBitacora);

        }
    }
}
