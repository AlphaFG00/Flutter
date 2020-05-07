import 'package:flutter/material.dart';


class AlertPage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title:  Text('AlterPage')
        
        ),
        body: Center(child: RaisedButton(child: Text('Mostrar Alerta'),
        color: Colors.blue,
        textColor: Colors.white,
        onPressed: () => _mostrarAlert(context ),
        //borde redondeado
        shape: StadiumBorder(),
        

        )
        ),
      floatingActionButton: FloatingActionButton(child: Icon(Icons.add_location),
      onPressed: (){
        //regresar
        Navigator.pop(context);
      },),
    );
    
  }


void _mostrarAlert(BuildContext context){
  showDialog(
    context:context,
    //cerrar alerta haciendo click afuera
    barrierDismissible: true,
    builder: (context) => AlertDialog(title: Text('que pedal'),
    shape: RoundedRectangleBorder(
      
      borderRadius: BorderRadius.circular(20.0),
     
      
      ),
    content: Column(
      //ajusta el texto para que no se expanda
      mainAxisSize: MainAxisSize.min ,
      children: <Widget>[
        Text('contenido de la caja'),
        FlutterLogo( size: 100.0,)
      ]
    ),
    actions: <Widget>[
      FlatButton(
        //para salirse de una alerta al presionar un boton
        onPressed: () => Navigator.of(context).pop(),
        child: Text('CAncelar')
        ),
         FlatButton(
        onPressed: (){
          Navigator.of(context).pop();
        },
        child: Text('OK')
        )
    ],
    ),

    );
}

}