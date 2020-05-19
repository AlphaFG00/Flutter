import 'package:flutter/material.dart';
import 'package:usuario_local_storage/pages/home_page.dart';
import 'package:usuario_local_storage/pages/settings_page.dart';
import 'package:usuario_local_storage/shared_preferences/preferencias_user.dart';
 
void main() async { 
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = new PreferenciasUsuario();
  await prefs.initPrefs();
  runApp(MyApp());
  
  }
 
class MyApp extends StatelessWidget {

  final prefs = new PreferenciasUsuario();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //para ver la ultima ruta en donde se quedo el usuario
     initialRoute: prefs.ultimaRuta,
     routes: {
        HomePage.routeName : (BuildContext context) => HomePage(),
         SettingsPage.routeName : (BuildContext context) => SettingsPage()
     },
    );
  }
}