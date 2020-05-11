import 'package:flutter/material.dart';
import 'package:peliculas/src/models/pelicula_model.dart';
import 'package:peliculas/src/providers/peliculas_provider.dart';

class DataSearch extends SearchDelegate{

  final peliculas =[
    'spiderman',
    'jumanji',
    'bob esponja'

  ];

  final peliculasRecientes =[
    'world war',
    'fast and furios',
    'avengers',


  ];

  final peliculasProvider = new PeliculasProvider();
  


  @override
  List<Widget> buildActions(BuildContext context) {
      //acciones del appbar, un icono para limpiar el texto 
      //o cancelar busqueda

      return [
        IconButton(icon: Icon(Icons.clear), onPressed: (){
          query = '';
        })
        

      ];
    }
  
    @override
    Widget buildLeading(BuildContext context) {
      //icono a la izquierda del appbar 
      return IconButton(
        icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow,
          //tiempo de animacion 
          progress: transitionAnimation,
          ),
          onPressed: (){
            close( context, null);
      });
    }
  
    @override
    Widget buildResults(BuildContext context) {
      // instruccion que crea los resultados a mostrar
      return Center(
        child: Container(
          height:100.0,
          
        ),
      );
      
    }
  
    @override
    Widget buildSuggestions(BuildContext context) {
    // son las sugerencias que aparecen cuando se escribe en el buscador

    if (query.isEmpty){
      return Container();
    }
    return FutureBuilder(
      future: peliculasProvider.buscarPelicula(query),
      builder: (BuildContext context, AsyncSnapshot <List<Pelicula>> snapshot){

        if(snapshot.hasData){

          final peliculas = snapshot.data;



          return  ListView(
            children: peliculas.map((pelicula) {
              return ListTile(
                leading: FadeInImage(
                  placeholder: AssetImage('assets/img/loading.gif'),
                   image: NetworkImage(pelicula.getPosterImg()),
                   width: 50.0,
                   fit: BoxFit.contain,
                   ),
                   title: Text(pelicula.title),
                   subtitle: Text(pelicula.originalTitle),
                   onTap: (){
                     close(context, null);
                     pelicula.uniqueId = '';
                     Navigator.pushNamed(
                      context, 'detalle',
                      arguments: pelicula,

                     );
                   },

              );

            }).toList()

          );
        }
        else{
          return Center(
            child: CircularProgressIndicator()
          );

        }

      }
      );
  }





//  @override
//     Widget buildSuggestions(BuildContext context) {
//     // son las sugerencias que aparecen cuando se escribe en el buscador

//     final listaSugerida = (query.isEmpty) 
//                           ? peliculasRecientes 
//                           : peliculas.where(
//                             (p) => p.toLowerCase().startsWith(query)                            
//                             ).toList();




//     return  ListView.builder(
//       itemCount: listaSugerida.length,
//       itemBuilder: (context,i){
//         return ListTile(
//           leading: Icon(Icons.movie),
//           title: Text(listaSugerida[i])
//           ,
//         );
//       },
//     );
   
//   }




}