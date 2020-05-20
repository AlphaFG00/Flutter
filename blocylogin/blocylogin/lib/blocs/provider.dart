import 'package:blocylogin/blocs/login_bloc.dart';
import 'package:flutter/material.dart';

class Provider extends InheritedWidget{

  //patron singleton
  static Provider _instancia;
  factory Provider({Key key, Widget child}){

    if (_instancia ==null){

      _instancia = new Provider._internal(key: key, child: child,);

    }

    return _instancia;

  }

  //constructor privado
   Provider._internal({Key key, Widget child})
  : super(key: key, child: child);



  final loginBloc = LoginBloc();

  //constructor e impĺementacion del inherited
  // Provider({Key key, Widget child})
  // : super(key: key, child: child);

  @override
  //al actualizarse debe notificar a sus hijos
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static LoginBloc of (BuildContext context){

    return context.dependOnInheritedWidgetOfExactType<Provider>().loginBloc;



  }



}