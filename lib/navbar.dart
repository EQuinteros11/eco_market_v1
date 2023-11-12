import 'package:flutter/material.dart';
import 'package:uno/Cliente/PrincipalCliente.dart';
import 'package:uno/Cliente/cliente_carrito.dart';
import 'package:uno/Cliente/cliente_editar_cuenta.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:uno/Cliente/cliente_recomendaciones.dart';
import 'package:uno/vista_principal.dart';

import 'Pages/pedidos_lista.dart';
import 'models/global_var.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(

      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: const Text('ECO MARKET'),
            accountEmail:  Text(ver),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(child: Image.asset('assets/menu/Logo.jpg')),
            ),
            decoration: const BoxDecoration(
                color: Colors.grey,
                image: DecorationImage(
                    image: AssetImage('assets/menu/Principal.png'), fit: BoxFit.cover)
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home, color: Color.fromRGBO(73, 80, 91, 1.0), size: 30.0),
            title: const Text('Pagina Principal'),
            onTap: () => Navigator.push( context, MaterialPageRoute(builder: (context) => const VistaPrincipalCliente() )),
          ),
          ListTile(
            leading: const Icon(Icons.account_circle, color: Colors.orange, size: 30.0),
            title: const Text('Actualizar Perfil'),
            onTap: () => Navigator.push( context, MaterialPageRoute(builder: (context) => const UpdateCliente() )
            ),
          ),
          ListTile(
            leading: const Icon(Icons.shopping_cart, color: Colors.cyan, size: 30.0),
            title: const Text('Mis Compras'),
            onTap: () => Navigator.push( context, MaterialPageRoute(builder: (context) =>  Cart() )
            ),
          ),
          ListTile(
            leading: const Icon(Icons.add_business_rounded, color: Colors.green, size: 30.0),
            title: const Text('Recomendaciones'),
            onTap: () => print('business Rounded'),
          ),
          ListTile(
            leading: const Icon(Icons.message, color: Colors.blue, size: 30.0),
            title: const Text('Contactanos'),
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const ClienteRecomendacion() )),
          ),
          ListTile(
            leading: const Icon(Icons.share, size: 30.0),
            title: const Text('Compartir'),
            onTap: () => print('Share tapped'),
          ),
          ListTile(
            leading: const Icon(Icons.notifications, color: Colors.amber, size: 30.0),
            title: const Text('Notificaciones'),
            onTap: () => print('Notifications tapped'),
          ),
          ListTile(
            leading: const Icon(Icons.settings, size: 30.0),
            title: const Text('Ajustes'),
            onTap: () => print('Settings tapped'),
          ),
          const Expanded(
              child: ListTile()
          ),
          ListTile(
            leading: const Icon(Icons.logout, color: Colors.black, size: 30.0),
            title: const Text('Salir'),
            onTap: () => AwesomeDialog(
                context: context,
              dialogType: DialogType.info,
              animType: AnimType.topSlide,
              showCloseIcon: true,
              title: "Cerrar Sesión",
              desc: "¿Esta seguro que desea cerrar la sesión?",
              btnCancelOnPress: (){},
              btnOkOnPress: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const VistaPrincipal() )
                  );
              },
              btnOkText: "Aceptar",
              btnOkColor: const Color.fromRGBO(127, 166, 231, 1.0),
              btnCancelText: "Cancelar",
              btnCancelColor: const Color.fromRGBO(243, 151, 151, 1.0),
              // btnOkIcon: Icons.check_circle_outline,
            ).show(),
          ),
        ],
      ),
    );
  }
}

/*
void _confirmacionCerrarSesion( BuildContext context ){
  showDialog(
    barrierDismissible: false,
    context: context,
    ch

  );
}
*/