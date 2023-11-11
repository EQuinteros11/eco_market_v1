import 'package:flutter/material.dart';
import 'package:uno/Cliente/creacion_cuenta_cliente.dart';
import 'package:uno/creacion_cuenta_vendedor.dart';

class Creacion_Cuenta extends StatefulWidget {
  const Creacion_Cuenta({super.key});

  @override
  State<Creacion_Cuenta> createState() => _Creacion_CuentaState();
}

class _Creacion_CuentaState extends State<Creacion_Cuenta> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/img/tipoCuenta.png"),
              fit: BoxFit.cover
          )
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.only( top: 50, left: 20, right: 20),
            width: MediaQuery.of(context).size.width,
            child: Stack(
              children: [
                Column(
                  children: <Widget>[
                    // Flecha de Regresar
                    Row(
                      children: <Widget> [
                        IconButton(
                          onPressed: (){
                            Navigator.pop(context);
                          },
                          style: TextButton.styleFrom(
                              padding: const EdgeInsets.all(10),
                              backgroundColor: const Color.fromRGBO(255, 255, 255, 1.0)
                          ),
                          icon: const Icon(Icons.arrow_back),
                          tooltip: "Regresar",
                        ),

                        // Espacio entre elementos

                      ],
                    ),

                    // Banner de CREAR CUENTA
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          margin: const EdgeInsets.only(top: 20),
                          padding: const EdgeInsets.only(top: 5, bottom: 5, left: 25, right: 25),
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            color: Color.fromRGBO(255, 255, 255, 1.0),
                          ),
                          child: const Stack(
                            children: <Widget>[

                              Text("Tipo de Cuenta",
                                style: TextStyle(
                                    fontSize: 30,
                                    color: Color.fromRGBO(73, 80, 91, 1.0),
                                    fontWeight: FontWeight.w600
                                ),)
                            ],
                          ),
                        )
                      ],
                    ),

                    // Formulario de Creacion
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          margin: const EdgeInsets.only(top: 20),
                          // FORMULARIO
                          child: const Stack(
                            children: <Widget>[
                              Text("Seleccione el tipo de cuenta que deseas crear",
                                style: TextStyle(
                                  color: Color.fromRGBO(255, 255, 255, 1.0),
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                ),
                                textAlign: TextAlign.center,),
                            ],
                          ),
                        )
                      ],
                    ),

                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        // Contenedor Principal
                        Container(
                          margin: const EdgeInsets.only(top: 10),
                          padding: const EdgeInsets.all(20),
                          decoration: const BoxDecoration(
                            color: Color.fromRGBO(114, 114, 114, 0.5),
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),

                          child: Stack(
                            children: <Widget>[
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.only(top: 5, bottom: 5),
                                    decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.all(Radius.circular(30)),
                                      color: Color.fromRGBO(251, 174, 39, 1.0),
                                    ),
                                    child: const Stack(
                                      children: [
                                        Text("  Cuenta para cliente  ",
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w500,
                                              color: Color.fromRGBO(255, 255, 255, 1.0)
                                          ),)
                                      ],
                                    ),
                                  ),

                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Container(
                                        margin: const EdgeInsets.only(top: 10),
                                        // Crear Cuenta Cliente
                                        child: Column(
                                          children: <Widget>[
                                            const Text("Accede a un gran catálogo de productos disponibles y compra rápido y de manera sencilla",
                                              style: TextStyle(
                                                color: Color.fromRGBO(255, 255, 255, 1.0),
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500,
                                              ),
                                              textAlign: TextAlign.center,
                                            ),

                                            // Espaciado entre elementos
                                            const SizedBox( height: 5 ),

                                            FilledButton(
                                                onPressed: (){
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(builder: (context) => RegistroCliente())
                                                  );
                                                },
                                                style: TextButton.styleFrom(
                                                  padding: const EdgeInsets.only( top: 10, bottom: 10, left: 25, right: 25 ),
                                                  backgroundColor: Color.fromRGBO(65, 90, 119, 1.0),
                                                ),
                                                child: const Text("Crear cuenta",
                                                  style: TextStyle(
                                                      color: Color.fromRGBO(255, 255, 255, 1.0),
                                                      fontWeight: FontWeight.w500,
                                                      fontSize: 16
                                                  ),))
                                          ],

                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),

                    // Espaciado entre elementos
                    SizedBox(height: 10,),

                    // Crear cuenta para Vendedor
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        // Contenedor Principal
                        Container(
                          margin: const EdgeInsets.only(top: 10),
                          padding: const EdgeInsets.all(20),
                          decoration: const BoxDecoration(
                            color: Color.fromRGBO(114, 114, 114, 0.5),
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),

                          child: Stack(
                            children: <Widget>[
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.only(top: 5, bottom: 5),
                                    decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.all(Radius.circular(30)),
                                        color: Color.fromRGBO(224, 175, 160, 1.0)
                                    ),
                                    child: const Stack(
                                      children: [
                                        Text("  Cuenta para Vendedor  ",
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w500,
                                              color: Color.fromRGBO(225, 255, 255, 1.0)
                                          ),)
                                      ],
                                    ),
                                  ),

                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Container(
                                        margin: const EdgeInsets.only(top: 10),
                                        // Crear Cuenta Cliente
                                        child: Column(
                                          children: <Widget>[
                                            const Text("Accede a un gran catálogo de productos disponibles y compra rápido y de manera sencilla",
                                              style: TextStyle(
                                                color: Color.fromRGBO(255, 255, 255, 1.0),
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500,
                                              ),
                                              textAlign: TextAlign.center,
                                            ),

                                            // Espaciado entre elementos
                                            const SizedBox( height: 5 ),

                                            FilledButton(
                                                onPressed: (){
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(builder: (context) => const CreacionCuentaVendedor()));
                                                },
                                                style: TextButton.styleFrom(
                                                  padding: const EdgeInsets.only( top: 10, bottom: 10, left: 25, right: 25 ),
                                                  backgroundColor: Color.fromRGBO(65, 90, 119, 1.0),
                                                ),
                                                child: const Text("Crear cuenta",
                                                  style: TextStyle(
                                                      color: Color.fromRGBO(255, 255, 255, 1.0),
                                                      fontWeight: FontWeight.w500,
                                                      fontSize: 16
                                                  ),))
                                          ],

                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ],
            ),

          ),
        ),
      ),
    );
  }
}
