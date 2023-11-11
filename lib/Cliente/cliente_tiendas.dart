import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:uno/models/global_var.dart';
import 'package:uno/services/firebase_services_cliente.dart';

import '../Pages/otra_pagina.dart';
import '../models/productos_model.dart';
import '../navbar.dart';

class ClienteListadoTiendas extends StatefulWidget {
  const ClienteListadoTiendas({super.key});

  @override
  State<ClienteListadoTiendas> createState() => _ClienteListadoTiendasState();
}

class _ClienteListadoTiendasState extends State<ClienteListadoTiendas> {

  @override
  void initState(){
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: NavBar(),
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(157, 160, 166, 1.0),
          foregroundColor: const Color.fromRGBO(65, 90, 119, 1.0),
        ),
        body: Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/imagenescliente/VistaPrincipal.png"),
                    fit: BoxFit.cover
                )
            ),
            child:_cuadroEmpresa()
        )
    );
  }
  Widget _cuadroEmpresa(){
    return Container(
      child: FutureBuilder(
        future: getTiendas(),
        builder: ((context, snapshot){
            if (snapshot.hasData) {
              return GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1),
                  itemCount:  snapshot.data?.length,
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemBuilder: (context, index){

                    return GestureDetector(
                      onTap: (){
                        entidad = snapshot.data?[index]['nombre'];
                        Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context)=>otra_pagina(),
                            )
                        );
                      },


                      child: Card(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0),),
                        color: Colors.transparent,
                        margin: EdgeInsets.all(10),
                        elevation: 10,
                        child: Stack(
                          fit: StackFit.loose,
                          alignment: Alignment.center,
                          children: <Widget>[
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Align( alignment:  Alignment.topRight,
                                  child: Icon(Icons.star, size: 35, color: Colors.deepOrange.shade700,),
                                ),
                                Expanded(
                                  child: CachedNetworkImage(
                                    imageUrl: '${snapshot.data?[index]['img']}',
                                  ),
                                ),

                                Container(
                                  width: 600,
                                  decoration: BoxDecoration(
                                      border: Border.all(width: 5, color: Colors.white),
                                      color: Colors.lightBlueAccent.shade100,
                                      borderRadius: BorderRadius.all(Radius.circular(50))
                                  ),

                                  padding: EdgeInsets.only(left: 100, right: 100, top: 15,bottom: 15),
                                  child: Column(
                                    children: [
                                      Text("${snapshot.data?[index]['nombre']}",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(fontSize: 25.0,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w900,
                                        fontFamily: 'Raleway'),
                                        ),
                                      Text("${snapshot.data?[index]['direccion']}",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(fontSize: 10.0,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w900,
                                            fontFamily: 'Raleway'),
                                      ),
                                    ],
                                  )
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  }
              );

            }
            else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

        })
      ),
    );

  }

}

