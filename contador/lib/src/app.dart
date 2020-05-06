import 'package:contador/src/pages/contador_page.dart';
//import 'package:contador/src/pages/home_page.dart';
import 'package:flutter/material.dart';


class MyApp extends StatelessWidget{
//sobreescribir un metodo
  @override
  //contexto contiene la informacion del arbol de widget
  Widget build(context){


    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Center(
        child: ContadorPage(),
      ),
      
       
    );
    
  }


}
