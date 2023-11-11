import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:uno/Cliente/inicio_sesion_cliente.dart';
import 'package:uno/Cliente/creacion_cuenta_cliente.dart';
import 'package:uno/seleccion_creacion_tipo_cuenta.dart';


class VistaPrincipal extends StatefulWidget {
  const VistaPrincipal({super.key});

  @override
  State<VistaPrincipal> createState() => _VistaPrincipalState();
}

class _VistaPrincipalState extends State<VistaPrincipal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // APPBAR
/*
      appBar: AppBar(
        title: const Text("Este es mi menu :)"),
        backgroundColor: const Color.fromRGBO(194, 100, 100, 1.0),
        actions: <Widget> [
          IconButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Holis Wapo")));
              },
            icon: const Icon(Icons.menu, size: 35),
            color: const Color.fromRGBO(255, 255, 255, 1),
            tooltip: 'Muestra un mensaje',
          )
        ],
      ),
*/
      // CONTENIDO DE LA VISTA
      //Contenedor Principal
      body: SingleChildScrollView(
        child: Container(
          clipBehavior: Clip.none,
          width: MediaQuery.of(context).size.width,
            child: Column(
              children: <Widget>[
                Image.asset("assets/img/Hero-Container.png", width: MediaQuery.of(context).size.width,
                  fit: BoxFit.cover,
                ),
                Container(
                  // Estilos del Contenedor
                  padding: const EdgeInsets.only( top: 30, left: 20, right: 20, bottom: 30),
                  margin: EdgeInsets.only( bottom: 0 ),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only( topLeft: Radius.circular(30), topRight: Radius.circular(30) ),
                    color: Color.fromRGBO(224, 225, 221, 1.0),
                  ),
                  child: Center(
                    child: Column(
                      children: <Widget> [
                        // Primer Texto
                        const Text("Haz que tu negocio crezca de manera exponencial dándote a conocer en todo el mercado con nosotros",
                          style: ( TextStyle(
                              fontWeight: FontWeight.w900,
                              fontSize: 18,
                              color: Color.fromRGBO(73, 80, 91, 1.0))),
                          textAlign: TextAlign.center,
                        ),

                        // Espaciado entre elementos
                        const SizedBox(height: 35),

                        // Segundo texto
                        const Text("Comienza a montar tu empresa de manera fácil y rápida",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Color.fromRGBO(73, 80, 91, 1.0)),
                          textAlign: TextAlign.center,
                        ),

                        // Espaciado entre elementos
                        const SizedBox(height: 35),

                        // Primer Botòn ( Iniciar Sesiòn )
                        OutlinedButton(
                          onPressed: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const MyAppForm()),
                            );
                          },
                          style: TextButton.styleFrom(
                            padding: const EdgeInsets.only( top: 10, bottom: 10, left: 75, right: 75 ),
                            backgroundColor: const Color.fromRGBO(255, 255, 255, 1.0),
                          ),
                          child: const Text("Iniciar Sesión",
                            style: TextStyle(
                              color: Color.fromRGBO(73, 80, 91, 1.0),
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),

                        // Espaciado Entre botones
                        const SizedBox(height: 10),

                        // Segundo Botòn ( Crear Cuenta )
                        FilledButton(
                          onPressed: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Creacion_Cuenta()),
                            );
                          },
                          style: TextButton.styleFrom(
                              padding: const EdgeInsets.only( top: 10, bottom: 10, left: 75, right: 75 ),
                              backgroundColor: const Color.fromRGBO(73, 80, 91, 1.0)
                          ),
                          child: const Text("Crear Cuenta",
                            style: TextStyle(
                              color: Color.fromRGBO(255, 255, 255, 1.0),
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),

                        const SizedBox(height: 20),
                        // Fila Final (Necesitas Ayuda, Contactanos)
                        const Text("¿Necesitas ayuda?",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Color.fromRGBO(73, 80, 91, 1.0)
                          ),
                        ),

                        // Boton de (Contactanos)
                        TextButton(
                          onPressed: (){},
                          child: const Text("Contactanos",
                            style: TextStyle(
                              color: Color.fromRGBO(73, 80, 91, 1.0),
                              fontSize: 15,
                              decoration: TextDecoration.underline,
                            ),),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            )
        ),
      ),
    );
  }
}
