import 'producto.dart';

class Pedido {
  final String id;
  final String cliente;
  final List<Producto> productos;
  final String tipo;

  Pedido({
    required this.id,
    required this.cliente,
    required this.productos,
    required this.tipo,
  });

  double get total {
    return productos.fold(
      0,
      (suma, producto) => suma + producto.precio,
    );
  }
}