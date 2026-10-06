import 'pedido.dart';

class PedidoLocal extends Pedido {
  PedidoLocal({
    required super.id,
    required super.cliente,
    required super.productos,
  }) : super(tipo: 'Para llevar');
}