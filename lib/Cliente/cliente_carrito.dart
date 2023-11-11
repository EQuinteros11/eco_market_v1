import 'package:flutter/material.dart';
class ClienteCarrito extends StatefulWidget {
  const ClienteCarrito({super.key});

  @override
  State<ClienteCarrito> createState() => _ClienteCarritoState();
}

class _ClienteCarritoState extends State<ClienteCarrito> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Carrito Personal"),
      ),
    );
  }
}
