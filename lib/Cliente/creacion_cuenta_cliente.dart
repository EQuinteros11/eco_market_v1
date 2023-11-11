import 'package:flutter/material.dart';
import 'package:uno/src/widgets/formulario_creacion_cuenta_cliente.dart';

class RegistroCliente extends StatefulWidget{
  @override
  RegistroApp createState() => RegistroApp();
}

class RegistroApp extends State<RegistroCliente> {
  @override
  Widget build(BuildContext context){

    return Scaffold(
      // Agregacion de fonde de pantalla
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/img/creacionCuentaCliente.png"),
                fit: BoxFit.cover
            )
        ),

        // Contenido de vista
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 50),
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Column(
                    children: [
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
                      bannerCrearCuenta(),

                      // Texto de creacion de cuenta
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            margin: const EdgeInsets.only(top: 20),
                            child: const Stack(
                              children: <Widget>[
                                Text("Creación de Cuenta para cliente",
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
                    ],
                  ),
                ),

                // Contenedor de campos de formulario
                const FormularioCuentaCliente()
              ],
            ),
          ),
        ),
      ),
    ) ;
  }
}

// Boton Crear Cuenta
Widget bannerCrearCuenta() {
  return Row(
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

            Text("Crea tu Cuenta",
              style: TextStyle(
                  fontSize: 30,
                  color: Color.fromRGBO(73, 80, 91, 1.0),
                  fontWeight: FontWeight.w600
              ),)
          ],
        ),
      )
    ],
  );
}

