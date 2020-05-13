import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {

  static final String routeName= 'home';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text('preferencias')
      ),
      body: Column(
        children: <Widget>[
          Text('color secundario'),
          Divider(),
          Text('genero'),
          Divider(),
          Text('username'),
          Divider(),
        ]
      ),
    );
  }
}