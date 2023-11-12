import 'package:flutter/material.dart';
import 'package:uno/Cliente/PrincipalCliente.dart';
import 'package:uno/Cliente/cliente_recomendaciones.dart';
import 'package:uno/creacion_cuenta_vendedor.dart';
import 'package:uno/seleccion_creacion_tipo_cuenta.dart';
import 'package:uno/vista_principal.dart';

import 'Cliente/cliente_categorias.dart';
import 'Cliente/inicio_sesion_cliente.dart';
import 'Pages/otra_pagina.dart';
import 'Pages/pedidos_lista.dart';
import 'inicio_sesion_vendedor.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

// Dependencias de Firebase
import 'package:firebase_core/firebase_core.dart';
import 'package:uno/firebase_options.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await Future.delayed( const Duration( seconds: 3 ) );
  FlutterNativeSplash.remove();
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'ECO MARKET',
        initialRoute: "vistaPrincipal",
        routes: <String, WidgetBuilder>{
          "vistaPrincipal": (context) =>VistaPrincipal(),
          "creacionTipoCuenta": (context) => Creacion_Cuenta(),
          "creacionCuentaCliente": (context) => Creacion_Cuenta(),
          "creacionCuentaVendedor": (context) => CreacionCuentaVendedor(),
          "inicioSesionVendedor": (context) => InicioSesionVendedor(),
          "InicioSesionCliente": (context) => MyAppForm(),
          "vistaPrincipalCliente": (context) => VistaPrincipalCliente(),
          "vistaClienteRecomendacion": (context) => ClienteRecomendacion(),
          "vistaClienteCategorias": (context) => ClienteCategorias(),
        },
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromRGBO(73, 80, 91, 1.0)),
          useMaterial3: true,
        ),
      );
  }

}