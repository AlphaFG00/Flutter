import 'package:blocylogin/blocs/provider.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    final bloc = Provider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Bienvenido Prro')
      ),
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            Text('Email: ${bloc.email}'),
            Divider(),
            Text('Password: ${bloc.password}'),


          ],

        ),
    );
  }
}