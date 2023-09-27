using Helpers;
using System.Collections.Generic;

namespace DAL.Interfaces
{
    public interface IABM
    {
        ResultadoBd Insertar(object pObjeto);

        ResultadoBd Actualizar(object pObjeto);

        ResultadoBd Eliminar(object pObjeto);

        List<object> Obtener();

        object ObtenerEntidadPorId(int pId);

    }
}
