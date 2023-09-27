using System;
using System.Collections.Generic;
using System.Data;
using System.Security.Cryptography;
using System.Text;

namespace BLL.Seguridad.DigitoVerificador
{
    public static class DigitoVerificador
    {
        public static string CrearHash(string cadena)
        {
            UnicodeEncoding unicodeEncoding = new UnicodeEncoding();

            //ALMACENA LA CADENA INGRESADA EN UNA MATRIZ DE BYTES
            byte[] cadenaArrayByte = unicodeEncoding.GetBytes(cadena);
            SHA1CryptoServiceProvider sha1Service = new SHA1CryptoServiceProvider();

            //CREA EL HASH
            byte[] cadenaAHash = sha1Service.ComputeHash(cadenaArrayByte);

            //RETORNA COMO UNA CADENA CODIFICADA EN BASE64
            string resultado = Convert.ToBase64String(cadenaAHash);

            return resultado;
        }

        public static void GrabarDvhPorTabla(string nombreTabla)
        {
            BLL.Sistema bllSistema = new BLL.Sistema();

            try
            {
                //Obtengo el contenido de la tabla actual
                DataTable tabla = bllSistema.LeerTablaPorNombre(nombreTabla);

                for (int row = 0; row <= tabla.Rows.Count - 1; row++)
                {
                    string cadenaDvh = CalcularDvhDeFila(tabla, row);

                    //Se lo asigno a la fila
                    tabla.Rows[row]["DVH"] = cadenaDvh;
                }

                bllSistema.ActualizarTabla(nombreTabla, tabla);

                //Obtengo todos los nombres de las tablas de la base de datos
                List<string> nombresDeTablas = bllSistema.ObtenerNombresDeTablas();

                //Actualizo el DVV
                ActualizarDvv(nombresDeTablas);
            }
            catch (Exception ex)
            {

            }
        }

        public static void ActualizarDvv()
        {
            BLL.Sistema bllSistema = new BLL.Sistema();

            //Obtengo todos los nombres de las tablas de la base de datos
            List<string> nombresDeTablas = bllSistema.ObtenerNombresDeTablas();

            ActualizarDvv(nombresDeTablas);
        }

        public static ResultadoValidacionBaseDeDatos ValidarBasedeDatos()
        {
            BLL.Sistema bllSistema = new BLL.Sistema();
            BLL.DigitoVerificadorVertical bllDvv = new BLL.DigitoVerificadorVertical();
            ResultadoValidacionBaseDeDatos resultado = new ResultadoValidacionBaseDeDatos();

            try
            {
                string todosLosDvh = null;
                // int columna = 0;
                resultado.EsValida = true;

                //CALCULO DE TODOS LOS DVH
                //Obtengo todos los nombres de las tablas de la base de datos
                List<string> nombresDeTablas = bllSistema.ObtenerNombresDeTablas();

                foreach (string nombreTabla in nombresDeTablas)
                {
                    //Excepto la tabla del digito vertical, recorro todas
                    if (!nombreTabla.Equals("DVV"))
                    {
                        //Obtengo el contenido de la tabla actual
                        DataTable tabla = bllSistema.LeerTablaPorNombre(nombreTabla);

                        for (int row = 0; row <= tabla.Rows.Count - 1; row++)
                        {
                            //Calculo el DVH 
                            string dvhCalculado = CalcularDvhDeFila(tabla, row);

                            todosLosDvh = todosLosDvh + dvhCalculado;

                            if (!tabla.Rows[row]["DVH"].ToString().Equals(dvhCalculado))
                            {
                                //Si el DVH guardado en la base es distinto al DVH recien calculado
                                //indica que hubo una modificacion del registro, sin actualizar el DVH
                                resultado.RegistrosCorruptos.Add("Error de integridad en la tabla " + nombreTabla +
                                                                 " en el registro " + tabla.Rows[row][0]);
                                resultado.EsValida = false;

                            }
                        }
                    }
                }
                //Valido el DVV
                if (resultado.EsValida)
                {
                    string dvvCalculado = CrearHash(todosLosDvh);
                    string dvvDeLaBase = bllDvv.Leer().ToArray()[0].Dvv;

                    if (dvvCalculado != dvvDeLaBase)
                        resultado.EsValida = false;
                }

            }
            catch (Exception ex)
            {

            }

            return resultado;
        }

        public static bool GrabarDvhDeTodalaBase()
        {
            bool retorno = true;
            BLL.Sistema bllSistema = new BLL.Sistema();

            try
            {
                //CALCULO DE TODOS LOS DVH
                //Obtengo todos los nombres de las tablas de la base de datos
                List<string> nombresDeTablas = bllSistema.ObtenerNombresDeTablas();

                foreach (string nombreTabla in nombresDeTablas)
                {
                    //Excepto la tabla del digito vertical, recorro todas
                    if (!nombreTabla.Equals("DVV"))
                    {
                        ActualizarDvhDeTabla(nombreTabla);
                    }
                }

                //Actualizo del DVV
                ActualizarDvv(nombresDeTablas);
            }
            catch (Exception ex)
            {
                retorno = false;

            }

            return retorno;
        }

        public static string ObtenerDvh(List<string> campos)
        {
            string cadenaDeCampos = null;

            foreach (string campo in campos)
            {
                cadenaDeCampos = cadenaDeCampos + campo;
            }

            return CrearHash(cadenaDeCampos);
        }

        private static string CalcularDvhDeFila(DataTable tabla, int row)
        {
            //Declaro un objeto string, para concatenar todos los campos de la tabla, excepto el ultimo que es el DVH
            string cadenaDeCampos = null;

            for (int columna = 0; columna <= tabla.Columns.Count - 2; columna++)
            {
                //Concateno las columnas
                cadenaDeCampos = cadenaDeCampos + tabla.Rows[row][columna];
            }

            //Calculo el DVH 
            string cadenaDvh = CrearHash(cadenaDeCampos);
            return cadenaDvh;
        }

        private static void ActualizarDvhDeTabla(string nombreTabla)
        {
            BLL.Sistema bllSistema = new BLL.Sistema();

            //Obtengo el contenido de la tabla actual
            DataTable tabla = bllSistema.LeerTablaPorNombre(nombreTabla);

            for (int row = 0; row <= tabla.Rows.Count - 1; row++)
            {
                string cadenaDvh = CalcularDvhDeFila(tabla, row);

                //Se lo asigno a la fila
                tabla.Rows[row]["DVH"] = cadenaDvh;
            }


            bllSistema.ActualizarTabla(nombreTabla, tabla);
        }

        private static void ActualizarDvv(List<string> nombresDeTablas)
        {
            string cadenadeDvh = null;
            BLL.Sistema bllSistema = new BLL.Sistema();

            foreach (string nombreTabla in nombresDeTablas)
            {
                //Excepto la tabla del digito vertical, recorro todas
                if (!nombreTabla.Equals("DVV"))
                {
                    //Obtengo todos los DVH de la tabla actual
                    DataTable dataTableDvh = bllSistema.LeerTablaPorNombreYColumnas(nombreTabla, "DVH");

                    for (int rows = 0; rows <= dataTableDvh.Rows.Count - 1; rows++)
                    {
                        //Concateno cada DVH 
                        cadenadeDvh = cadenadeDvh + dataTableDvh.Rows[rows][0];
                    }
                }
            }

            //Calculo el hash de todos los DVH
            string hashDvv = CrearHash(cadenadeDvh);

            BLL.DigitoVerificadorVertical bllDvv = new BLL.DigitoVerificadorVertical();
            BE.DigitoVerificadorVertical beDvv = new BE.DigitoVerificadorVertical { Dvv = hashDvv };

            //Actualizo el DVV
            bllDvv.Modificacion(beDvv);
        }

    }
}
