import 'package:http/http.dart' as http;
import 'package:peliculas/src/models/pelicula_model.dart';
import 'dart:convert';
class PeliculasProvider {

  String _apikey = 'f9589ebb6602d8d1f0b66b6f7fdaaa59';
  String _url = 'api.themoviedb.org';
  String _language = 'es-ES';


  //regresa una lista de peliculas
  Future <List<Pelicula>> getEnCines() async {

    final url = Uri.https(_url, '3/movie/now_playing',
      {
        'api_key' : _apikey,
        'language': _language

      }
    );

    final resp =  await http.get(url);
    final decodedData = json.decode(resp.body);
  //recorrera cada uno de los resultados de decoded y creara instancias 
  //que almacenara en items
    final peliculas = new Peliculas.fromJsonList(decodedData['results']);

    return peliculas.items;

  }


  Future <List<Pelicula>> getPopulares() async{

      final urlPopulares = Uri.https(_url, '3/movie/popular',{
         'api_key' : _apikey,
         'language': _language
      });

      final resPopulares = await http.get(urlPopulares);
      final decodedDataPopulares = json.decode(resPopulares.body);
      final pelisPopulares = new Peliculas.fromJsonList(decodedDataPopulares['results']);

      print(pelisPopulares.items);

      return pelisPopulares.items;

  }




}