import 'package:flutter/material.dart';
import 'package:peliculas/src/pages/home_page.dart';
import 'package:peliculas/src/pages/pelicula_detalle.dart';

 //Stream: flujo de informacion en una sola via, ejemplo de mario bros
 //BLOC: forma para manejar el estado de la data de una app,
 //Business Logic Component, Trabaja en Base a Streams,
 //trabaja de manerio I/O , input con sink, output con stream
 //es importante cerrar el stream 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Peliculas',
      initialRoute: '/',
      routes: {
        '/' : (BuildContext context) => HomePage(),
        'detalle' : (BuildContext context) => PeliculaDetalle(),

      },
    );
  }
}