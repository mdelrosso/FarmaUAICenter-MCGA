namespace BE
{
    public class Producto
    {
        public int IdProducto { get; set; }

        public Proveedor Proveedor { get; set; }

        public string Nombre { get; set; }

        public string Descripcion { get; set; }

        public float Precio { get; set; }

        public decimal Descuento { get; set; }

    }
}