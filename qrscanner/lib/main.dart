import 'package:flutter/material.dart';
import 'package:qrscanner/pages/home_page.dart';
import 'package:qrscanner/pages/mapas_page.dart';
import 'package:qrscanner/pages/page_direcciones.dart';
import 'package:qrscanner/pages/viewmapa_pages.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
     title: 'QRReader',
     initialRoute: 'home',
     routes: {
       'home' : (BuildContext context) => HomePage(),
       'mapas': (BuildContext context) => MapasPage(),
       'direcciones': (BuildContext context) => PageDirecciones(),
       'mapa': (BuildContext context) => MapaPage(),

     },
     theme: ThemeData(
       primaryColor: Colors.deepPurpleAccent
     ),
    );
  }
}