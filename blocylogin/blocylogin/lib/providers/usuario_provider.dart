import 'package:blocylogin/preferencias/prefs_usuario.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class UsuarioProvider{

  final String _firebaseToken = 'AIzaSyAg7Z9duqpj5sUOzvdFBCjZIwAZ8ILC90Y';
  final _prefs = new PreferenciasUsuario();


 //obtener token de usuario ya registrado
 Future<Map<String, dynamic>> login(String email, String password)async{

   final authData = {
      'email'       : email,
      'password'    : password,
      'returnSecureToken' : true,
    };

    final resp = await http.post(
      'https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=$_firebaseToken',
      body:  json.encode(
        authData
      )

    );

    Map<String, dynamic> decodeResp = json.decode(resp.body);

    print(decodeResp);

    if(decodeResp.containsKey('idToken')){
      //grabar el token en el dispositivo
      _prefs.token = decodeResp['idToken'];

      return {'ok': true, 'firebaseToken':decodeResp['idToken']};
    }else{

      return {'ok': false, 'mensaje':decodeResp['error']['message']};


    }



  }


  Future<Map<String, dynamic>> nuevoUsuario(String email, String password) async{

    final authData = {
      'email'       : email,
      'password'    : password,
      'secureToken' : true,
    };

    final resp = await http.post(
      'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=$_firebaseToken',
      body:  json.encode(
        authData
      )

    );

    Map<String, dynamic> decodeResp = json.decode(resp.body);

    print(decodeResp);

    if(decodeResp.containsKey('idToken')){
     //obtener token de usuario ya registrado

      return {'ok': true, 'token':decodeResp['idToken']};
    }else{

      return {'ok': false, 'mensaje':decodeResp['error']['message']};


    }


  }


}