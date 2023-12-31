import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:uno/models/productos_model_line.dart';

import '../models/global_var.dart';

  FirebaseFirestore db = FirebaseFirestore.instance;

Future<List> getTiendas() async {
  List tiendas = [];
  CollectionReference collectionReferenceTiendas = db.collection('ctl_Tienda');
  collectionReferenceTiendas.orderBy('nombre', descending: true);

  QuerySnapshot queryTiendas = await collectionReferenceTiendas.get();
  queryTiendas.docs.forEach( ( tienda ) {
    tiendas.add( tienda.data() );
    print(tienda.data());
  });

  return tiendas;
}



Future<List> getProductos() async {
  List productos = [];
  final citiesRef = db.collection("productos");
  final query =citiesRef.where("negocio", isEqualTo: entidad);

  QuerySnapshot queryTiendas = await query.get();
  queryTiendas.docs.forEach( ( producto ) {
    productos.add( producto.data() );
    print(producto.data());
  });

  return productos;
}
Future<List> getCarrito() async {
  await Future.delayed(const Duration(seconds: 1));
  List carro = [];
  final citiesRef = db.collection("carrito");
  final query =citiesRef.where("cliente", isEqualTo: ver);

  QuerySnapshot queryTiendas = await query.get();
  queryTiendas.docs.forEach( ( carrito ) {
    carro.add( carrito.data() );
  });
  return carro;
}

Future<List> getContar() async{
  List carro = [];
  final contar =db.collection("carrito");
  final CountCar = contar.where("cliente", isEqualTo: ver);
  QuerySnapshot queryTiendas = await CountCar.get();
  queryTiendas.docs.forEach( ( carrito ) {
    carro.add( carrito.data());
  });
  return carro;
}

Future<List> getCategorias() async {
  List categorias = [];
  CollectionReference collectionReferenceTiendas = db.collection('categoria');
  collectionReferenceTiendas.orderBy('Nombre', descending: true);

  QuerySnapshot queryTiendas = await collectionReferenceTiendas.get();
  queryTiendas.docs.forEach( ( categoria ) {
    categorias.add( categoria.data() );
  });

  return categorias;
}

Future<List> getCategorias2() async {
  List categorias = [];
  CollectionReference collectionReferenceTiendas = db.collection('ctl_Tienda');
  collectionReferenceTiendas.orderBy('categoria', descending: true);

  QuerySnapshot queryCategorias = await collectionReferenceTiendas.get();
  queryCategorias.docs.forEach( ( categoria ) {
    categorias.add({categoria.get("categoria")});
    // print(categoria.get("categoria").toString());
  });

  print(categorias);
  return categorias;
}