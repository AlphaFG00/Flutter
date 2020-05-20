//import 'package:barcode_scan/barcode_scan.dart';
import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/material.dart';
import 'package:qrscanner/bloc/scans_bloc.dart';
import 'package:qrscanner/models/scan_model.dart';
import 'package:qrscanner/pages/mapas_page.dart';
import 'package:qrscanner/pages/page_direcciones.dart';
import 'package:qrscanner/utils/utils.dart' as utils;
//import 'package:sqflite/sqflite.dart';
import 'dart:io';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
 
  int currentIndex = 0;
  final scansBloc = new ScansBloc();

 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quu Erre Escanner'),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.delete_forever)
              ,onPressed:(){

                scansBloc.borrarTodos();

              },),
          
        ],
      ),
      body: _callPage(currentIndex),
        bottomNavigationBar: _crearBottomNavBar(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.filter_center_focus),
          onPressed: ()=> _scanQR(context),
          backgroundColor: Theme.of(context).primaryColor,
        ),
    );
  }

  Widget _crearBottomNavBar (){

    return BottomNavigationBar(
       
        currentIndex:currentIndex,
        onTap: (index){
          setState(() {
            currentIndex = index;
          });

        },
          items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.ac_unit),
            title: Text('Mapas')
            ),
           BottomNavigationBarItem(
            icon: Icon(Icons.camera_alt),
            title: Text('Direcciones')
            ),
          ]


        

    
    );


  }

  Widget _callPage(int paginaActual){

    switch (paginaActual) {
      case 0:
         return MapasPage();
        break;
      case 1:
        return PageDirecciones();

      default:
      return MapasPage();
    }

  }

    _scanQR(BuildContext context) async {

    // https://fernando-herrera.com
    // geo:40.724233047051705,-74.00731459101564

    // String futureString = '';
    String futureString;

    try {
      // futureString = await new QRCodeReader().scan();
      futureString = await BarcodeScanner.scan();
    } catch(e) {
      futureString = e.toString();
    }

    if ( futureString != null ) {
      
      final scan = ScanModel( valor: futureString );
      scansBloc.agregarScan(scan);      

      if ( Platform.isIOS ) {
        Future.delayed( Duration( milliseconds: 750 ), () {
          utils.abrirScan(scan, context);    
        });
      } else {
        utils.abrirScan(scan, context);
      }

    }
     

  }
}