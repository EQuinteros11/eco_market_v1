import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UpdateCliente extends StatefulWidget {
  const UpdateCliente({Key? key}) : super(key: key);

  @override
  _UpdateClienteState createState() => _UpdateClienteState();
}

class _UpdateClienteState extends State<UpdateCliente> {
  TextEditingController usuario = TextEditingController();
  TextEditingController apellidos = TextEditingController();
  TextEditingController direccion = TextEditingController();
  TextEditingController telefono = TextEditingController();
  TextEditingController correo = TextEditingController();

  var maskFormatterCelphone = MaskTextInputFormatter(
    mask: '####-####',
    filter: { "#": RegExp(r'[0-9]')},
    type: MaskAutoCompletionType.lazy,
  );

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/img/creacionCuentaCliente.png"),
          fit: BoxFit.cover,
        ),
      ),

      // Fondo de Pantalla
      child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/img/editarCuentaCliente.png"),
            fit: BoxFit.cover,
          ),
        ),

        // Contenido
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
                        children: <Widget>[
                          IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            style: TextButton.styleFrom(
                              padding: const EdgeInsets.all(10),
                              backgroundColor:
                              const Color.fromRGBO(255, 255, 255, 1.0),
                            ),
                            icon: const Icon(Icons.arrow_back),
                            tooltip: "Regresar",
                          ),
                        ],
                      ),
                      // Banner de Editar cuenta
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            margin: const EdgeInsets.only(top: 20),
                            padding: const EdgeInsets.only(
                                top: 5, bottom: 5, left: 25, right: 25),
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(30),
                              ),
                              color: Color.fromRGBO(255, 255, 255, 1.0),
                            ),
                            child: const Stack(
                              children: <Widget>[
                                Text(
                                  "Actualizar",
                                  style: TextStyle(
                                    fontSize: 30,
                                    color: Color.fromRGBO(73, 80, 91, 1.0),
                                    fontWeight: FontWeight.w600,
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      // Texto de editar
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            margin: const EdgeInsets.only(top: 20),
                            // FORMULARIO
                            child: const Stack(
                              children: <Widget>[
                                Text(
                                  "Editar cuenta para cliente",
                                  style: TextStyle(
                                    color: Color.fromRGBO(255, 255, 255, 1.0),
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                // Contenedor de campos de formulario
                Container(
                  padding: const EdgeInsets.only(
                    top: 10,
                    bottom: 10,
                    left: 10,
                    right: 10,
                  ),
                  margin: const EdgeInsets.only(
                    top: 15,
                    left: 20,
                    right: 20,
                  ),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                    color: Color.fromRGBO(0, 0, 0, 0.2),
                  ),
                  // Columna donde se almacenan todos los campos
                  child: Column(
                    children: <Widget>[
                      // Campo de Nombres
                      Container(
                        margin: const EdgeInsets.all(10),
                        decoration: const BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: Color.fromRGBO(255, 255, 255, 1.0),
                              width: 2,
                            ),
                          ),
                        ),
                        child: TextFormField(
                          controller: usuario,
                          style: const TextStyle(
                            color: Color.fromRGBO(255, 255, 255, 1.0),
                            fontSize: 17,
                          ),
                          decoration: const InputDecoration(
                            labelText: 'Nombre',
                            hintText: 'Digite nombres',
                            contentPadding: EdgeInsets.symmetric(
                              vertical: 0.0,
                            ),
                            border: InputBorder.none,
                            hintStyle: TextStyle(
                              color: Color.fromRGBO(255, 255, 255, 0.8),
                            ),
                            labelStyle: TextStyle(
                              color: Color.fromRGBO(255, 255, 255, 1.0),
                            ),
                          ),
                        ),
                      ),
                      // Campo de Apellidos
                      Container(
                        margin: const EdgeInsets.all(10),
                        decoration: const BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: Color.fromRGBO(255, 255, 255, 1.0),
                              width: 2,
                            ),
                          ),
                        ),
                        child: TextFormField(
                          controller: apellidos,
                          style: const TextStyle(
                            color: Color.fromRGBO(255, 255, 255, 1.0),
                            fontSize: 17,
                          ),
                          decoration: const InputDecoration(
                            labelText: 'Apellidos',
                            hintText: 'Digite apellidos',
                            contentPadding: EdgeInsets.symmetric(
                              vertical: 0.0,
                            ),
                            border: InputBorder.none,
                            hintStyle: TextStyle(
                              color: Color.fromRGBO(255, 255, 255, 0.8),
                            ),
                            labelStyle: TextStyle(
                              color: Color.fromRGBO(255, 255, 255, 1.0),
                            ),
                          ),
                        ),
                      ),
                      // Campo de Direccion
                      Container(
                        margin: const EdgeInsets.all(10),
                        decoration: const BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: Color.fromRGBO(255, 255, 255, 1.0),
                              width: 2,
                            ),
                          ),
                        ),
                        child: TextFormField(
                          controller: direccion,
                          style: const TextStyle(
                            color: Color.fromRGBO(255, 255, 255, 1.0),
                            fontSize: 17,
                          ),
                          decoration: const InputDecoration(
                            labelText: 'Dirección',
                            hintText: 'Digite su dirección completa',
                            contentPadding: EdgeInsets.symmetric(
                              vertical: 0.0,
                            ),
                            border: InputBorder.none,
                            hintStyle: TextStyle(
                              color: Color.fromRGBO(255, 255, 255, 0.8),
                            ),
                            labelStyle: TextStyle(
                              color: Color.fromRGBO(255, 255, 255, 1.0),
                            ),
                          ),
                        ),
                      ),
                      // Campo de Telefono
                      Container(
                        margin: const EdgeInsets.all(10),
                        decoration: const BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: Color.fromRGBO(255, 255, 255, 1.0),
                              width: 2,
                            ),
                          ),
                        ),
                        child: TextFormField(
                          controller: telefono,
                          inputFormatters: [maskFormatterCelphone],
                          style: const TextStyle(
                            color: Color.fromRGBO(255, 255, 255, 1.0),
                            fontSize: 17,
                          ),
                          decoration: const InputDecoration(
                            labelText: 'Teléfono',
                            hintText: "0000-0000",
                            contentPadding: EdgeInsets.symmetric(
                              vertical: 0.0,
                            ),
                            border: InputBorder.none,
                            hintStyle: TextStyle(
                              color: Color.fromRGBO(255, 255, 255, 0.8),
                            ),
                            labelStyle: TextStyle(
                              color: Color.fromRGBO(255, 255, 255, 1.0),
                            ),
                          ),
                        ),
                      ),
                      // Campo de correo electronico
                      Container(
                        margin: const EdgeInsets.all(10),
                        decoration: const BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: Color.fromRGBO(255, 255, 255, 1.0),
                              width: 2,
                            ),
                          ),
                        ),
                        child: TextFormField(
                          controller: correo,
                          style: const TextStyle(
                            color: Color.fromRGBO(255, 255, 255, 1.0),
                            fontSize: 17,
                          ),
                          decoration: const InputDecoration(
                            labelText: 'Correo electrónico',
                            hintText: 'Digite correo',
                            contentPadding: EdgeInsets.symmetric(
                              vertical: 0.0,
                            ),
                            border: InputBorder.none,
                            hintStyle: TextStyle(
                              color: Color.fromRGBO(255, 255, 255, 0.8),
                            ),
                            labelStyle: TextStyle(
                              color: Color.fromRGBO(255, 255, 255, 1.0),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // Espaciado entre elementos
                const SizedBox(
                  height: 15,
                ),
                const SizedBox(
                  height: 15,
                ),
                Column(
                  children: <Widget>[
                    OutlinedButton(
                      onPressed: () {
                        // Aquí se realiza la búsqueda del cliente por correo
                        buscarClientePorCorreo(correo.text);
                      },
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.only(
                            top: 10, bottom: 10, left: 75, right: 75),
                        backgroundColor:
                        const Color.fromRGBO(255, 255, 255, 1.0),
                      ),
                      child: const Text(
                        'Buscar Cliente',
                        style: TextStyle(
                          color: Color.fromRGBO(73, 80, 91, 1.0),
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    // Botón de Editar
                    OutlinedButton(
                      onPressed: () {
                        // Aquí se realiza la actualización de datos
                        editarDatosCliente(correo.text);
                      },
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.only(
                            top: 10, bottom: 10, left: 75, right: 75),
                        backgroundColor:
                        const Color.fromRGBO(255, 255, 255, 1.0),
                      ),
                      child: const Text(
                        'Editar',
                        style: TextStyle(
                          color: Color.fromRGBO(73, 80, 91, 1.0),
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void buscarClientePorCorreo(String correo) {
    _firestore.collection('clientes')
        .where('correo', isEqualTo: correo)
        .get()
        .then((QuerySnapshot querySnapshot) {
      if (querySnapshot.docs.isNotEmpty) {
        QueryDocumentSnapshot documentSnapshot = querySnapshot.docs.first;
        Map<String, dynamic> data = documentSnapshot.data() as Map<String, dynamic>;

        // Asigna los datos a los controladores del formulario
        usuario.text = data['nombres'] ?? "";
        apellidos.text = data['apellidos'] ?? "";
        direccion.text = data['direccion'] ?? "";
        telefono.text = data['telefono'] ?? "";
      } else {
        mostrarMensaje("Cliente no encontrado.");
      }
    });
  }

  void editarDatosCliente(String correo) {
    final Map<String, dynamic> nuevosDatos = {
      'nombres': usuario.text,
      'apellidos': apellidos.text,
      'direccion': direccion.text,
      'telefono': telefono.text,
    };

    // Actualiza los datos en Firestore utilizando el correo electrónico como filtro
    _firestore.collection('clientes')
        .where('correo', isEqualTo: correo)
        .get()
        .then((QuerySnapshot querySnapshot) {
      if (querySnapshot.docs.isNotEmpty) {
        QueryDocumentSnapshot documentSnapshot = querySnapshot.docs.first;
        String documentId = documentSnapshot.id;

        _firestore.collection('clientes')
            .doc(documentId)
            .update(nuevosDatos)
            .then((_) {
          mostrarMensaje('Datos actualizados con éxito');
        }).catchError((error) {
          mostrarMensaje('Error al actualizar los datos: $error');
        });
      } else {
        mostrarMensaje("Cliente no encontrado.");
      }
    });
  }

  void mostrarMensaje(String mensaje) {
    final snackBar = SnackBar(
      content: Text(mensaje),
      duration: Duration(seconds: 3),
      action: SnackBarAction(
        label: 'Cerrar',
        onPressed: () {},
      ),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}