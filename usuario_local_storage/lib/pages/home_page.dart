import 'package:flutter/material.dart';
import 'package:usuario_local_storage/Widgets/drawer_widget.dart';
import 'package:usuario_local_storage/shared_preferences/preferencias_user.dart';

class HomePage extends StatelessWidget {

  static final String routeName= 'home';
final prefs = new PreferenciasUsuario();

  @override
  Widget build(BuildContext context) {
   
       prefs.ultimaRuta = HomePage.routeName;


    return Scaffold(
      appBar: AppBar(
        title:Text('Preferencias de Usuario'),
        backgroundColor: (prefs.color) ? Colors.green : Colors.lime
      ),
      //crear menu lateral
      drawer: MenuHamburguesa(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('Color Secundario ${prefs.color}'),
          Divider(),
          Text('Genero ${prefs.genero} '),
          Divider(),
          Text('Username ${prefs.nombre}'),
          Divider(),
        ]
      ),
    );
  }

 


}