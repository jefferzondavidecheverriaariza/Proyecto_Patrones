import '../../models/pedido.dart';
import '../../models/producto.dart';
import '../../models/pedido_domicilio.dart';
import 'pedido_factory.dart';

class DomicilioFactory implements PedidoFactory {
  @override
  Pedido crearPedido({
    required String id,
    required String cliente,
    required List<Producto> productos,
  }) {
    return PedidoDomicilio(
      id: id,
      cliente: cliente,
      productos: productos,
    );
  }
}