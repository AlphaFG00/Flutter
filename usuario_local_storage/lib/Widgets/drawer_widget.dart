import 'package:flutter/material.dart';
import 'package:usuario_local_storage/pages/home_page.dart';
import 'package:usuario_local_storage/pages/settings_page.dart';

class MenuHamburguesa extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[

          DrawerHeader(
            child: Container(
            ),
            decoration: BoxDecoration(
              
              image: DecorationImage(
              image: AssetImage('lib/img/original.jpg'),
              fit: BoxFit.cover
              )
              
             ),
            ),
            ListTile(
              leading: Icon (Icons.pages, color: Colors.blue),
              title:  Text('JOM'),
              onTap: () => Navigator.pushReplacementNamed(context, HomePage.routeName),
              
            ),
            ListTile(
              leading: Icon (Icons.account_box, color: Colors.blue),
              title:  Text('relleno'),
              onTap: (){},
              
            ),
            ListTile(
              leading: Icon (Icons.settings, color: Colors.blue),
              title:  Text('settings'),
              //router para cerrar el menu de hamburguesa
              //despues de navegar a otra pagina
              //y queremos que no regrese a la pagina anterior (Como un login)
              onTap: () {

                Navigator.pushReplacementNamed(context, SettingsPage.routeName);

              },
            )
        ],

      )
      ,
    );
  }
}