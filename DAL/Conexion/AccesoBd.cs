using Helpers;
using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace DAL.Conexion
{
    public class AccesoBd
    {

        private readonly SqlConnection _conexion = new SqlConnection();
        public void AbrirConexion()
        {
            _conexion.ConnectionString = ConfigurationManager.ConnectionStrings["ConnString"].ConnectionString;
            _conexion.Open();

        }

        public void CerrarConexion()
        {
            _conexion.Close();
        }

        public ResultadoBd Actualizar(string nombreTabla, DataTable dataTable)
        {
            try
            {
                SqlDataAdapter dataAdapter = new SqlDataAdapter("SELECT * FROM " + nombreTabla, _conexion);
                SqlCommandBuilder commandBuilder = new SqlCommandBuilder(dataAdapter);

                dataAdapter.InsertCommand = commandBuilder.GetInsertCommand();
                dataAdapter.DeleteCommand = commandBuilder.GetDeleteCommand();
                dataAdapter.UpdateCommand = commandBuilder.GetUpdateCommand();
                dataAdapter.Update(dataTable);

                CerrarConexion();

                return ResultadoBd.OK;
            }
            catch (Exception e)
            {
                CerrarConexion();

                return ResultadoBd.ERROR;
            }

        }

        public ResultadoBd Escribir(string nombre, IDbDataParameter[] parametros = null)
        {
            try
            {
                SqlCommand cmd = new SqlCommand
                {
                    CommandText = nombre,
                    CommandType = CommandType.StoredProcedure,
                    Connection = _conexion

                };

                if (parametros != null)
                    cmd.Parameters.AddRange(parametros);

                AbrirConexion();

                int fa = cmd.ExecuteNonQuery();

                CerrarConexion();

                if (fa >= 1)
                    return ResultadoBd.OK;

                return ResultadoBd.ERROR;

            }
            catch (Exception ex)
            {
                CerrarConexion();
                return ResultadoBd.ERROR;
            }

        }

        public ResultadoBd EjecutarQuery(string query)
        {
            try
            {
                SqlCommand cmd = new SqlCommand
                {
                    CommandText = query,
                    CommandType = CommandType.Text,
                    Connection = _conexion

                };


                AbrirConexion();

                int fa = cmd.ExecuteNonQuery();

                CerrarConexion();

                if (fa >= 1)
                    return ResultadoBd.OK;

                return ResultadoBd.ERROR;

            }
            catch (Exception ex)
            {
                CerrarConexion();
                return ResultadoBd.ERROR;
            }

        }

        public int EscribirConRetornoDeValor(string nombre, string nombreDelParamDeRet, IDbDataParameter[] parametros = null)
        {
            try
            {
                SqlCommand cmd = new SqlCommand
                {
                    CommandText = nombre,
                    CommandType = CommandType.StoredProcedure,
                    Connection = _conexion

                };


                if (parametros != null)
                    cmd.Parameters.AddRange(parametros);

                AbrirConexion();

                cmd.ExecuteNonQuery();

                CerrarConexion();

                return Convert.ToInt32(cmd.Parameters[5].Value);

            }
            catch (Exception ex)
            {
                CerrarConexion();
                return -1;

            }
        }

        public DataTable Leer(string nombre, IDbDataParameter[] parametros = null)
        {
            try
            {
                var tabla = new DataTable();
                var da = new SqlDataAdapter
                {
                    SelectCommand = new SqlCommand
                    {
                        CommandType = CommandType.StoredProcedure,
                        CommandText = nombre,
                        Connection = _conexion
                    }

                };

                if (parametros != null)
                    da.SelectCommand.Parameters.AddRange(parametros);


                AbrirConexion();
                da.Fill(tabla);
                CerrarConexion();

                return tabla;

            }
            catch (Exception ex)
            {
                CerrarConexion();
                return null;

            }

        }

        public IDbDataParameter CrearParametro(string nombre, int valor)
        {
            var param = new SqlParameter
            {
                ParameterName = nombre,
                DbType = DbType.Int32,
                Value = valor
            };

            return param;
        }

        public IDbDataParameter CrearParametro(string nombre, float valor)
        {
            var param = new SqlParameter
            {
                ParameterName = nombre,
                DbType = DbType.Single,
                Value = valor
            };

            return param;
        }

        public IDbDataParameter CrearParametro(string nombre, string valor)
        {
            var param = new SqlParameter
            {
                ParameterName = nombre,
                DbType = DbType.String,
                Value = valor
            };

            return param;
        }

        public IDbDataParameter CrearParametro(string nombre, DateTime valor)
        {
            var param = new SqlParameter
            {
                ParameterName = nombre,
                DbType = DbType.DateTime,
                Value = valor
            };

            return param;
        }

        public IDbDataParameter CrearParametro(string nombre, DateTime? valor)
        {
            var param = new SqlParameter
            {
                ParameterName = nombre,
                DbType = DbType.DateTime,
                Value = valor
            };

            return param;
        }

        public IDbDataParameter CrearParametro(string nombre, Byte valor)
        {
            var param = new SqlParameter
            {
                ParameterName = nombre,
                DbType = DbType.Byte,
                Value = valor
            };

            return param;
        }

        public IDbDataParameter CrearParametroDeRetorno(string nombre, int valor)
        {
            var param = new SqlParameter
            {
                ParameterName = nombre,
                DbType = DbType.Int32,
                Value = valor,
                Direction = ParameterDirection.Output
            };

            return param;
        }

        public IDbDataParameter CrearParametro(string nombre, bool valor)
        {
            var param = new SqlParameter
            {
                ParameterName = nombre,
                DbType = DbType.Boolean,
                Value = valor
            };

            return param;
        }

    }
}
