import 'package:flutter/material.dart';
import 'package:uno/Cliente/cliente_tiendas.dart';

import '../navbar.dart';
import '../services/firebase_services_cliente.dart';
import 'cliente_recomendaciones_detalle.dart';

class ClienteCategorias extends StatefulWidget {
  const ClienteCategorias({super.key});

  @override
  State<ClienteCategorias> createState() => _ClienteCategoriasState();
}

class _ClienteCategoriasState extends State<ClienteCategorias> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavBar(),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(157, 160, 166, 1.0),
        foregroundColor: const Color.fromRGBO(255, 255, 255, 1.0),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric( horizontal: 15, vertical: 5 ),
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/img/listadoTiendasCliente.png"),
                  fit: BoxFit.cover
              )
          ),
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
                          borderRadius: BorderRadius.all( Radius.circular( 50 ) )
                      ),
                      child: IconButton(
                        onPressed: (){
                          Navigator.pop(context);
                        },
                        style: TextButton.styleFrom(
                            padding: const EdgeInsets.all(10),
                            backgroundColor: const Color.fromRGBO(255, 255, 255, 1.0)
                        ),
                        icon: const Icon(
                          Icons.arrow_back,
                          size: 25,
                        ),
                        tooltip: "Regresar",
                      ),
                    ),
                    const Text("Categorias",
                      style: TextStyle(
                          color: Color.fromRGBO(255, 255, 255, 1.0),
                          fontWeight: FontWeight.w700,
                          fontSize: 25
                      ),
                    ),
                    const SizedBox(
                      width: 25,
                    ),
                  ],
                ),
              ),
              Container(
                  padding: const EdgeInsets.symmetric( vertical: 15 ),
                  child: const Text("Seleccione la categoría que desea visualizar",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700
                    ),

                  )
              ),
              Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                padding: const EdgeInsets.only(left: 15, right: 5),
                margin: const EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Expanded(
                          child: TextField(
                            style: TextStyle(
                                color: Color.fromRGBO(51, 51, 51, 1.0),
                                fontSize: 18
                            ),
                            decoration: InputDecoration(
                              labelText: "Buscar...",
                              hintText: "Celulares",
                              contentPadding: EdgeInsets.symmetric(vertical: 5.0),
                              border: InputBorder.none,
                              hintStyle: TextStyle(
                                color: Color.fromRGBO(51, 51, 51, 1.0),
                              ),
                              labelStyle: TextStyle(
                                color: Color.fromRGBO(51, 51, 51, 1.0),
                              ),
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: (){},
                          icon: Icon(Icons.search),
                          iconSize: 30,
                          tooltip: "Buscar",
                        )
                      ],
                    )
                  ],
                ),
              ),
              Container(
                child: listadoTiendas(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget listadoTiendas() {
  return Container(
    child: FutureBuilder(
        future: getCategorias(),
        builder: (( context, snapshot ) {
          if ( snapshot.hasData ){
            return GridView.builder(
                physics: const ScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount (
                  crossAxisCount: 2,
                  childAspectRatio: 1,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 5,
                ),
                itemCount: snapshot.data?.length,
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemBuilder: ( context, index ){
                  return InkWell(
                    onTap: (){
                      String nombree = snapshot.data?[index]['Nombre'] ?? 'dfvvf';
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const ClienteListadoTiendas() ));
                    },
                    child: Card(
                      clipBehavior: Clip.none,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              Container(
                                alignment: Alignment.center,
                                width: 110,
                                height: 110,
                                child: Image.network( snapshot.data?[index]['image'],
                                  height: 110,
                                  width: 110,
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric( horizontal: 15, vertical: 0 ),
                                  child: Column(
                                    children: [
                                      Text( snapshot.data?[index]['Nombre'] ?? 'Sin registro...',
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 21,

                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                }
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        })
    ),
  );
}