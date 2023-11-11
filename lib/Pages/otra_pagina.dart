import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:uno/Pages/pedidos_lista.dart';
import 'package:uno/services/firebase_services_cliente.dart';
import '../Cliente/cliente_tiendas.dart';
import '../models/global_var.dart';
import '../navbar.dart';

class otra_pagina extends StatefulWidget {
  const otra_pagina({super.key});
  @override
  State<otra_pagina> createState() => _Otra_pagina();
}

class _Otra_pagina extends State<otra_pagina> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          drawer: const NavBar(),
          appBar: AppBar(

            backgroundColor: const Color.fromRGBO(157, 160, 166, 1.0),
            foregroundColor: const Color.fromRGBO(255, 255, 255, 1.0),
            elevation: 0,
            //Inicio de carrito
            actions: <Widget>[
              Padding(
                padding: const EdgeInsets.only(right: 16.0, top: 8.0),

                child: GestureDetector(
                  child: Stack(
                    alignment: Alignment.topCenter,
                    children: <Widget>[
                      Icon(
                        Icons.shopping_cart_checkout,
                        size: 50,
                        color:Colors.white,
                      ),
                      FutureBuilder(
                          future: getContar(),
                          builder: (context,snapshot){
                            if(snapshot.hasData){
                              return Padding(
                                padding: const EdgeInsets.only(left: 2.0),
                                child: CircleAvatar(
                                  radius: 8.0,
                                  backgroundColor: Colors.red,
                                  foregroundColor: Colors.white,
                                  child: Text("${snapshot.data?.length}",
                                    style: TextStyle(
                                        fontSize: 13.0,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Raleway'),
                                  ),
                                ),
                              );
                            }else {
                            return const Center(
                            child: CircularProgressIndicator(),
                            );
                            }

                          })

                    ],
                  ),
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) =>Cart(),
                        ),
                    );
                  },
                ),
              ),
            ],
          ),
          body: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/img/listadoTiendasCliente.png"),
                      fit: BoxFit.cover)),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          decoration: const BoxDecoration(
                              color: Color.fromRGBO(255, 255, 255, 1.0),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50))),
                          child: IconButton(
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) =>ClienteListadoTiendas(),
                                ),
                              );
                            },
                            style: TextButton.styleFrom(
                                padding: const EdgeInsets.all(10),
                                backgroundColor:
                                    const Color.fromRGBO(255, 255, 255, 1.0)),
                            icon: const Icon(
                              Icons.arrow_back,
                              size: 25,
                            ),
                            tooltip: "Regresar",
                          ),
                        ),
                        Text(entidad ?? '...',
                            style: TextStyle(
                                color: Color.fromRGBO(0, 73, 150, 1.0),
                                fontWeight: FontWeight.w900,
                                fontSize: 25,)

                        ),
                        const SizedBox(
                          width: 25,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: Column(
                      children: [
                        const Text(
                          "Listado de productos",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w700,
                              fontSize: 15),
                        ),
                        listadoTiendas(),
                      ],
                    )

                  ),
                ],
              ),
            ),
          ),
        ));
  }

  Widget listadoTiendas() {
    return Container(
      child: FutureBuilder(
          future: getProductos(),
          builder: ((context, snapshot) {
            if (snapshot.hasData) {
              return GridView.builder(
                  physics: const ScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                  itemCount: snapshot.data?.length,
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {

                    return Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      color: Colors.white,
                      margin: EdgeInsets.all(10),
                      elevation: 10,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Expanded(
                              child: CachedNetworkImage(
                                imageUrl: '${snapshot.data?[index]['image']}',
                              ),
                            ),
                            Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    snapshot.data?[index]['name'] ??
                                        'Sin registro...',
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(fontSize: 14),
                                  ),
                                  Text(
                                    "\$ ${snapshot.data?[index]['price'].toStringAsFixed(2)}" ??
                                        'Sin registro...',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 15),
                                  ),
                                  Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Align(
                                        alignment: Alignment.bottomRight,
                                        child: InkWell(
                                          child: Icon(  Icons.add_shopping_cart_sharp,
                                            color: Colors.redAccent[100],
                                            size: 38,
                                          ),
                                          onTap: () {
                                            setState(() {
                                              var item = index;
                                              registroUsuario(
                                                  snapshot.data?[index]['name'],
                                                  snapshot.data?[index]['price'],
                                                  '${snapshot.data?[index]['image']}',item);

                                            });
                                          },

                                        ),
                                      ))
                                ])
                          ]),
                    );
                  });
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          })),
    );
  }

  final firebase = FirebaseFirestore.instance;


  registroUsuario(String nombre, precio, String imag, i) async {
    try {
      await firebase.collection('carrito').doc("${i}").set({"cliente":  ver.toString(),
        "producto": nombre,"precio":  precio, "imagen":  imag, "cantidad": quantity
      });
    } catch (e) {
      print('Error...' + e.toString());
    }
  }

}
