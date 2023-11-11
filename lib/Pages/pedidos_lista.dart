import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:uno/Pages/otra_pagina.dart';
import 'package:uno/models/global_var.dart';
import 'package:uno/models/mult.dart';
import 'package:uno/services/firebase_services_cliente.dart';



import '../models/carro.dart';
import '../navbar.dart';

class Cart extends StatefulWidget {
  @override
  State<Cart> createState() => _CartState();
}

List<carro> _Total=[] ;
var totall= 0.00;
class _CartState extends State<Cart> {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        drawer: const NavBar(),
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(157, 160, 166, 1.0),
          foregroundColor: const Color.fromRGBO(65, 90, 119, 1.0),
          elevation: 0,
        ),
       body: SingleChildScrollView(
          child: Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/img/listadoTiendasCliente.png"),
                    fit: BoxFit.cover)),
            child: Column(
              children:<Widget> [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                            color: Color.fromRGBO(255, 255, 255, 1.0),
                            borderRadius:
                            BorderRadius.all(Radius.circular(50))),
                        child: IconButton(
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) =>otra_pagina(),
                              ),
                            );
                          },
                          style: TextButton.styleFrom(
                              padding: const EdgeInsets.all(10),
                              backgroundColor:
                              const Color.fromRGBO(255, 255, 255, 1.0)),
                          icon: const Icon(
                            Icons.arrow_back,
                            size: 25,
                          ),
                          tooltip: "Regresar",
                        ),
                      ),
                      const Text(
                        "Productos",
                        style: TextStyle(
                            color: Color.fromRGBO(255, 255, 255, 1.0),
                            fontWeight: FontWeight.w700,
                            fontSize: 25),
                      ),
                      const SizedBox(
                        width: 25,
                      ),
                    ],
                  ),
                ),
                Container(
                  child: listadoCarrito(),
                )

              ],
            ),

          ),
        ),
      ),

    );

  }
  Widget listadoCarrito() {
    return Container(
        child: FutureBuilder(
            future: getCarrito(),
            builder: ((context, snapshot) {
              if (snapshot.hasData) {
                return Container(
                  child:Column(
                    children:<Widget> [
                      GridView.builder(
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount (
                            crossAxisCount: 1,
                            childAspectRatio: ( 3.0 ),
                            crossAxisSpacing: 15,
                            mainAxisSpacing: 5,
                          ),
                          physics: const ScrollPhysics(),
                          itemCount: snapshot.data?.length,
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            _Total.add(carro(total: snapshot.data?[index]['precio']));
                            return Card(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                                    child: Column(
                                      children: <Widget>[
                                        Row(
                                          children: <Widget>[
                                            Container(
                                              child: CachedNetworkImage(
                                                width: 150,
                                                height: 80,
                                                imageUrl: '${snapshot.data?[index]['imagen']}',
                                                fit: BoxFit.contain,
                                              ),
                                            ),
                                            Column(
                                              children: <Widget>[
                                                Text(
                                                  snapshot.data?[index]['producto'] ??
                                                      'Sin registro...',
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      fontSize: 15.0,
                                                      color: Colors.black,
                                                      fontWeight: FontWeight.w900,
                                                      fontFamily: 'Raleway'),
                                                ),

                                                Text(
                                                  "\$ ${snapshot.data?[index]['precio'].toStringAsFixed(2)}" ??
                                                      'Sin registro...',
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      fontSize: 15.0,
                                                      color: Colors.black,
                                                      fontWeight: FontWeight.w900,
                                                      fontFamily: 'Raleway'),
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                                  children: <Widget>[
                                                    Padding(padding: EdgeInsets.symmetric(horizontal: 1)),
                                                    Container(
                                                      width: 150,
                                                      height: 40,
                                                      decoration: BoxDecoration(
                                                        color: Colors.red[600],
                                                        boxShadow: [
                                                          BoxShadow(
                                                              blurRadius: 6.0,
                                                              color: Colors.blue,
                                                              offset: Offset(0.0, 1.0))
                                                        ],
                                                        borderRadius: BorderRadius.all(
                                                            Radius.circular(50.0)),
                                                      ),
                                                      margin:
                                                      EdgeInsets.only(top: 10.0),
                                                      child: new Row(
                                                        mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                        children: <Widget>[
                                                          InkWell(
                                                            child: Icon(Icons.remove,color: Colors.white, size: 40,),
                                                            onTap: () {
                                                              setState(() {
                                                                transactions_passingInformationOutOfTransactionsmenos(index,snapshot.data?[index]['producto']);
                                                              });
                                                            },

                                                          ),

                                                          Text(
                                                            "${snapshot.data?[index]['cantidad']}",
                                                            textAlign: TextAlign.center,
                                                            style: TextStyle(
                                                                fontSize: 16.0,
                                                                color: Colors.white,
                                                                fontWeight:
                                                                FontWeight.bold,
                                                                fontFamily: 'Raleway'),

                                                          ),

                                                          GestureDetector(
                                                            child: Icon(Icons.add,
                                                              color: Colors.white,
                                                              size: 40,
                                                            ) ,
                                                            onTap: (){
                                                              setState(() {
                                                                totall = 0.00;
                                                                transactions_passingInformationOutOfTransactions.call(index);

                                                              });
                                                            },
                                                          ),

                                                        ],
                                                      ),
                                                    ),
                                                    GestureDetector(
                                                      child: Icon(Icons.delete_rounded,
                                                      size: 45,
                                                      color: Colors.blueGrey,),
                                                      onTap: (){
                                                        setState(() {
                                                          totall = 0.00;

                                                          db.collection("carrito").where("producto", isEqualTo: snapshot.data?[index]['producto']).get().then(
                                                                (querySnapshot) {
                                                              print("Successfully completed");
                                                              for (var docSnapshot in querySnapshot.docs) {
                                                               db.collection("carrito").doc("${docSnapshot.id}").delete().then(
                                                                      (doc) => print("Document deleted"),
                                                                  onError: (e) => print("Error updating document $e"),
                                                                );
                                                              }
                                                            },
                                                            onError: (e) => print("Error completing: $e"),
                                                          );

                                                        });

                                                      },
                                                    )
                                                  ],
                                                )
                                              ],
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );

                          }),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.only(left: 120),
                            height: 50,
                            color: Colors.grey[200],
                            child: Row(

                              children: <Widget>[
                                Text(
                                  "Total:",
                                  style: TextStyle(
                                      fontSize: 24.0,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Raleway'),
                                )
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 12),
                            height: 45,
                            color: Colors.grey[200],
                            child: Row(
                              children: <Widget>[
                                GestureDetector(
                                  child: Text(totall.toString()),
                                  onTap: (){
                                    setState(() {
                                      totall = 0.00;
                                      for (var i = 0; i < snapshot.data!.length ; i++) {
                                        totall += snapshot.data?[i]['precio'] * snapshot.data?[i]['cantidad'];

                                      }
                                    });
                                  },

                                ),

                              ],
                            ),
                          ),

                        ],
                      ),
                      Padding(padding: EdgeInsets.only(bottom: 10)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:<Widget> [
                         ElevatedButton(
                           style: ElevatedButton.styleFrom(
                             primary: Colors.green,
                             // side: BorderSide(color: Colors.yellow, width: 5),
                             textStyle: const TextStyle(
                                 color: Colors.white, fontSize: 25, fontStyle: FontStyle.normal),
                             shape: BeveledRectangleBorder(
                                 borderRadius: BorderRadius.all(Radius.circular(10))),
                           ),
                           child: Text("Comprar"),
                           onPressed: () =>{},)
                        ],
                      ),

                    ],)
                );

                //------
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            })));


  }


 double _Compratotal(item){
    double cumulo = 0;
   for (var i = 0; i < item ; i++) {
    final sfDocRef = db.collection("carrito").doc("${i}");
     db.runTransaction((transaction)async{
       final snapshot = await transaction.get(sfDocRef);

       var newPopulation = snapshot.get("cantidad");
        print(newPopulation);
     });
    cumulo += _Total[i].total;
   }
   return cumulo;
 }
FirebaseFirestore db = FirebaseFirestore.instance;
transactions_passingInformationOutOfTransactions(i)  {
  setState(() {
    final sfDocRef = db.collection("carrito").doc("${i}");
    db.runTransaction((transaction)async{
      final snapshot = await transaction.get(sfDocRef);

      var newPopulation = snapshot.get("cantidad");
      newPopulation++;
      transaction.update(sfDocRef, {"cantidad":newPopulation});
    }).then((value) => print("realizado se sumo"),
        onError: (e) => print("Error updating document $e")
    );

  });

}
transactions_passingInformationOutOfTransactionsmenos(i,cero)  {
  setState(() {
    final sfDocRef = db.collection("carrito").doc("${i}");
    db.runTransaction((transaction)async{
      final snapshot = await transaction.get(sfDocRef);


      var newPopulation = snapshot.get("cantidad");
      if (newPopulation == 1){
        totall = 0.00;

        db.collection("carrito").where("producto", isEqualTo: cero).get().then(
              (querySnapshot) {
            print("Successfully completed");
            for (var docSnapshot in querySnapshot.docs) {
              print(docSnapshot.id);
              db.collection("carrito").doc("${docSnapshot.id}").delete().then(
                    (doc) => print("Document deleted"),
                onError: (e) => print("Error updating document $e"),
              );
            }
          },
          onError: (e) => print("Error completing: $e"),
        );
        print("no acepta valores cero o negativos");
      }
      else{
        newPopulation--;
        transaction.update(sfDocRef, {"cantidad":newPopulation});
      }

    }).then((value) => print("realizado se resto"),
        onError: (e) => print("Error updating document $e")
    );
  });

}



}





