import 'package:flutter/material.dart';

class ScrollPage extends StatelessWidget {
  
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
         
         body: PageView(
           scrollDirection: Axis.vertical,
           children: <Widget>[
             _pagina1(),
             _pagina2(),
           ],
        
       ), 


    );
  }


  Widget _pagina1() {

    return Stack(children: <Widget>[
      //importa el orden 
      _colorFondo(),
      _imagenFondo(),
      _textos(),

    
    ],
    
    );

  }

  Widget _pagina2(){

    return Stack(children: <Widget>[
      //importa el orden 
      _colorFondo(),
     _botonBienvenido(),

    
    ],
    
    );

  }

  Widget _colorFondo(){

    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Color.fromRGBO(108, 192, 218,  1.0 )

    );
  }

  Widget _imagenFondo(){
   return Container(
      width: double.infinity,
      height: double.infinity,
      color: Color.fromRGBO(108, 192, 218,  1.0 ),
      child: Image(
        fit: BoxFit.cover,
        image: AssetImage('assets/original.png'),
      
      
      ),

    );
  }

  Widget _textos(){

    final estiloFijo = TextStyle(color: Colors.white, fontSize: 50.0);

    return SafeArea(
          child: Column(
        children: <Widget>[
          SizedBox(height:20.0),
          Text('11°',style: estiloFijo,),
          Text('Miercoles',style: estiloFijo,),
          Expanded(
            child: Container(),
            ),
          Icon(Icons.keyboard_arrow_down, size: 90.0, color: Colors.white,)



        ],
      ),
    );

  }

  Widget _botonBienvenido(){

   return SafeArea(
          child: Center(
            child: RaisedButton(
              color: Colors.blue,
              shape: StadiumBorder(),
              child:Padding(padding: EdgeInsets.symmetric(
                horizontal:40.0,
                vertical: 20.0),
                child: Text('Bienvenidos',
                style: TextStyle(fontSize: 20.0),
              ),
                ),
              textColor: Colors.white,
              onPressed: (){
                //Navigator.pushNamed(context, 'avanzado');
              },
        
      ),
          ),
    );


  }



}