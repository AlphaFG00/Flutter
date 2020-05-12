import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class BotonesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(

        children: <Widget>[
          _fondoApp(),
          SingleChildScrollView(
            child: Column(
              children: <Widget>[
                _titulos(),
                _botonesRedondos(),
              ],
              
            ) 
          )

        ],

      ),
      bottomNavigationBar: _bottomNavigationBar(context)
    );
  }


  Widget _fondoApp(){

      //gradiente del fondo:

      final gradiente = Container(

        width: double.infinity,
        height:  double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromRGBO(52, 54, 101, 1.0),
              Color.fromRGBO(35, 37, 57, 1.0)
            ],
            begin:FractionalOffset(0.0, 0.6) ,
            end:FractionalOffset(0.0, 1.0),
            )
          ),

      );

    //caja rosa

    final cajaRosa =  Transform.rotate(
    angle: -pi /5.0,
    child: Container(
      height: 360.0,
      width: 360.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(90.0),
        gradient: LinearGradient(
          colors: [
            Color.fromRGBO(236, 98, 188, 1.0),
            Color.fromRGBO(241, 142, 172, 1.0)
          ],
          begin:  FractionalOffset(0.0, 0.2),
          end: FractionalOffset(0.0, 1.2)
          )
      ),

    ),
    );
    

      return Stack(
        children: <Widget>[
          gradiente,
          Positioned(
            child: cajaRosa,
            top: -100,
            
            )
        ],
      );


  }

  Widget _titulos(){

    return SafeArea(
          child: Container(
            padding: EdgeInsets.only(right:160.0, bottom:20.0),
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[

          Text('Botoncines', style: TextStyle(fontSize: 30.0 , color:Colors.white, fontWeight: FontWeight.bold),),
          SizedBox(height:10.0),
          Text('medio mamones, pero bonitos', style: TextStyle(fontSize: 15.0 , color:Colors.white,),),

          ],
        )
      ),
    );
  

  }

  Widget _bottomNavigationBar(BuildContext context){
    //widget con tema personalizado
    return Theme(
      data: Theme.of(context).copyWith(
        canvasColor: Color.fromRGBO(55, 57, 84, 1.0),
        primaryColor: Colors.pinkAccent,
        textTheme:  Theme.of(context).textTheme.copyWith(
          caption:TextStyle(color: Color.fromRGBO(116, 117, 152, 1.0)),
        )
      ),
      child: BottomNavigationBar(
        
        items:[
          BottomNavigationBarItem( icon: Icon( Icons.calendar_today , size:30.0),
          title: Container(),
          ),
          BottomNavigationBarItem( icon: Icon( Icons.calendar_today , size:30.0),
          title: Container(),
          ),
          BottomNavigationBarItem( icon: Icon( Icons.calendar_today , size:30.0),
          title: Container(),
          )
         
        ] ,

        
      )
      );

  }

  Widget _botonesRedondos(){

    return Table(

      children: [

        TableRow(
          children:[
            _botonRedondeado(Colors.blue, Icons.border_all,'Ventanas'),
            _botonRedondeado(Colors.red, Icons.move_to_inbox,'Descargar'),
          ]
        ),
         TableRow(
          children:[
            _botonRedondeado(Colors.indigo, Icons.star,'Favoritos'),
            _botonRedondeado(Colors.green, Icons.access_alarm,'Alarma'),
          
          ]
        ),
         TableRow(
          children:[
            _botonRedondeado(Colors.orange, Icons.cloud_circle,'Cloud'),
            _botonRedondeado(Colors.grey, Icons.terrain,'Montañas XD '),
          
          ]
        ),
      ]
    );
  }

  Widget _botonRedondeado (Color color, IconData icono, String texto){

    return ClipRRect(
          child: BackdropFilter(
        //enfoque de elementos al frente para desenfocar el fondo
        filter: ImageFilter.blur(
          sigmaX: 10.0,
          sigmaY: 10.0
        ),
            child: Container(
          height: 180.0,
          margin: EdgeInsets.all(15.0),
          decoration: BoxDecoration(color: Color.fromRGBO(62, 66, 107, 0.7),
          borderRadius: BorderRadius.circular(20.0)
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              SizedBox(height:5.0),
              CircleAvatar(
                backgroundColor: color,
                radius:40.0,
                child: Icon(icono ,
                color:Colors.white,
                size:30.0
                )
              ),
              Text(texto, style:TextStyle(color: color)),
              SizedBox(height: 5.0)

            ]
          ),

        ),
      ),
    );

  }

}
