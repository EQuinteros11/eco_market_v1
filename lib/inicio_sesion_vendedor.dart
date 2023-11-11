import 'package:flutter/material.dart';

class InicioSesionVendedor extends StatefulWidget {
  const InicioSesionVendedor({super.key});

  @override
  State<InicioSesionVendedor> createState() => _InicioSesionVendedorState();
}

class _InicioSesionVendedorState extends State<InicioSesionVendedor> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/img/inicioSesionVendedor.png"),
              fit: BoxFit.cover
          )
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          padding: const EdgeInsets.only( top: 50, left: 20, right: 20),
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  children: <Widget> [
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
                      ],
                    ),

                    // Banner "Inicia Sesión"
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          margin: const EdgeInsets.only(top: 15),
                          padding: const EdgeInsets.only( top: 5, bottom: 5, right: 5, left: 5),
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            color: Color.fromRGBO(255, 255, 255, 1.0),
                          ),
                          child: const Stack(
                            children: <Widget>[

                              Text("  Inicia Sesión  ",
                                style: TextStyle(
                                    fontSize: 33,
                                    color: Color.fromRGBO(73, 80, 91, 1.0),
                                    fontWeight: FontWeight.w600
                                ),)
                            ],
                          ),
                        )
                      ],
                    ),

                    // Texto Informativo "Vendedor"
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          margin: const EdgeInsets.only(top: 10),
                          // FORMULARIO
                          child: const Stack(
                            children: <Widget>[
                              Text("VENDEDOR",
                                style: TextStyle(
                                  color: Color.fromRGBO(255, 255, 255, 1.0),
                                  fontSize: 22,
                                  fontWeight: FontWeight.w700,
                                ),
                                textAlign: TextAlign.center,),
                            ],
                          ),
                        )
                      ],
                    ),

                    // Texto Informativo Detalles
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          margin: const EdgeInsets.only(top: 10),
                          // FORMULARIO
                          child: const Stack(
                            children: <Widget>[
                              Text("Publica todo tu catálogo de productos para comenzar a vender de manera rápida y fácil",
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

                    // Espaciado entre elementos
                    const SizedBox(height: 15),

                    // Campo de Usuario
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          margin: const EdgeInsets.only(top: 10),
                          // FORMULARIO
                          child: Stack(
                            children: <Widget>[
                              Column(
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(top: 10),
                                    decoration: const BoxDecoration(
                                      border: Border( bottom: BorderSide(
                                          color: Color.fromRGBO(255, 255, 255, 1.0),
                                          width: 2
                                      )
                                      ),
                                    ),
                                    child: TextFormField(
                                      style: const TextStyle(
                                          color: Color.fromRGBO(255, 255, 255, 1.0),
                                          fontSize: 17
                                      ),
                                      decoration: const InputDecoration(
                                          prefixIcon: Icon(
                                          Icons.attach_email_outlined,
                                          color: Color.fromRGBO(255, 255, 255, 1.0),
                                        ),
                                          labelText: "Usuario",
                                          hintText: "ejemplo@gmail.com",
                                          contentPadding: EdgeInsets.only(bottom: 1.0),
                                          border: InputBorder.none,
                                          hintStyle: TextStyle(
                                            color: Color.fromRGBO(255, 255, 255, 0.5),
                                          ),
                                          labelStyle: TextStyle(
                                            color: Color.fromRGBO(255, 255, 255, 1.0),
                                            decorationColor: Color.fromRGBO(255, 255, 255, 1.0),
                                          )
                                      ),
                                    ),
                                  )
                                ],
                              ),

                            ],
                          ),
                        )
                      ],
                    ),

                    // Espaciado entre elementos
                    const SizedBox(
                      height: 25,
                    ),

                    // Campo de Constraseña
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          margin: const EdgeInsets.only(top: 10),
                          decoration: const BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                color: Color.fromRGBO(255, 255, 255, 1.0),
                                width: 2
                                )
                            ),
                          ),
                          child: TextFormField(
                            obscureText: true,
                            enableSuggestions: false,
                            autocorrect: false,
                            style: const TextStyle(
                                color: Color.fromRGBO(255, 255, 255, 1.0),
                                fontSize: 17
                            ),
                            decoration: const InputDecoration(
                                prefixIcon: Icon(
                                  Icons.lock,
                                  color: Color.fromRGBO(255, 255, 255, 1.0),
                                ),
                                labelText: "Contraseña",
                                contentPadding: EdgeInsets.symmetric(vertical: 0.5),
                                border: InputBorder.none,
                                hintStyle: TextStyle(
                                  color: Color.fromRGBO(255, 255, 255, 0.5),
                                ),
                                labelStyle: TextStyle(
                                  color: Color.fromRGBO(255, 255, 255, 1.0),
                                  decorationColor: Color.fromRGBO(255, 255, 255, 1.0),
                                )
                            ),
                          ),
                        )
                      ],
                    ),

                    // Espacio entre elementos
                    const SizedBox(
                      height: 30,
                    ),

                    // Boton para Inciar Sesion
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          margin: const EdgeInsets.only(top: 10),
                          padding: const EdgeInsets.only(top: 5, bottom: 5, left: 15, right: 15),
                          // FORMULARIO
                          child: Stack(
                            children: <Widget>[
                              Column(
                                children: [
                                  FilledButton(
                                    onPressed: (){},
                                    style: TextButton.styleFrom(
                                      padding: const EdgeInsets.only( top: 10, bottom: 10, left: 65, right: 65 ),
                                      backgroundColor: Color.fromRGBO(255, 255, 2555, 1.0),
                                    ),
                                    child: const Text("Iniciar Sesión",
                                      style: TextStyle(
                                          color: Color.fromRGBO(65, 90, 119, 1.0),
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600
                                      ),),
                                  )
                                ],
                              ),

                            ],
                          ),
                        )
                      ],
                    )

                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
