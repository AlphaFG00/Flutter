import 'package:componentes/src/providers/menu_provider.dart';
import 'package:componentes/src/utils/icono_string_util.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget{

   @override
  Widget build(BuildContext context) {
   return Scaffold(
    appBar: AppBar(
      title: Text('componentes'),
    ),
    body: _lista(),

  );
  }//build
 
  Widget _lista(){
    
   // menuProvider.cargarData().then((opciones){
      
      //estados del future: cuando se resuelve,
      //cuando se pide info, cuando hay un error
    return FutureBuilder(
      future: menuProvider.cargarData(),
      initialData: [],
      builder: ( context, AsyncSnapshot<List<dynamic>> snapshot){
          //manejando los estados del future:
          
          print(snapshot.data);


          return ListView(
            children: _listaItems(snapshot.data,context),
          );
      } ,
    );
     
    }
  


   
      
 List<Widget> _listaItems(List<dynamic> data, BuildContext context) {

   final List<Widget> opciones = [];
   
   
   data.forEach((opt) {
     final widgetTemp = ListTile(
       title: Text(opt['texto']
       ),
       leading: getIcon(opt['icon']),
       trailing: Icon(Icons.keyboard_arrow_right ,color: Colors.blue,),
       onTap: (){

         Navigator.pushNamed(context, opt['ruta']);
        

         //navegar a otra pantalla

                //context -> el build context, que pagina sigue o a que pagina regresar
                //route -> 
          /*
          final route = MaterialPageRoute(
            
            builder: (context){
              return AlterPage();
            } 
          
          );    
            //ir a otra pantalla
          Navigator.push(context, route); */
       },
       
       );
      opciones..add(widgetTemp)
            ..add(Divider());
    });

  return opciones;

 }


}