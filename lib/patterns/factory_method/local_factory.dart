import '../../models/pedido.dart';
import '../../models/producto.dart';
import '../../models/pedido_local.dart';
import 'pedido_factory.dart';

class LocalFactory implements PedidoFactory {
  @override
  Pedido crearPedido({
    required String id,
    required String cliente,
    required List<Producto> productos,
  }) {
    return PedidoLocal(
      id: id,
      cliente: cliente,
      productos: productos,
    );
  }
}