import 'package:flutter/material.dart';
 class ClienteBuscarProducto extends StatefulWidget {
   const ClienteBuscarProducto({super.key});

   @override
   State<ClienteBuscarProducto> createState() => _ClienteBuscarProductoState();
 }

 class _ClienteBuscarProductoState extends State<ClienteBuscarProducto> {
   @override
   Widget build(BuildContext context) {
     return const Scaffold(
       body: Center(
         child: Text("Buscar Producto"),
       ),
     );
   }
 }
