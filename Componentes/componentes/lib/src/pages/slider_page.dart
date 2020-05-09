import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  
 double _valorSlider = 100.0;
  bool _block = false;
 
   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        title: Text('que pedo x2'),
      ),
      body: Container(
        padding: EdgeInsetsDirectional.only(top:70.0),
        child: Column(
          children: <Widget>[
            _crearSlider(),
            _crearCheckBox(),
            _crearSwitch(),
            Expanded(child: _crearImagen()), 
          ],
        ),
      ),
    );
  }

  Widget _crearSlider(){
    return Slider(
      activeColor:  Colors.indigoAccent,
      label: 'tamaño de la imagen',
      //divisions: 20,
      value: _valorSlider,
      min: 10.0,
      max: 400.0, 
      onChanged: (_block) ? null: (valor){
        setState(() {
          

          _valorSlider = valor;

        });
      }
      );
  }

  Widget _crearImagen(){
    return Image(
    image: NetworkImage('https://www.mautorland.com/wp-content/uploads/2019/07/AB00D53A-B3B7-48C4-94BF-63A04169E776-e1564085000577.jpeg'),
    width: _valorSlider,
    fit: BoxFit.contain,
    );
  }

  Widget _crearCheckBox(){

    return CheckboxListTile(
      title: Text('bloqueame'),
      value: _block , 
      onChanged: (valor){
        setState(() {
           _block = valor;
        });
       
      }
      );
  }

  Widget _crearSwitch (){
    return SwitchListTile(
      title: Text('bloqueame'),
      value: _block , 
      onChanged: (valor){
        setState(() {
           _block = valor;
        });
       
      }
      );
  }

}