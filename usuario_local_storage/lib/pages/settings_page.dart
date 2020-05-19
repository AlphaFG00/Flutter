import 'package:flutter/material.dart';
import 'package:usuario_local_storage/Widgets/drawer_widget.dart';
import 'package:usuario_local_storage/shared_preferences/preferencias_user.dart';


class SettingsPage extends StatefulWidget {

  static final String routeName= 'settings';

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {

  bool _secundario;
  String nombre = 'yo mero';
  int _genero;

  TextEditingController _textController;

  final prefs = new PreferenciasUsuario();


  @override
  void initState() {
    
    super.initState();

    prefs.ultimaRuta = SettingsPage.routeName;
    _genero = prefs.genero;
    _secundario = prefs.color;
    _textController = TextEditingController(text:prefs.nombre);
  }

  _setSelectedRadio(int valor) {
    prefs.genero = valor;
    _genero = valor;
    setState(() {}); 


  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text('ajustes'),
        backgroundColor: (prefs.color) ? Colors.teal : Colors.lime

      ),
      drawer: MenuHamburguesa(),
      body: ListView(
        children: <Widget>[
          Container(
              child: Text('settings', style: TextStyle(fontSize: 45.0, fontWeight: FontWeight.bold ),) ,
              padding: EdgeInsets.all(5.0),
            ),
            Divider(),
            SwitchListTile(
              value: _secundario,
              title: Text('color secundario'), 
              onChanged: ( value ) {
                setState(() {
                  _secundario = value;
                  prefs.color = value;
                });
               },
              ),
              //checklist
              RadioListTile(
                value: 1,
                title: Text('masculino'),
                groupValue: _genero, 
                onChanged: _setSelectedRadio,
                 
                
                ),

              RadioListTile(
                value: 2,
                title: Text('Femenino'),
                groupValue: _genero, 
                onChanged: _setSelectedRadio
                ),

              Divider(),

              Container(
                padding: EdgeInsets.symmetric(horizontal:20.0),
                child: TextField( 
                  controller:  _textController,
                  decoration: InputDecoration(
                  labelText: 'NOmbre',
                  helperText: 'el que usa el fon :v '
                ),
                onChanged: (value){
                  setState(() {
                    
                    nombre = value;
                    prefs.nombre = value;
                    


                  });
                },
                )
              )
        ]
      )
    );
  }
}