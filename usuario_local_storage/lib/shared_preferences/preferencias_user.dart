import 'package:shared_preferences/shared_preferences.dart';



class PreferenciasUsuario{

  static final PreferenciasUsuario _instancia = new PreferenciasUsuario._internal();

  factory PreferenciasUsuario(){
    return _instancia;
  }

  PreferenciasUsuario._internal();

  SharedPreferences _prefs;

  initPrefs() async{

    this._prefs = await SharedPreferences.getInstance();

  }

  //ninguma se usa
  // bool _colorSecundario;
  // int _nombre;
  // String _nombre;

  //getters y setters del genero 

  get genero {
    return _prefs.getInt('genero') ?? 1;
  }
  set genero (int value){
    _prefs.setInt('genero', value);
  }

   //getters y setters del color 

  get color {
    return _prefs.getBool('colorSecundario') ?? false ;
  }
  set color (bool value){
    _prefs.setBool('colorSecundario', value);
  }

  //getters y setters del nombre 

  get nombre {
    return _prefs.getString('nombreUsuario') ?? '';
  }
  set nombre (String  value){
    _prefs.setString('nombreUsuario', value);
  }


  //getters y setters de la ultima ruta 

  get ultimaRuta {
    return _prefs.getString('ultimaPagina') ?? 'home';
  }
  set ultimaRuta (String  value){
    _prefs.setString('ultimaPagina', value);
  }


}