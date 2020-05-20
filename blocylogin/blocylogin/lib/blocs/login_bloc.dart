import 'dart:async';
import 'package:rxdart/rxdart.dart';
import 'package:blocylogin/blocs/validators.dart';

class LoginBloc with Validators{

  final _emailStream = BehaviorSubject<String>();
  final _passwordStream = BehaviorSubject<String>();

  //Recuperar Datos del Stream
  Stream <String> get emailStream => _emailStream.stream.transform(validarEmail);
  Stream <String> get passwordStream => _passwordStream.stream.transform(validarPass);

  //combinar streams
   Stream<bool> get formValidStream => 
   CombineLatestStream.combine2(emailStream, passwordStream, (e, p) => true);

    //ultimo valor emitido:
    String get email => _emailStream.value;
    String get password => _passwordStream.value;


  //insertar valores al stream
  Function(String) get changeEmail => _emailStream.sink.add;
  Function(String) get changePassword => _passwordStream.sink.add;


  //cerrar los streams:

  dispose(){
    _emailStream?.close();
    _passwordStream?.close();
  }



}