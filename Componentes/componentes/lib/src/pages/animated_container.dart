import 'package:flutter/material.dart';

class AnimatedContainerPage extends StatefulWidget {
  @override
  _AnimatedContainerPageState createState() => _AnimatedContainerPageState();
}

class _AnimatedContainerPageState extends State<AnimatedContainerPage> {

  double _width = 50.0;
  double _height = 50.0;
  Color _color = Colors.green;
  BorderRadiusGeometry _borderRadius = BorderRadius.circular(8.0);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('quepedo'),
        
      ),
      body: Center(
        child: Container(
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
          setState(() {
            _height = _height+30.0;
            _width = _width+15.0;
            _color = Colors.red;
          });
        },
       child: Icon(Icons.change_history)
              ),
    );
  }


  
}