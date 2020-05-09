import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedContainerPage extends StatefulWidget {
  @override
  _AnimatedContainerPageState createState() => _AnimatedContainerPageState();
}

class _AnimatedContainerPageState extends State<AnimatedContainerPage> {

  double _width = 20.0;
  double _height = 30.0;
  Color _color = Colors.green;
  BorderRadiusGeometry _borderRadius = BorderRadius.circular(8.0);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animacion Mamalona'),
        
      ),
      body: Center(
        child: AnimatedContainer(
          duration: Duration( seconds: 1),
          //animaciones sofisticadas:
          curve: Curves.fastLinearToSlowEaseIn,
          width: _width,
          height:  _height,
          decoration:  BoxDecoration(
            borderRadius: _borderRadius,
            color: _color
          ),
        )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
         _cambiarForma();
        },
       child: Icon(Icons.change_history)
              ),
    );
  }

  void _cambiarForma(){

    final random = Random();

    setState(() {
      _width = random.nextInt(255).toDouble();
    _height += random.nextInt(150).toDouble();
    _color = Color.fromRGBO(
      random.nextInt(255),
      random.nextInt(255),
     random.nextInt(255),
      1,
    );

    _borderRadius= BorderRadius.circular(random.nextInt(100).toDouble());

    });

  }
  

}