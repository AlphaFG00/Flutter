//import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/material.dart';
import 'package:qrscanner/bloc/scans_bloc.dart';
import 'package:qrscanner/models/scan_model.dart';
import 'package:qrscanner/pages/mapas_page.dart';
import 'package:qrscanner/pages/page_direcciones.dart';
import 'package:qrscanner/utils/utils.dart';
//import 'package:sqflite/sqflite.dart';


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

   _scanQR(BuildContext context) async{
     
     //http://google.com
     //geo:19.414042304313835,-99.12394895991214


     dynamic futureString;

      if(futureString != null){

        final scan = ScanModel(valor: futureString);
        scansBloc.agregarScan(scan);

       

        abrirScan(scan,context);


      }
  }

}