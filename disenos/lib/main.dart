import 'package:disenos/pages/basic_pages.dart';
import 'package:disenos/pages/botones_page.dart';
import 'package:disenos/pages/scroll_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
//import 'package:flutter/services.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    //cambiar colores de la barra que contiene el wifi, la hora, etc
    
   SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
     statusBarColor: Colors.transparent
    ));

    return MaterialApp(
     debugShowCheckedModeBanner: false,
      title: 'Diseños',
      initialRoute: 'botones',
      routes:{
        'basico' : (BuildContext context) => BasicPage(),
        'scroll' : (BuildContext context) => ScrollPage(),
        'botones': (BuildContext context) => BotonesPage(),
        
      }
     
    );
  }
}