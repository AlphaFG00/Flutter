
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/basic.dart';

class ContadorPage extends StatefulWidget{

 

  @override
  createState(){
    return _ContadorPageState();
  }



}
// _ define una clase privada en un archivo

        //es un estandar poner State, guion bajo lo hace privado
class _ContadorPageState extends State <ContadorPage>{


final _estiloTexto = new TextStyle(fontSize: 30);
int _conteo=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('el titulo alv! de Stateful'),
        centerTitle: true,
      ),
      //la mayoria de los widgets solo pueden tener un hijo
      body: Center(
        child: Column(

          mainAxisAlignment: MainAxisAlignment.center ,
          children: <Widget>[
            Text ('Numero de Clicks', style: _estiloTexto,),
            Text ('$_conteo', style: _estiloTexto,),

  
          ],
        )  
       

      ),
        floatingActionButton: _crearBotones()
         );
    throw UnimplementedError();
  }

  Widget _crearBotones(){

      return Row(
          children: <Widget>[
             
        Expanded(
           child: FloatingActionButton(
              child: Icon(Icons.add_circle_outline),
              onPressed: () {


                print('Mas!');
                
                //para que se vea el cambio en el widget 
                setState(() {
                  _conteo++;
                });
              
              },
            ) ,
             
        ),
              // 
         Expanded(
           child: FloatingActionButton(
              child: Icon(Icons.remove),
              onPressed: () {
                print('menos!');
                //para que se vea el cambio en el widget 
                setState(() {
                  _conteo--;
                });
              },
            ) , 
         ),
         Expanded(
            child:FloatingActionButton(
              child: Icon(Icons.exposure_zero),
              onPressed: () {
                print('a cero!');
                //para que se vea el cambio en el widget 
                setState(() {
                  _conteo=0;
                });
              },
            )  ,
         ),   
        ],
      );  
  }

}//solo se utiliza dentro de la misma

