import 'pedido.dart';

class PedidoDomicilio extends Pedido {
  PedidoDomicilio({
    required super.id,
    required super.cliente,
    required super.productos,
  }) : super(tipo: 'Domicilio');
}