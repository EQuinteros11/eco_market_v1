import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PantallaPago extends StatefulWidget {
  final double montoTotal;

  PantallaPago({Key? key, required this.montoTotal}) : super(key: key);

  @override
  _PantallaPagoState createState() => _PantallaPagoState();
}

class _PantallaPagoState extends State<PantallaPago> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<Map<String, dynamic>> obtenerDatosPago() async {
    try {
      var documento = await FirebaseFirestore.instance.collection('billetera').doc('T8mKBK2ikDxIZmz1tdzj').get();
      return {
        'imagen': 'https://firebasestorage.googleapis.com/v0/b/ecomarket-c2160.appspot.com/o/qr.jpeg?alt=media&token=979ae283-ed59-49a3-ae99-0989f05a5d1f',
        'direccion': documento.data()?['direccion'] ?? 'Dirección por defecto'
      };
    } catch (e) {
      print("Ocurrió un error: $e");
      return {};
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(157, 160, 166, 1.0),
          foregroundColor: const Color.fromRGBO(65, 90, 119, 1.0),
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/img/listadoTiendasCliente.png"),
                    fit: BoxFit.cover)),
            child: FutureBuilder<Map<String, dynamic>>(
              future: obtenerDatosPago(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done && snapshot.hasData) {
                  var datos = snapshot.data!;
                  return Column(
                    children: [
                      SizedBox(height: 20),
                      Text(
                        "Monto a Pagar: \$${widget.montoTotal.toStringAsFixed(2)}",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 20),
                      Image.network(datos['imagen']),
                      SizedBox(height: 20),
                      Text(
                        "Dirección de la Billetera: ${datos['direccion']}",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 20),
                    ],
                  );
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}

