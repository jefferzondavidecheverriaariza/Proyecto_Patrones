import 'package:flutter/material.dart';

import 'models/pedido.dart';
import 'models/producto.dart';
import 'patterns/factory_method/domicilio_factory.dart';
import 'patterns/factory_method/local_factory.dart';

void main() {
  runApp(const PatronesApp());
}

class PatronesApp extends StatelessWidget {
  const PatronesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Patrones de Diseño',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Pedido? pedidoCreado;

  final List<Producto> productos = [
    Producto(nombre: 'Hamburguesa', precio: 18000),
    Producto(nombre: 'Gaseosa', precio: 5000),
  ];

  void crearPedidoDomicilio() {
    // FACTORY METHOD:
    // Utilizamos una fábrica concreta para crear
    // un PedidoDomicilio sin instanciarlo directamente aquí.
    final factory = DomicilioFactory();

    setState(() {
      pedidoCreado = factory.crearPedido(
        id: '001',
        cliente: 'Jeffer',
        productos: productos,
      );
    });
  }

  void crearPedidoLocal() {
    // FACTORY METHOD:
    // Otra fábrica concreta crea un tipo diferente de Pedido.
    final factory = LocalFactory();

    setState(() {
      pedidoCreado = factory.crearPedido(
        id: '002',
        cliente: 'Jeffer',
        productos: productos,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Mini proyecto - Patrones')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Factory Method',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),

            const Text(
              'Crear diferentes tipos de pedidos utilizando fábricas.',
            ),

            const SizedBox(height: 30),

            ElevatedButton(
              onPressed: crearPedidoDomicilio,
              child: const Text('Crear pedido a domicilio'),
            ),

            ElevatedButton(
              onPressed: crearPedidoLocal,
              child: const Text('Crear pedido para llevar'),
            ),

            const SizedBox(height: 30),

            if (pedidoCreado != null)
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Pedido creado',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text('ID: ${pedidoCreado!.id}'),
                      Text('Cliente: ${pedidoCreado!.cliente}'),
                      Text('Tipo: ${pedidoCreado!.tipo}'),
                      Text('Total: \$${pedidoCreado!.total}'),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
