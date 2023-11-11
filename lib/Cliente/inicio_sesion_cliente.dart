

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:uno/Cliente/PrincipalCliente.dart';
import 'package:uno/inicio_sesion_vendedor.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';

import '../models/global_var.dart';


class MyAppForm extends StatefulWidget {
  const MyAppForm({super.key});

  @override
  State<MyAppForm> createState() => _MyAppFormState();
}


class _MyAppFormState extends State<MyAppForm> {

  Future<FirebaseApp> _initializeFirebase() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();
    return firebaseApp;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: FutureBuilder(
          future: _initializeFirebase(),
          builder: ( context, snapshot ){
            if ( snapshot.connectionState == ConnectionState.done ){
              return const InicioSesionCliente();
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        )
    );
  }


}


// Esta vaina no se que es
class InicioSesionCliente extends StatefulWidget {
  const InicioSesionCliente({super.key});

  @override
  State<InicioSesionCliente> createState() => _InicioSesionClienteState();
}

// Vista de Inicio
class _InicioSesionClienteState extends State<InicioSesionCliente> {

  // Login function
  static Future<User?> loginUsingEmailPassword({required String email, required String password, required BuildContext context}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(email: email, password: password);
      user = userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == "user-not-found") {
        print("Usuario no encontrado");
      } else if (e.code == "wrong-password") {
        print("Contraseña incorrecta");
      } else {
        print("Error desconocido: ${e.code}");
      }
    }
    return user;
  }


  @override
  Widget build(BuildContext context) {

    // Controladores
    TextEditingController _emailController = TextEditingController();
    TextEditingController _passwordController = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/img/inicioSesionCliente.png"),
                fit: BoxFit.cover
            )
        ),
        child: ListView(
          padding: const EdgeInsets.symmetric(
              horizontal: 30.0,
              vertical: 60.0
          ),
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


            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
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
                          Text("CLIENTE",
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
                          Text("Accede y compra a todos tus proveedores favoritos de manera rápida y sencilla",
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
                const SizedBox(
                  height: 10.0,
                ),

                // Campo de Usuario
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
                    restorationId: "mira",
                    controller: _emailController,
                    style: const TextStyle(
                        color: Color.fromRGBO(255, 255, 255, 1.0),
                        fontSize: 17
                    ),
                    decoration: const InputDecoration(
                      hintText: 'ejemplo@gmail.com',
                      labelText: 'Usuario',
                      contentPadding: EdgeInsets.only(bottom: 10),
                      border: InputBorder.none,
                      hintStyle: TextStyle(
                        color: Color.fromRGBO(255, 255, 255, 0.5),
                      ),
                      labelStyle: TextStyle(
                        color: Color.fromRGBO(255, 255, 255, 1.0),
                        decorationColor: Color.fromRGBO(255, 255, 255, 1.0),
                      ),

                      prefixIcon: Icon(
                        Icons.attach_email_outlined,
                        color: Color.fromRGBO(255, 255, 255, 1.0),
                      ),
                    ),
                  ),
                ),

                // Espaciado entre elementos
                const SizedBox(
                  height: 30,
                ),

                // Botón
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
                    controller: _passwordController,
                    obscureText: true,
                    enableSuggestions: false,
                    autocorrect: false,
                    style: const TextStyle(
                        color: Color.fromRGBO(255, 255, 255, 1.0),
                        fontSize: 17
                    ),
                    decoration: const InputDecoration(
                      hintText: 'contraseña ',
                      labelText: 'Contraseña',
                      contentPadding: EdgeInsets.only(bottom: 10),
                      border: InputBorder.none,
                      hintStyle: TextStyle(
                        color: Color.fromRGBO(255, 255, 255, 0.5),
                      ),
                      labelStyle: TextStyle(
                        color: Color.fromRGBO(255, 255, 255, 1.0),
                        decorationColor: Color.fromRGBO(255, 255, 255, 1.0),
                      ),
                      prefixIcon: Icon(
                        Icons.lock_outline,
                        color: Color.fromRGBO(255, 255, 255, 1.0),
                      ),
                    ),
                  ),
                ),

                // Espaciado entre elementos
                const SizedBox(
                  height: 30,
                ),

                OutlinedButton(
                  onPressed:() async {
                    User? user = await loginUsingEmailPassword(email: _emailController.text, password: _passwordController.text, context: context);
                    //print(user?.email);
                    ver =user?.email;
                    print(ver);
                    if( user != null ){
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context) => const VistaPrincipalCliente()
                          )
                      );
                    }else{
                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: CustomSnackBarWidget(errorText: 'Parece que el usuario no ha sido encontrados',),
                            behavior: SnackBarBehavior.floating,
                            backgroundColor: Colors.transparent,
                            elevation: 0,

                          )
                      );
                    }

                  },
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.only( top: 10, bottom: 10, left: 75, right: 75 ),
                    backgroundColor: const Color.fromRGBO(255, 255, 255, 1.0),
                  ),
                  child: const Text('Iniciar Sesión',
                    style: TextStyle(
                      color: Color.fromRGBO(73, 80, 91, 1.0),
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),

                ),
                const SizedBox(
                  height:16.0,
                ),

                FilledButton(
                  onPressed:(){
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => InicioSesionVendedor()));
                  },
                  style: TextButton.styleFrom(
                      padding: const EdgeInsets.only( top: 10, bottom: 10, left: 15, right: 15 ),
                      backgroundColor: const Color.fromRGBO(73, 80, 91, 1.0)
                  ),
                  child: const Text('Iniciar Sesión como vendedor',
                    style: TextStyle(
                      color: Color.fromRGBO(255, 255, 255, 1.0),
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),

                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CustomSnackBarWidget extends StatelessWidget {
  const CustomSnackBarWidget({
    super.key,
    required this.errorText,
  });

  final String errorText;

  @override
  Widget build(BuildContext context) {
    return
      Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            height: 95,
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
                color: Color.fromRGBO(
                    243, 151, 151, 1.0),
                borderRadius: BorderRadius.all(Radius.circular(20))
            ),
            child: Row(
              children: [
                const SizedBox(
                  width: 45,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Error!",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w700
                        ),
                      ),
                      const SizedBox(
                        height: 0,
                      ),
                      Text(errorText,

                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const Positioned(
            bottom: 30,
            left: 10,
            child: ClipRRect(

              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
              ),
              child: Icon(
                Icons.warning_amber_rounded,
                size: 40,
                color: Color.fromRGBO(255, 255, 255, 1.0),
              ),
            ),
          ),
          const Positioned(
            top: -15,
            left: 0,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Icon(
                  Icons.circle,
                  size: 40,
                  color: Color.fromRGBO(218, 127, 127, 1.0),
                ),
                Icon(
                  Icons.close,
                  size: 18,
                  color: Colors.white,
                )
              ],
            ),
          )
        ],
      );
  }
}