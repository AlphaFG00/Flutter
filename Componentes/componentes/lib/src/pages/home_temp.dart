import 'package:flutter/material.dart';

class HomePageTemp extends StatelessWidget{
  
  final opciones = ['uno', 'dos', 'tres','cuatro','cinco'];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Componentes2 TEMP')
      ),
      body: ListView(
        children: _crearItemsCorto()
        //children: _crearItems()
      ),
    );
  }//build
//listado de widgets:
 /*
  List<Widget> _crearItems(){

    //forma uno:
    List<Widget> lista = new List<Widget>();
    for(String opt in opciones){
      final tempWidget = ListTile(
        title: Text(opt), 
      );
      lista..add(tempWidget)
            ..add(Divider());
    }



    return lista;
  }
  */
  //Forma 2
  List<Widget> _crearItemsCorto(){
  
      return opciones.map((item){

        return Column(children: <Widget>[
            ListTile(
          title:  Text(item + '!'),
          subtitle: Text('cualquier cosa'),
          leading: Icon(Icons.art_track) ,
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: (){},
            ),
            Divider()
        ],
        );
      }).toList();
    
  }


}