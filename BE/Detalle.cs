namespace BE
{
    public class Detalle
    {
        public int IdFactura { get; set; }

        public Producto Producto { get; set; }

        public int Cantidad { get; set; }

        public float PrecioUnitario { get; set; }

    }
}
