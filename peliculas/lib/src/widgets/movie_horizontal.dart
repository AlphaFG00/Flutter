import 'package:flutter/material.dart';
import 'package:peliculas/src/models/pelicula_model.dart';

class MovieHorizontal extends StatelessWidget {

  final List<Pelicula> peliculas;
  final Function siguientePagina;

  MovieHorizontal ({@required  this.peliculas, @required this.siguientePagina});

  final _pageController = new PageController(
     initialPage: 1,
            viewportFraction : 0.2,
  );

  @override
  Widget build(BuildContext context) {

    final _screenSize = MediaQuery.of(context).size;

    //listener del pageView
    _pageController.addListener(() {
      if( _pageController.position.pixels >= _pageController.position.maxScrollExtent -200){
        siguientePagina();
      }
    });


    return Container(
        height: _screenSize.height * 0.2,
        //pageview.builder, va renderizando bajo demanda
        child: PageView.builder(
          pageSnapping: false,
          controller: _pageController,
          itemCount: peliculas.length,
          itemBuilder: (context , i){
            return _crearTarjeta(context, peliculas[i]);
          },
         //children: _tarjetas(context),
        ),



    );
  }

  Widget _crearTarjeta(BuildContext context, Pelicula pelicula) {
    //detectar cuando se hace clic en la tarjeta: gesturedetector
      pelicula.uniqueId = '${ pelicula.id }-poster';

       final  cardPelicula = Container(
       margin: EdgeInsets.only(right: 15.0),
       child: Column(
         children: <Widget>[
           Hero(
             //id unico, tiene que ser el mismo id de donde llegara
             tag: pelicula.uniqueId,
                        child: ClipRRect(
               borderRadius: BorderRadius.circular(20.0),
                          child: FadeInImage(
                 
                 image: NetworkImage(pelicula.getPosterImg()),
                 placeholder: AssetImage('assets/img/loading.gif'),
                 fit: BoxFit.cover,
                 height: 160.0,
               ),
             ),
           ),
           Text(pelicula.title,
           overflow: TextOverflow.ellipsis,
           style: Theme.of(context).textTheme.caption,
           )
         ]
       ),
     );

     return GestureDetector(
       child: cardPelicula,
       onTap: (){
         //navegar a ruta al hace tap
          Navigator.pushNamed(context, 'detalle', arguments: pelicula);
       },
     );

  }




/*
 List<Widget> _tarjetas(BuildContext context){

   return peliculas.map( (pelicula){
     return Container(
       margin: EdgeInsets.only(right: 15.0),
       child: Column(
         children: <Widget>[
           ClipRRect(
             borderRadius: BorderRadius.circular(20.0),
                        child: FadeInImage(
               
               image: NetworkImage(pelicula.getPosterImg()),
               placeholder: AssetImage('assets/img/loading.gif'),
               fit: BoxFit.cover,
               height: 160.0,
             ),
           ),
           Text(pelicula.title,
           overflow: TextOverflow.ellipsis,
           style: Theme.of(context).textTheme.caption,
           )
         ]
       ),
     );


   }).toList();

 } */



}