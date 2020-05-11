import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:peliculas/src/models/actores_model.dart';
import 'package:peliculas/src/models/pelicula_model.dart';
import 'dart:convert';
class PeliculasProvider {

  String _apikey = 'f9589ebb6602d8d1f0b66b6f7fdaaa59';
  String _url = 'api.themoviedb.org';
  String _language = 'es-ES';
  int _popularesPage = 0;

  List<Pelicula> _populares = new List();

  bool _cargando = false;

  //creacion del stream                                  muchos lugares escuchando
  final _popularesStreamController = StreamController<List<Pelicula>>.broadcast();

  //getter para instertar peliculas
  Function(List<Pelicula>) get popularesSink => _popularesStreamController.sink.add;

  //get para escuchar peliculas
  Stream<List<Pelicula>> get popularesStream => _popularesStreamController.stream;



  //para streams no cerrados, ni multiples
  void disposeStreams(){
    _popularesStreamController?.close();
  }

  Future<List<Pelicula>> _procesarRespuesta(Uri url) async{

    final resp = await http.get(url);
    final decodedData = json.decode(resp.body);
    final peliculas = new Peliculas.fromJsonList(decodedData['results']);

    return peliculas.items;

  }

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
   

      if (_cargando) return [];

      _cargando =true;
       _popularesPage++;
       

      final urlPopulares = Uri.https(_url, '3/movie/popular',{
         'api_key' : _apikey,
         'language': _language,
         'page'    : _popularesPage.toString()
      });

      final resp = await _procesarRespuesta(urlPopulares);
      _populares.addAll(resp);

      popularesSink(_populares);




    _cargando = false;  

      return resp;

  }

  Future <List<Actor>> getCast(String peliId) async{

    final url = Uri.https(_url, '3/movie/$peliId/credits',
    {
      'api_key': _apikey,
      'language': _language,


    });

    final resp = await http.get(url);
    //toma el body y lo transforma en mapa
    final decodedData = json.decode(resp.body);

    final cast = new Cast.fromJsonList(decodedData['cast']);

    return cast.actores;


  }

 Future <List<Pelicula>> buscarPelicula(String query) async{


      final url = Uri.https(_url, '3/search/movie',{
         'api_key' : _apikey,
         'language': _language,
         'query'   : query
         
      });

      return await _procesarRespuesta(url);




 }

}