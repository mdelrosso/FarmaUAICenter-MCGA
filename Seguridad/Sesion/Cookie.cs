namespace Seguridad.Sesion
{
    public class Cookie
    {
        public static string ComprobarCookies(string usuarioFamilia, string familiaRequerida)
        {
            string retorno = "";

            switch (usuarioFamilia)
            {
                case "Administrador":
                case "Avanzado":
                case "Cliente":
                    retorno = Sesion(usuarioFamilia, familiaRequerida);
                    break;
                case "":
                    retorno = "No hay sesión activa";
                    break;
            }
            return retorno;
        }

        private static string Sesion(string usuarioFamilia, string familiaRequerida)
        {
            string retorno = "";
            //ACA PREGUNTA SI LA FAMILIA QUE TRAE ES LA REQUERIDA
            if (!string.IsNullOrEmpty(usuarioFamilia))
            {
                if (usuarioFamilia == familiaRequerida)
                {
                    //SI ES LA REQUERIDA DEVUELVE UN STRING VACIO
                    retorno = "";
                }
                else
                {
                    //SI NO ES LA REQUERIDA DEVUELVE UN MENSAJE
                    retorno = "No posee permiso";
                }
            }
            else
            {
                //SI NO TIENE NADA EN EL STRING, QUIERE DECIR QUE NO HAY USUARIO LOGUEADO
                retorno = "No hay sesión activa";
            }
            return retorno;
        }

    }
}
