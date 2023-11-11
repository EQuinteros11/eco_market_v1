import 'package:flutter/material.dart';
import 'package:uno/inicio_sesion_vendedor.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class UpdateVendedor extends StatefulWidget {
  const UpdateVendedor({super.key});

  @override
  State<UpdateVendedor> createState() => _UpdateVendedorState();

//final databaseReference = FirebaseDatabase.instance.reference();
}

class _UpdateVendedorState extends State<UpdateVendedor> {
  int currentStep = 0;
  TextEditingController nomNegocio = TextEditingController();
  TextEditingController direNegocio = TextEditingController();
  TextEditingController rubro = TextEditingController();
  TextEditingController nomPropietario = TextEditingController();
  TextEditingController numContacto = TextEditingController();
  TextEditingController correoPropietario = TextEditingController();
  TextEditingController contactoTienda = TextEditingController();
  TextEditingController correoTienda = TextEditingController();
  TextEditingController contactoCellTienda = TextEditingController();
  TextEditingController facebook = TextEditingController();
  TextEditingController instagram = TextEditingController();
  TextEditingController tiktok = TextEditingController();


  var maskFormatterCelphone = MaskTextInputFormatter(
      mask: '####-####',
      filter: { "#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/img/editarCuentaVendedor.png"),
              fit: BoxFit.cover
          )
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          margin: const EdgeInsets.only(top: 50),
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    // Boton de Regresar
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: TextButton.styleFrom(
                          padding: const EdgeInsets.all(10),
                          backgroundColor: const Color.fromRGBO(
                              255, 255, 255, 1.0)
                      ),
                      icon: const Icon(Icons.arrow_back),
                      tooltip: "Regresar",
                    ),

                    // Espacio entre elementos

                  ],
                ),

                // Banner de Crea tu cuenta
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.only(top: 20),
                      padding: const EdgeInsets.only(
                          top: 5, bottom: 5, left: 25, right: 25),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        color: Color.fromRGBO(255, 255, 255, 1.0),
                      ),
                      child: const Stack(
                        children: <Widget>[

                          Text("Editar tu Cuenta",
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

                // Banner informativo
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.only(top: 20),
                      // FORMULARIO
                      child: const Stack(
                        children: <Widget>[
                          Text("Editar de Cuenta para vendedor",
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

                const SizedBox(height: 15),

                // Stepper de creacion de cuenta
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                        padding: const EdgeInsets.all(0),
                        decoration: const BoxDecoration(
                            color: Color.fromRGBO(0, 0, 0, 0.2),
                            borderRadius: BorderRadius.all(Radius.circular(20))
                        ),
                        child: Theme(
                          data: ThemeData(
                            colorScheme: Theme
                                .of(context)
                                .colorScheme
                                .copyWith(
                                primary: const Color.fromRGBO(65, 90, 119, 1.0)
                            ),
                          ),
                          child: Stepper(
                            currentStep: currentStep,
                            onStepTapped: (index) {
                              setState(() => { currentStep = index});
                            },
                            onStepContinue: () {
                              if (currentStep != 3) {
                                setState(() {
                                  currentStep++;
                                });
                              }
                            },
                            onStepCancel: () {
                              if (currentStep != 0) {
                                setState(() {
                                  currentStep--;
                                });
                              }
                            },
                            steps: <Step>[

                              // Step 1 "Detalles del Negocio"
                              Step(
                                isActive: currentStep >= 0,
                                title: const Text('Detalles del negocio',
                                  style: TextStyle(
                                      color: Color.fromRGBO(255, 255, 255, 1.0),
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500
                                  ),
                                ),
                                content: Container(
                                  alignment: Alignment.topLeft,
                                  child: Column(
                                    children: <Widget>[
                                      // Campo de Nombre del Negocio
                                      Container(
                                        margin: const EdgeInsets.only(top: 10),
                                        decoration: const BoxDecoration(
                                          border: Border(bottom: BorderSide(
                                              color: Color.fromRGBO(
                                                  255, 255, 255, 1.0),
                                              width: 2
                                          )
                                          ),
                                        ),
                                        child: TextFormField(
                                          controller: nomNegocio,
                                          style: const TextStyle(
                                              color: Color.fromRGBO(
                                                  255, 255, 255, 1.0),
                                              fontSize: 17
                                          ),
                                          decoration: const InputDecoration(
                                              labelText: "Nombre del negocio *",
                                              hintText: "Nombre",
                                              contentPadding: EdgeInsets
                                                  .symmetric(vertical: 0.0),
                                              border: InputBorder.none,
                                              hintStyle: TextStyle(
                                                color: Color.fromRGBO(
                                                    255, 255, 255, 0.5),
                                              ),
                                              labelStyle: TextStyle(
                                                color: Color.fromRGBO(
                                                    255, 255, 255, 1.0),
                                                decorationColor: Color.fromRGBO(
                                                    255, 255, 255, 1.0),
                                              )
                                          ),
                                        ),
                                      ),

                                      // Campo de "Dirección"
                                      Container(
                                        margin: const EdgeInsets.only(top: 25),
                                        decoration: const BoxDecoration(
                                          border: Border(bottom: BorderSide(
                                              color: Color.fromRGBO(
                                                  255, 255, 255, 1.0),
                                              width: 2
                                          )
                                          ),
                                        ),
                                        child: TextFormField(
                                          controller: direNegocio,
                                          style: const TextStyle(
                                              color: Color.fromRGBO(
                                                  255, 255, 255, 1.0),
                                              fontSize: 17
                                          ),
                                          decoration: const InputDecoration(
                                              labelText: "Dirección *",
                                              hintText: "Ejemplo",
                                              contentPadding: EdgeInsets
                                                  .symmetric(vertical: 0.0),
                                              border: InputBorder.none,
                                              hintStyle: TextStyle(
                                                color: Color.fromRGBO(
                                                    255, 255, 255, 0.5),
                                              ),
                                              labelStyle: TextStyle(
                                                color: Color.fromRGBO(
                                                    255, 255, 255, 1.0),
                                                decorationColor: Color.fromRGBO(
                                                    255, 255, 255, 1.0),
                                              )
                                          ),

                                        ),
                                      ),

                                      // Campo de Rubro
                                      Container(
                                        margin: const EdgeInsets.only(top: 25),
                                        decoration: const BoxDecoration(
                                          border: Border(bottom: BorderSide(
                                              color: Color.fromRGBO(
                                                  255, 255, 255, 1.0),
                                              width: 2
                                          )
                                          ),
                                        ),
                                        child: TextFormField(
                                          controller: rubro,
                                          style: const TextStyle(
                                              color: Color.fromRGBO(
                                                  255, 255, 255, 1.0),
                                              fontSize: 17
                                          ),
                                          decoration: const InputDecoration(
                                              labelText: "Rubro *",
                                              hintText: "Ejemplo",
                                              contentPadding: EdgeInsets
                                                  .symmetric(vertical: 0.0),
                                              border: InputBorder.none,
                                              hintStyle: TextStyle(
                                                color: Color.fromRGBO(
                                                    255, 255, 255, 0.5),
                                              ),
                                              labelStyle: TextStyle(
                                                color: Color.fromRGBO(
                                                    255, 255, 255, 1.0),
                                                decorationColor: Color.fromRGBO(
                                                    255, 255, 255, 1.0),
                                              )
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),

                              // Step 2
                              Step(
                                isActive: currentStep >= 1,
                                title: const Text('Datos Personales',
                                  style: TextStyle(
                                      color: Color.fromRGBO(255, 255, 255, 1.0),
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500
                                  ),),
                                content: Container(
                                  alignment: Alignment.topLeft,
                                  child: Column(
                                    children: <Widget>[

                                      // Primer Paso de la segunda Opcion (Nombre del propietario)
                                      Container(
                                        margin: const EdgeInsets.only(top: 10),
                                        decoration: const BoxDecoration(
                                          border: Border(bottom: BorderSide(
                                              color: Color.fromRGBO(
                                                  255, 255, 255, 1.0),
                                              width: 2
                                          )
                                          ),
                                        ),
                                        // Campo de Texto
                                        child: TextFormField(
                                          controller: nomPropietario,
                                          style: const TextStyle(
                                              color: Color.fromRGBO(
                                                  255, 255, 255, 1.0),
                                              fontSize: 17
                                          ),
                                          decoration: const InputDecoration(
                                              labelText: "Nombre del Propietario *",
                                              hintText: "Nombre",
                                              contentPadding: EdgeInsets
                                                  .symmetric(vertical: 0.0),
                                              border: InputBorder.none,
                                              hintStyle: TextStyle(
                                                color: Color.fromRGBO(
                                                    255, 255, 255, 0.5),
                                              ),
                                              labelStyle: TextStyle(
                                                color: Color.fromRGBO(
                                                    255, 255, 255, 1.0),
                                                decorationColor: Color.fromRGBO(
                                                    255, 255, 255, 1.0),
                                              )
                                          ),
                                        ),
                                      ),

                                      // Segundo Paso de la segunda Opcion (Número de Contacto)
                                      Container(
                                        margin: const EdgeInsets.only(top: 25),
                                        decoration: const BoxDecoration(
                                          border: Border(bottom: BorderSide(
                                              color: Color.fromRGBO(
                                                  255, 255, 255, 1.0),
                                              width: 2
                                          )
                                          ),
                                        ),

                                        // Campo de texto
                                        child: TextFormField(
                                          controller: numContacto,
                                          inputFormatters: [
                                            maskFormatterCelphone
                                          ],
                                          style: const TextStyle(
                                              color: Color.fromRGBO(
                                                  255, 255, 255, 1.0),
                                              fontSize: 17
                                          ),
                                          decoration: const InputDecoration(
                                              labelText: "Número de Contacto *",
                                              hintText: "0000-0000",
                                              contentPadding: EdgeInsets
                                                  .symmetric(vertical: 0.0),
                                              border: InputBorder.none,
                                              hintStyle: TextStyle(
                                                color: Color.fromRGBO(
                                                    255, 255, 255, 0.5),
                                              ),
                                              labelStyle: TextStyle(
                                                color: Color.fromRGBO(
                                                    255, 255, 255, 1.0),
                                                decorationColor: Color.fromRGBO(
                                                    255, 255, 255, 1.0),
                                              )
                                          ),
                                        ),
                                      ),

                                      // Tercer Paso de la segunda Opcion (Correo)
                                      Container(
                                        margin: const EdgeInsets.only(top: 25),
                                        decoration: const BoxDecoration(
                                          border: Border(bottom: BorderSide(
                                              color: Color.fromRGBO(
                                                  255, 255, 255, 1.0),
                                              width: 2
                                          )
                                          ),
                                        ),

                                        // Campo de texto
                                        child: TextFormField(
                                          controller: correoPropietario,
                                          style: const TextStyle(
                                              color: Color.fromRGBO(
                                                  255, 255, 255, 1.0),
                                              fontSize: 17
                                          ),
                                          decoration: const InputDecoration(
                                              labelText: "Correo *",
                                              hintText: "ejemplo@gmail.com",
                                              contentPadding: EdgeInsets
                                                  .symmetric(vertical: 0.0),
                                              border: InputBorder.none,
                                              hintStyle: TextStyle(
                                                color: Color.fromRGBO(
                                                    255, 255, 255, 0.5),
                                              ),
                                              labelStyle: TextStyle(
                                                color: Color.fromRGBO(
                                                    255, 255, 255, 1.0),
                                                decorationColor: Color.fromRGBO(
                                                    255, 255, 255, 1.0),
                                              )
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),

                              // Step 3 Detalles de Contacto
                              Step(
                                isActive: currentStep >= 2,
                                title: const Text("Detalles de Contacto",
                                  style: TextStyle(
                                      color: Color.fromRGBO(255, 255, 255, 1.0),
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500
                                  ),),
                                content: Container(
                                  alignment: Alignment.topLeft,
                                  child: Column(
                                    children: <Widget>[

                                      // Primer Paso de la tecera Opcion (Contacto de la tienda)
                                      Container(
                                        margin: const EdgeInsets.only(top: 10),
                                        decoration: const BoxDecoration(
                                          border: Border(bottom: BorderSide(
                                              color: Color.fromRGBO(
                                                  255, 255, 255, 1.0),
                                              width: 2
                                          )
                                          ),
                                        ),
                                        // Campo de Texto
                                        child: TextFormField(
                                          controller: contactoTienda,
                                          inputFormatters: [
                                            maskFormatterCelphone
                                          ],
                                          style: const TextStyle(
                                              color: Color.fromRGBO(
                                                  255, 255, 255, 1.0),
                                              fontSize: 17
                                          ),
                                          decoration: const InputDecoration(
                                              labelText: "Contacto de la tienda *",
                                              hintText: "2295-8478",
                                              contentPadding: EdgeInsets
                                                  .symmetric(vertical: 0.0),
                                              border: InputBorder.none,
                                              hintStyle: TextStyle(
                                                color: Color.fromRGBO(
                                                    255, 255, 255, 0.5),
                                              ),
                                              labelStyle: TextStyle(
                                                color: Color.fromRGBO(
                                                    255, 255, 255, 1.0),
                                                decorationColor: Color.fromRGBO(
                                                    255, 255, 255, 1.0),
                                              )
                                          ),
                                        ),
                                      ),

                                      // Segundo Paso de la tercera Opcion (Correo de la tienda)
                                      Container(
                                        margin: const EdgeInsets.only(top: 25),
                                        decoration: const BoxDecoration(
                                          border: Border(bottom: BorderSide(
                                              color: Color.fromRGBO(
                                                  255, 255, 255, 1.0),
                                              width: 2
                                          )
                                          ),
                                        ),

                                        // Campo de texto
                                        child: TextFormField(
                                          controller: correoTienda,
                                          style: const TextStyle(
                                              color: Color.fromRGBO(
                                                  255, 255, 255, 1.0),
                                              fontSize: 17
                                          ),
                                          decoration: const InputDecoration(
                                              labelText: "Correo de la tienda *",
                                              hintText: "ejemplo@gmail.com",
                                              contentPadding: EdgeInsets
                                                  .symmetric(vertical: 0.0),
                                              border: InputBorder.none,
                                              hintStyle: TextStyle(
                                                color: Color.fromRGBO(
                                                    255, 255, 255, 0.5),
                                              ),
                                              labelStyle: TextStyle(
                                                color: Color.fromRGBO(
                                                    255, 255, 255, 1.0),
                                                decorationColor: Color.fromRGBO(
                                                    255, 255, 255, 1.0),
                                              )
                                          ),
                                        ),
                                      ),

                                      // Tercer Paso de la tercera Opcion (Contacto movil)
                                      Container(
                                        margin: const EdgeInsets.only(top: 25),
                                        decoration: const BoxDecoration(
                                          border: Border(bottom: BorderSide(
                                              color: Color.fromRGBO(
                                                  255, 255, 255, 1.0),
                                              width: 2
                                          )
                                          ),
                                        ),

                                        // Campo de texto
                                        child: TextFormField(
                                          controller: contactoCellTienda,
                                          inputFormatters: [
                                            maskFormatterCelphone
                                          ],
                                          style: const TextStyle(
                                              color: Color.fromRGBO(
                                                  255, 255, 255, 1.0),
                                              fontSize: 17
                                          ),
                                          decoration: const InputDecoration(
                                              labelText: "Contacto móvil *",
                                              hintText: "7498-2645",
                                              contentPadding: EdgeInsets
                                                  .symmetric(vertical: 0.0),
                                              border: InputBorder.none,
                                              hintStyle: TextStyle(
                                                color: Color.fromRGBO(
                                                    255, 255, 255, 0.5),
                                              ),
                                              labelStyle: TextStyle(
                                                color: Color.fromRGBO(
                                                    255, 255, 255, 1.0),
                                                decorationColor: Color.fromRGBO(
                                                    255, 255, 255, 1.0),
                                              )
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),

                              // Cuarto paso "DETALLES ADICIONALES"
                              Step(
                                isActive: currentStep >= 3,
                                title: const Text("Detalles Adicionales",
                                  style: TextStyle(
                                      color: Color.fromRGBO(255, 255, 255, 1.0),
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500
                                  ),),
                                content: Container(
                                  alignment: Alignment.topLeft,
                                  child: Column(
                                    children: <Widget>[

                                      // Primer Paso de la cuarta Opcion (Facebook)
                                      Container(
                                        margin: const EdgeInsets.only(top: 10),
                                        decoration: const BoxDecoration(
                                          border: Border(bottom: BorderSide(
                                              color: Color.fromRGBO(
                                                  255, 255, 255, 1.0),
                                              width: 2
                                          )
                                          ),
                                        ),
                                        // Campo de Texto
                                        child: TextFormField(
                                          controller: facebook,
                                          style: const TextStyle(
                                              color: Color.fromRGBO(
                                                  255, 255, 255, 1.0),
                                              fontSize: 17
                                          ),
                                          decoration: const InputDecoration(
                                              labelText: "Facebook",
                                              hintText: "Enlace",
                                              contentPadding: EdgeInsets
                                                  .symmetric(vertical: 0.0),
                                              border: InputBorder.none,
                                              hintStyle: TextStyle(
                                                color: Color.fromRGBO(
                                                    255, 255, 255, 0.5),
                                              ),
                                              labelStyle: TextStyle(
                                                color: Color.fromRGBO(
                                                    255, 255, 255, 1.0),
                                                decorationColor: Color.fromRGBO(
                                                    255, 255, 255, 1.0),
                                              )
                                          ),
                                        ),
                                      ),

                                      // Segundo Paso de la cuarta Opcion (instagram)
                                      Container(
                                        margin: const EdgeInsets.only(top: 25),
                                        decoration: const BoxDecoration(
                                          border: Border(bottom: BorderSide(
                                              color: Color.fromRGBO(
                                                  255, 255, 255, 1.0),
                                              width: 2
                                          )
                                          ),
                                        ),

                                        // Campo de texto
                                        child: TextFormField(
                                          controller: instagram,
                                          style: const TextStyle(
                                              color: Color.fromRGBO(
                                                  255, 255, 255, 1.0),
                                              fontSize: 17
                                          ),
                                          decoration: const InputDecoration(
                                              labelText: "Instagram",
                                              hintText: "Enlace",
                                              contentPadding: EdgeInsets
                                                  .symmetric(vertical: 0.0),
                                              border: InputBorder.none,
                                              hintStyle: TextStyle(
                                                color: Color.fromRGBO(
                                                    255, 255, 255, 0.5),
                                              ),
                                              labelStyle: TextStyle(
                                                color: Color.fromRGBO(
                                                    255, 255, 255, 1.0),
                                                decorationColor: Color.fromRGBO(
                                                    255, 255, 255, 1.0),
                                              )
                                          ),
                                        ),
                                      ),

                                      // Tercer Paso de la cuarta Opcion (tiktok)
                                      Container(
                                        margin: const EdgeInsets.only(top: 25),
                                        decoration: const BoxDecoration(
                                          border: Border(bottom: BorderSide(
                                              color: Color.fromRGBO(
                                                  255, 255, 255, 1.0),
                                              width: 2
                                          )
                                          ),
                                        ),

                                        // Campo de texto
                                        child: TextFormField(
                                          controller: tiktok,
                                          style: const TextStyle(
                                              color: Color.fromRGBO(
                                                  255, 255, 255, 1.0),
                                              fontSize: 17
                                          ),

                                          decoration: const InputDecoration(
                                              labelText: "Tiktok",
                                              hintText: "Enlace",
                                              contentPadding: EdgeInsets
                                                  .symmetric(vertical: 0.0),
                                              border: InputBorder.none,
                                              hintStyle: TextStyle(
                                                color: Color.fromRGBO(
                                                    255, 255, 255, 0.5),
                                              ),
                                              labelStyle: TextStyle(
                                                color: Color.fromRGBO(
                                                    255, 255, 255, 1.0),
                                                decorationColor: Color.fromRGBO(
                                                    255, 255, 255, 1.0),
                                              )
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                    )
                  ],
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
                        // Aquí se realiza la actualización de datos
                        actualizarDatosVendedor(
                          nomNegocio.text,
                          direNegocio.text,
                          rubro.text,
                          nomPropietario.text,
                          numContacto.text,
                          correoPropietario.text,
                          contactoTienda.text,
                          correoTienda.text,
                          contactoCellTienda.text,
                          facebook.text,
                          instagram.text,
                          tiktok.text,
                        );
                      },
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.only(
                            top: 10, bottom: 10, left: 75, right: 75),
                        backgroundColor:
                        const Color.fromRGBO(255, 255, 255, 1.0),
                      ),
                      child: const Text(
                        'Actualizar',
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
  void actualizarDatosVendedor(
      String nomNegocio,
      String direNegocio,
      String rubro,
      String nomPropietario,
      String numContacto,
      String correoPropietario,
      String contactoTienda,
      String correoTienda,
      String contactoCellTienda,
      String facebook,
      String instagram,
      String tiktok,
      ) {
    // Actualiza los datos en la base de datos Firebase
    //final vendedorData = {
    //'nomNegocio': nomNegocio,
    //'direNegocio': direNegocio,
    //'rubro': rubro,
    //'nomPropietario': nomPropietario,
    //'numContacto': numContacto,
    // 'correoPropietario' : correoPropietario,
    // 'contactoTienda' : contactoTienda ,
    // 'correoTienda' : correoTienda,
    // 'contactoCellTienda' : contactoCellTienda,
    // 'facebook' : facebook,
    // 'instagram' : instagram,
    // 'tiktok' : tiktok,

    //};

    // databaseReference.child('vendedor').push().set(vendedorData);

    // Muestra un mensaje de éxito
    mostrarMensajeDeExito(context);
  }

  void mostrarMensajeDeExito(BuildContext context) {
    final snackBar = SnackBar(
      content: Text('Los datos se actualizaron con éxito.'),
      duration: Duration(seconds: 5), //  duración del mensaje.
      action: SnackBarAction(
        label: 'Cerrar',
        onPressed: () {
        },
      ),
    );

    // Muestra el SnackBar en el contexto proporcionado.
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}