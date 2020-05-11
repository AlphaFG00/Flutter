import 'package:flutter/material.dart';
import 'package:peliculas/src/providers/peliculas_provider.dart';
import 'package:peliculas/src/search/search_delegate.dart';
import 'package:peliculas/src/widgets/card_Swiper_widget.dart';
import 'package:peliculas/src/widgets/movie_horizontal.dart';

class HomePage extends StatelessWidget {

  final peliculasProvider = new PeliculasProvider();

  


  @override
  Widget build(BuildContext context) {
    peliculasProvider.getPopulares();


    return Scaffold(
      appBar: AppBar(
        title: Text('Peliculas Perrras'),
        backgroundColor: Colors.indigoAccent,
        actions: <Widget>[
          IconButton( 
            icon: Icon(Icons.search),
            onPressed: (){
              showSearch(
                context: context,
                delegate: DataSearch(),
                query: 'hola'
                
                );
            },
            )
         
        ],
      ),
      body: Container(
        child: Column(
          children: <Widget>[

           _swiperTarjetas(),
           _footer(context),

          ],
        ) ,
      )
    
    );
  }//build

  Widget _swiperTarjetas(){

   return FutureBuilder(
     future: peliculasProvider.getEnCines(),
      builder: (BuildContext context, AsyncSnapshot snapshot){
         if(snapshot.hasData){
            return CardSwiper(       
              peliculas: snapshot.data
             );
         }
         else{
           return Container(height:400.0, child: Center(child: CircularProgressIndicator()));
         }
      }
   );
  }


  Widget _footer(BuildContext context){
  
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
                //estilo global de la aplicacion
          Container(
            padding: EdgeInsets.only(left: 20.0, bottom: 20.0, top:25.0),
            child: Text('Populares:', style:  Theme.of(context).textTheme.subtitle1,)),
          SizedBox(height: 5.0),
          StreamBuilder( 
            stream: peliculasProvider.popularesStream,
            builder: (BuildContext context, AsyncSnapshot snapshot){
             
              if(snapshot.hasData) {
                
                return MovieHorizontal(
                  peliculas: snapshot.data ,
                  //infinite scroll para cargar cuando llegue al final de la pagina 
                  siguientePagina: peliculasProvider.getPopulares,
                  );

              }
              else{
                return Center(child: CircularProgressIndicator());
              }

              
            
            
              

            },
          
          )
      ],),
      width: double.infinity,
    );


  }

}