import '../../models/pedido.dart';
import '../../models/producto.dart';

abstract class PedidoFactory {
  // FACTORY METHOD
  // Define el método de creación que las fábricas concretas
  // implementarán para crear un tipo específico de pedido.
  Pedido crearPedido({
    required String id,
    required String cliente,
    required List<Producto> productos,
  });
}