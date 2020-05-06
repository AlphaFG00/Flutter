//poner guión bajo en vez de espacios o guiones
import  'package:flutter/material.dart';



class HomePage extends StatelessWidget{


//CREAR un atajo de estilo
final estiloTexto = new TextStyle(fontSize: 30);
final botonaumento = 10;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('el titulo alv!'),
        centerTitle: true,
      ),
      //la mayoria de los widgets solo pueden tener un hijo
      body: Center(
        child: Column(

          mainAxisAlignment: MainAxisAlignment.center ,
          children: <Widget>[
            Text ('Numero de Clicks', style: estiloTexto,),
            Text ('$botonaumento', style: estiloTexto,),

  
          ],
        )  
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add_circle_outline),
        onPressed: () {


          print('Hola Mundo!');
        
        
        },
      ) ,
          floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
    throw UnimplementedError();
  }

}