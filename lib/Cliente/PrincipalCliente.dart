
import 'package:flutter/material.dart';
import 'package:uno/Cliente/cliente_buscar_producto.dart';
import 'package:uno/Cliente/cliente_carrito.dart';
import 'package:uno/Cliente/cliente_categorias.dart';
import 'package:uno/Cliente/cliente_ofertas.dart';
import 'package:uno/Cliente/cliente_recomendaciones.dart';
import 'package:uno/Cliente/cliente_tiendas.dart';
import 'package:uno/Cliente/inicio_sesion_cliente.dart';
import 'package:uno/Pages/pedidos_lista.dart';
import 'package:uno/inicio_sesion_vendedor.dart';
import 'package:uno/navbar.dart';
import 'package:uno/seleccion_creacion_tipo_cuenta.dart';
import 'package:uno/vista_principal.dart';

import '../models/global_var.dart';

class VistaPrincipalCliente extends StatefulWidget {
  const VistaPrincipalCliente({super.key});

  @override
  State<VistaPrincipalCliente> createState() => _VistaPrincipalClienteState();
}



class _VistaPrincipalClienteState extends State<VistaPrincipalCliente> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        drawer: const NavBar(),
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(157, 160, 166, 1.0),
          foregroundColor: const Color.fromRGBO(65, 90, 119, 1.0),
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              // Hero
              Container(
                height: 165,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                  image: AssetImage("assets/img/vistaPrincipal.png"),
                    fit: BoxFit.cover
                  ),

                ),
                child: Container(
                  padding: const EdgeInsets.symmetric( vertical: 25, horizontal: 15 ),
                  child: Column(
                    children: <Widget> [
                      /*
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                margin: const EdgeInsets.only( top: 25),
                                  child: IconButton(
                                    onPressed: (){},
                                    icon: const Icon(Icons.menu,
                                      color: Color.fromRGBO(65, 90, 119, 1.0),
                                      size: 35,
                                    ),
                                    tooltip: "Menú",
                                )
                              ),
                            ],
                          ),
                        ],
                      ),

                      */
                      Column(
                        children: [
                          Row(
                            children: <Widget> [
                              Container(
                                padding: const EdgeInsets.all(10),
                                margin: const EdgeInsets.only(right: 10),
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(Radius.circular(50)),
                                  color: const Color.fromRGBO(73, 80, 91, 1.0),
                                  border: Border.all(
                                      color: const Color.fromRGBO(217, 217, 217, 1.0),
                                      width: 3
                                  ),
                                ),
                                child: const Icon(
                                  Icons.person,
                                  size: 60,
                                  color: Color.fromRGBO(217, 217, 217, 1.0),
                                ),
                              ),

                              Container(
                                child: Column(
                                  children: [
                                    const Row(
                                      children: [
                                        Text("Bienvenido",
                                          style: TextStyle(
                                            color: Color.fromRGBO(255, 255, 255, 1.0),
                                            fontWeight: FontWeight.w600,
                                            fontSize: 25,
                                          ),
                                        ),
                                      ],
                                    ),

                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.symmetric( vertical: 0, horizontal: 45),
                                          decoration: const BoxDecoration(
                                            borderRadius: BorderRadius.all(Radius.circular(30)),
                                            color: Color.fromRGBO(255, 255, 255, 1.0),
                                          ),
                                          child:  Text(ver,
                                            style: const TextStyle(
                                                color: Color.fromRGBO(63, 61, 86, 1.0),
                                                fontWeight: FontWeight.w700,
                                                fontSize: 18
                                            ),
                                          ) ,
                                        )
                                      ],
                                    )



                                  ],
                                ),
                              ),

                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

              ),

              //Contenido Principal
              Container(
                child: Column(
                  children: <Widget> [
                    Container(
                      padding: const EdgeInsets.symmetric( vertical: 20, horizontal: 5 ),
                      margin: const EdgeInsets.only( left: 20 ),
                      child: Column(
                        children: <Widget> [
                          const Row(
                            children: [
                             Text("Mas opciones",
                               style: TextStyle(
                                 color: Color.fromRGBO(197, 172, 150, 1.0),
                                 fontSize: 27,
                                 fontWeight: FontWeight.w700
                               ),
                             ),
                           ],
                         ),

                         const Row(
                           children: [
                             Text("Los mejores productos",
                               style: TextStyle(
                                   color: Color.fromRGBO(197, 172, 150, 1.0),
                                   fontSize: 27,
                                   fontWeight: FontWeight.w700
                               ),
                             ),
                           ],
                         ),

                         SizedBox(
                          height: 10,
                         ),

                         Row(
                           children: [
                             Container(
                               padding: const EdgeInsets.symmetric( horizontal: 10, vertical: 5 ),
                               decoration: const BoxDecoration(
                                 borderRadius: BorderRadius.all(Radius.circular(20)),
                                 color: Color.fromRGBO(197, 172, 150, 1.0),
                               ),
                               child: const Text( "El mejor precio",
                                 style: TextStyle(
                                   color: Color.fromRGBO(255, 255, 255, 1.0),
                                   fontWeight: FontWeight.w700,
                                   fontSize: 27
                                 ),
                               ),
                             ),
                           ],
                         )
                       ],
                     ),
                    ),
                    Container(
                      margin: const EdgeInsets.only( top: 10 ),
                      child: const Column(
                        children: <Widget> [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget> [
                              Column(
                                children: <Widget> [
                                  Row(
                                    children: [
                                      Text("Mis\nOpciones",
                                        style: TextStyle(
                                          color: Color.fromRGBO(65, 90, 119, 1.0),
                                          fontWeight: FontWeight.w700,
                                          fontSize: 30,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Image(
                                  image: AssetImage("assets/img/vistaPrincipalMisOpciones.png")
                              )

                            ],
                          )
                        ],
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.only( top: 15, left: 15, right: 15 ),
                      padding: const EdgeInsets.symmetric( vertical: 15 ),
                      decoration: const BoxDecoration(
                        color: Color.fromRGBO(241, 241, 241, 1.0),
                        borderRadius: BorderRadius.all(Radius.circular(10))
                      ),
                      child: Column(
                        children: <Widget> [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget> [
                                Boton(
                                  "Buscar",
                                  const Icon(
                                    Icons.search,
                                    color: Color.fromRGBO( 106, 198, 242, 1.0),
                                    size: 35,
                                  ),
                                  context,
                                    const ClienteBuscarProducto()
                                ),
                                Boton(
                                  // Nombre de boton
                                  "Mi carrito",
                                  // icono
                                  const Icon(
                                    Icons.shopping_cart,
                                  color: Color.fromRGBO( 106, 198, 242, 1.0),
                                  size: 35,
                                  ),
                                  // Contexto
                                  context,
                                  // Redireccionamiento
                                  Cart()
                                )
                              ]
                          ),


                          const SizedBox(
                            height: 15,
                          ),


                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget> [
                                Boton(
                                  "Recomendados",
                                  const Icon(
                                    Icons.list_alt,
                                    color: Color.fromRGBO( 106, 198, 242, 1.0),
                                    size: 35,
                                  ),
                                  context,
                                  const ClienteRecomendacion()
                                ),
                                Boton(
                                  "Ofertas",
                                    const Icon(
                                      Icons.sell,
                                      color: Color.fromRGBO( 106, 198, 242, 1.0),
                                      size: 35,
                                    ),
                                  context,
                                  const ClienteOfertas()
                                ),
                              ]
                          ),

                          const SizedBox(
                            height: 15,
                          ),


                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget> [
                                Boton(
                                  "Categorias",
                                    const Icon(
                                      Icons.category,
                                      color: Color.fromRGBO( 106, 198, 242, 1.0),
                                      size: 35,
                                    ),
                                  context,
                                    const ClienteCategorias()
                                ),
                                Boton(
                                  "Tiendas",
                                  const Icon(
                                    Icons.store_mall_directory,
                                    color: Color.fromRGBO( 106, 198, 242, 1.0),
                                    size: 35,
                                  ),
                                  context,
                                    const ClienteListadoTiendas()
                                )
                              ]
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        )
      ),
    );
  }
}

Widget Botones() {
  return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount (
          crossAxisCount: 3,
          crossAxisSpacing: 15,
          mainAxisSpacing: 15
      ),
      itemCount: 1,
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemBuilder: ( context, index ){
        return Container(
        );
      }
  );
}

Widget Boton( String text, Icon icon, BuildContext context, Widget route ){
  return Container(
    width: 160,
    decoration: BoxDecoration(
      color: Colors.transparent,
      borderRadius: const BorderRadius.all(
          Radius.circular(15)
      ),
      border: Border.all(
          color: const Color.fromRGBO(106, 198, 242, 1.0),
          width: 2
      )
    ),
    child: OutlinedButton(
          onPressed: (){
            Navigator.push(
              context,
              MaterialPageRoute( builder: (context) => route ),
            );
          },
          style: TextButton.styleFrom(
            backgroundColor: Colors.transparent,
            padding: const EdgeInsets.symmetric( vertical: 10 ),
            side: const BorderSide(
              color: Colors.transparent,
            ),
          ),
          child: Column(
            children: <Widget> [
              icon,
              Text( text,
                  style: const TextStyle(
                    color: Color.fromRGBO(65, 90, 119, 1.0),
                    fontSize: 16,
                    fontWeight: FontWeight.w700
                  ),
              )
            ],
          )
    ),
  );
}