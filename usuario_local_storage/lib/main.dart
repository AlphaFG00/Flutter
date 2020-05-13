import 'package:flutter/material.dart';
import 'package:usuario_local_storage/pages/home_page.dart';
import 'package:usuario_local_storage/pages/settings_page.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     initialRoute: HomePage.routeName,
     routes: {
        HomePage.routeName : (BuildContext context) => HomePage(),
         SettingsPage.routeName : (BuildContext context) => SettingsPage()
     },
    );
  }
}