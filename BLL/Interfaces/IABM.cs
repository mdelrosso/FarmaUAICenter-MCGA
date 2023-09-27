using Helpers;

namespace BLL.Interfaces
{
    public interface IABM
    {
        ResultadoBd Alta(object pObjeto);

        ResultadoBd Modificacion(object pObjeto);

        ResultadoBd Baja(object pObjeto);

        //List<object> Leer();

        //object ObtenerEntidadPorId(int pId);

        //List<object> ObtenerEntidad(object pObjeto);
    }
}
