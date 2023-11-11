import 'package:flutter/material.dart';

import '../navbar.dart';
import 'cliente_detalle_pagina_ofertas.dart';

class ClienteOfertas extends StatefulWidget {
  const ClienteOfertas({super.key});

  @override
  State<ClienteOfertas> createState() => _ClienteOfertasState();
}

class _ClienteOfertasState extends State<ClienteOfertas> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavBar(),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(157, 160, 166, 1.0),
        foregroundColor: const Color.fromRGBO(65, 90, 119, 1.0),
      ),
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/imagenescliente/VistaPrincipal.png"),
                fit: BoxFit.cover
            )
        ),
       child : ListView(
          padding: EdgeInsets.all(10.0),
          children: <Widget>[

            SizedBox(height: 25.0,),
            Padding(padding: EdgeInsets.only(left: 5.0)),

            Text("ECO_MARKET",
              style: new TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25.0,
                  color: Colors.white
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Container(

              height: MediaQuery.of(context).size.height -105.0,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topRight: Radius.circular(75.0), bottomLeft: Radius.circular(75.0))

              ),

              child: ListView(
                padding: EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
                children: <Widget> [
                  Padding(padding: EdgeInsets.only(top: 30.0),
                    child: Container(
                      height: MediaQuery.of(context).size.height - 200.0,
                      child: GridView.count(
                        crossAxisCount: 2,
                        mainAxisSpacing: 0.1,
                        childAspectRatio: 0.700,
                        children: <Widget>[
                          _ComidaItem('Banano',30,'Tienda ETK','assets/imagenescliente/uno.png'),
                          _ComidaItem('Naránja',25,'The Best','assets/imagenescliente/dos.png'),
                          _ComidaItem('kiwi',25,'Dchoto','assets/imagenescliente/tres.png'),
                          _ComidaItem('Manzanas',25,'La Doña','assets/imagenescliente/cuatro.png'),
                          _ComidaItem('Aguacate',25,'Tienda ETK','assets/imagenescliente/cinco.png'),
                          _ComidaItem('Cilantro',25,'OfertaVis','assets/imagenescliente/seis.jpg'),
                        ],

                      ),
                    ),
                  ),
                ],
              ),


            ),
          ]
      ),),
    );
  }
  Widget _ComidaItem(String nombre, int precio,String tienda, String imagen){
    return Padding(padding: EdgeInsets.all(3.0),
      child: Container(
        child: Card(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0)
          ),
          color: const Color(0xFFE6E4EB),
          elevation: 5,
          child: Column(
            children: <Widget> [
              Hero(
                tag: imagen,
                child: Material(
                  color:  Color(0xFFE6E4EB),
                  child: InkWell(
                    onTap: ()=> Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context)=>DetallePagina(
                          nombre: nombre,
                          precio: precio,
                          tienda: tienda,
                          image: imagen,
                        ),
                      ),
                    ),
                    child: Image.asset(
                      imagen, fit: BoxFit.contain,
                      width:130, height: 130,
                    ),
                  ),
                ),
              ),
              const Padding(padding: EdgeInsets.all(3.0),),
              Text(tienda,
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                    color: Colors.black
                ),
              ),
              const Padding(padding: EdgeInsets.all(3.0),),
              Text(nombre,
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                    color: Colors.black
                ),
              ),
              const Padding(padding: EdgeInsets.all(3.0),),
              Text(precio.toString(),
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                    color: Colors.black
                ),
              ),

            ],
          ),
        ),
      ),

    );
  }
}
