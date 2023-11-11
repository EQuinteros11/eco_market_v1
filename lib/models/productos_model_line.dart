import 'package:cloud_firestore/cloud_firestore.dart';

class City {
  late final int? cantidad;
  final String? cliente;
  final String? imagen;
  final double? precio;
  final String? producto;

  City({
    this.cantidad,
    this.cliente,
    this.imagen,
    this.precio,
    this.producto,
  });

  factory City.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options,
      ) {
    final data = snapshot.data();
    return City(
      cantidad: data?['cantidad'],
      cliente: data?['cliente'],
      imagen: data?['imagen'],
      precio: data?['precio'],
      producto: data?['producto'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (cantidad != null) "cantidad": cantidad,
      if (cliente != null) "cliente": cliente,
      if (imagen != null) "imagen": imagen,
      if (precio != null) "precio": precio,
      if (producto != null) "producto": producto,
    };
  }
}
