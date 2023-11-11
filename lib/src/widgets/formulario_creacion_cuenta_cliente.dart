import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../Cliente/inicio_sesion_cliente.dart';



class FormularioCuentaCliente extends StatefulWidget {
  const FormularioCuentaCliente({super.key});

  @override
  State<FormularioCuentaCliente> createState() => _FormularioCuentaClienteState();
}


class _FormularioCuentaClienteState extends State<FormularioCuentaCliente> {
  TextEditingController nombres = TextEditingController();
  TextEditingController apellidos = TextEditingController();
  TextEditingController direccion = TextEditingController();
  TextEditingController telefono = TextEditingController();
  TextEditingController correo = TextEditingController();
  TextEditingController contrasena = TextEditingController();
  TextEditingController confircontra = TextEditingController();


  final firebase = FirebaseFirestore.instance;

  bool _checkBox = false;

  registroUsuario() async{
    try{

      await firebase.collection('clientes').doc().set(
          {

            "nombres": nombres.text,
            "apellidos": apellidos.text,
            "direccion": direccion.text,
            "telefono": telefono.text,
            "correo": correo.text,
            "contrasena": contrasena.text,
            "confircontra": confircontra.text

          }
      );
      // Registro el usuario en Firebase Authentication
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: correo.text,
        password: contrasena.text,
      );

      // Luego puedes redirigir al usuario a la pantalla de inicio de sesión
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => InicioSesionCliente()),
      );
    } catch (e) {
      print('Error...' + e.toString());
    }
  }


  @override

  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 10, bottom: 10, left: 10, right: 10),
            margin: const EdgeInsets.only(top: 15, left: 20, right: 20),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(25)),
              color: Color.fromRGBO(0, 0, 0, 0.2),
            ),

            // Columna donde se almacenan todos los campos
            child: Column(
                children:<Widget> [

                  // Campo de Nombres
                  campoGeneral("Nombres","Ingrese sus nombres", nombres),

                  // Campo de Apellidos

                  campoGeneral("Apellidos", "Ingrese sus apellidos", apellidos),

                  // Campo de Direccion
                  campoGeneral("Direccion", "Ingrese su direccion",direccion),

                  // Campo de Telefono
                  campoTelefono(telefono),

                  // Campo de correo electronico
                  campoCorreoElectronico(correo),

                  // Campo de contraseña
                  campoContrasena(contrasena),

                  // Campo de confirmar contraseña
                  campoConfirmarContrasena(confircontra),

                  // Checkbox de confirmación de politica de privacidad
                  Container(
                    margin: const EdgeInsets.only(top: 10),
                    child: CheckboxListTile(
                      value: _checkBox,
                      checkColor: const Color.fromRGBO(255, 255, 255, 1.0),
                      activeColor: const Color.fromRGBO(73, 80, 91, 1.0),
                      title: const Text("Acepto términos de política y privacidad",
                        style: TextStyle(
                          color: Color.fromRGBO(255, 255, 255, 1.0),
                        ),),
                      onChanged: (val) {
                        setState(() {
                          _checkBox = val!;
                        });
                      },
                      controlAffinity: ListTileControlAffinity.leading,
                    ),
                  ),
                ]
            ),
          ),

          // Espaciado entre elementos
          const SizedBox(
            height: 15,
          ),

          // Botones de formulario
          Column(
            children: <Widget> [
              // Botón de Crear Cuenta
              OutlinedButton(
                onPressed: () {
                  registroUsuario();
                },
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.only(top: 10, bottom: 10, left: 75, right: 75),
                  backgroundColor: const Color.fromRGBO(255, 255, 255, 1.0),
                ),
                child: const Text(
                  'Crear cuenta',
                  style: TextStyle(
                    color: Color.fromRGBO(73, 80, 91, 1.0),
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),

              // Espaciado entre elementos
              const SizedBox(
                height: 15,
              ),

              const Text("¿Ya posees una cuenta?",
                style: TextStyle(
                    color: Color.fromRGBO(73, 80, 91, 1.0),
                    fontWeight: FontWeight.w600,
                    fontSize: 18
                ),
              ),

              // Espaciado entre elementos
              const SizedBox(
                height: 0,
              ),

              // Segundo Boton
              FilledButton(
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const MyAppForm()),
                  );
                },
                style: TextButton.styleFrom(
                    padding: const EdgeInsets.only( top: 10, bottom: 10, left: 75, right: 75 ),
                    backgroundColor: const Color.fromRGBO(73, 80, 91, 1.0)
                ),
                child: const Text("Iniciar Sesión",
                  style: TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 1.0),
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),

              // Espaciado Final
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// Campo de General
Widget campoGeneral( String labelT, String hintText, TextEditingController controller ){
  return Container(
    margin: const EdgeInsets.all(10),
    decoration: const BoxDecoration(
      border: Border(
          bottom: BorderSide(
              color: Color.fromRGBO(255, 255, 255, 1.0),
              width: 2
          )
      ),
    ),
    child: TextFormField(
      controller: controller,
      style: const TextStyle(
          color: Color.fromRGBO(255, 255, 255, 1.0),
          fontSize: 17
      ),
      decoration: InputDecoration(
        labelText: labelT,
        hintText: hintText,
        contentPadding: const EdgeInsets.symmetric(vertical: 0.0),
        border: InputBorder.none,
        hintStyle: const TextStyle(
          color: Color.fromRGBO(255, 255, 255, 0.8),
        ),
        labelStyle: const TextStyle(
          color: Color.fromRGBO(255, 255, 255, 1.0),
        ),
      ),
    ),
  );
}

// Campo de Telefono
Widget campoTelefono(TextEditingController telefono){
  // Casteo de mascara
  var maskFormatterCelphone = MaskTextInputFormatter(
      mask: '####-####',
      filter: { "#": RegExp(r'[0-9]') },
      type: MaskAutoCompletionType.lazy
  );

  return Container(
    margin: const EdgeInsets.all(10),
    decoration: const BoxDecoration(
        border: Border( bottom: BorderSide(
            color: Color.fromRGBO(255, 255, 255, 1.0),
            width: 2
        ) )
    ),
    child: TextFormField(
      controller: telefono,
      inputFormatters: [maskFormatterCelphone],
      style: const TextStyle(
          color: Color.fromRGBO(255, 255, 255, 1.0),
          fontSize: 17
      ),
      decoration: const InputDecoration(
        labelText: 'Teléfono',
        hintText: "0000-0000",
        contentPadding: EdgeInsets.symmetric(vertical: 0.0),
        border: InputBorder.none,
        hintStyle: TextStyle(
          color: Color.fromRGBO(255, 255, 255, 0.8),
        ),
        labelStyle: TextStyle(
          color: Color.fromRGBO(255, 255, 255, 1.0),
        ),
      ),
    ),
  );
}

// Campo Correo Electronico
Widget campoCorreoElectronico(TextEditingController correo){
  return Container(
    margin: const EdgeInsets.all(10),
    decoration: const BoxDecoration(
        border: Border( bottom: BorderSide(
            color: Color.fromRGBO(255, 255, 255, 1.0),
            width: 2
        ) )
    ),
    child: TextField(
      controller: correo,
      style: TextStyle(
          color: Color.fromRGBO(255, 255, 255, 1.0),
          fontSize: 17
      ),

      decoration: InputDecoration(

        labelText: 'Correo electrónico',
        hintText: 'Digite correo',
        contentPadding: EdgeInsets.symmetric(vertical: 0.0),
        border: InputBorder.none,
        hintStyle: TextStyle(
          color: Color.fromRGBO(255, 255, 255, 0.8),
        ),
        labelStyle: TextStyle(
          color: Color.fromRGBO(255, 255, 255, 1.0),
        ),
      ),
    ),
  );
}

// Campo Contrasena
Widget campoContrasena(TextEditingController contrasena){
  return Container(
    margin: const EdgeInsets.all(10),
    decoration: const BoxDecoration(
        border: Border( bottom: BorderSide(
            color: Color.fromRGBO(255, 255, 255, 1.0),
            width: 2
        ) )
    ),
    child:  TextField(
      controller: contrasena,
      style: TextStyle(
          color: Color.fromRGBO(255, 255, 255, 1.0),
          fontSize: 17
      ),
      obscureText: true,
      enableSuggestions: false,
      autocorrect: false,
      decoration: InputDecoration(
        labelText: 'Contraseña',
        hintText: 'Digite su contraseña',
        contentPadding: EdgeInsets.symmetric(vertical: 0.0),
        border: InputBorder.none,
        hintStyle: TextStyle(
          color: Color.fromRGBO(255, 255, 255, 0.8),
        ),
        labelStyle: TextStyle(
          color: Color.fromRGBO(255, 255, 255, 1.0),
        ),
      ),
    ),
  );
}

// Campo Confirmar contrasena
Widget campoConfirmarContrasena(TextEditingController confircontra){
  return Container(
    margin: const EdgeInsets.all(10),
    decoration: const BoxDecoration(
        border: Border( bottom: BorderSide(
            color: Color.fromRGBO(255, 255, 255, 1.0),
            width: 2
        ) )
    ),
    child:  TextField(
      controller: confircontra,
      style: TextStyle(
          color: Color.fromRGBO(255, 255, 255, 1.0),
          fontSize: 17
      ),
      obscureText: true,
      enableSuggestions: false,
      autocorrect: false,
      decoration: InputDecoration(
        labelText: 'Confirmar Contraseña',
        hintText: 'Digite su contraseña',
        contentPadding: EdgeInsets.symmetric(vertical: 0.0),
        border: InputBorder.none,
        hintStyle: TextStyle(
          color: Color.fromRGBO(255, 255, 255, 0.8),
        ),
        labelStyle: TextStyle(
          color: Color.fromRGBO(255, 255, 255, 1.0),
        ),
      ),
    ),
  );
}