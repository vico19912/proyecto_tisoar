class Producto {
  final String nombre;
  final double precio;
  int cantidad;

  Producto({
    required this.nombre,
    required this.precio,
    this.cantidad = 0,
  });

  void incrementarCantidad() {
    cantidad++;
  }

  void decrementarCantidad() {
    if (cantidad > 0) {
      cantidad--;
    }
  }
}
