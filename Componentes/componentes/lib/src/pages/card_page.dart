import 'package:flutter/material.dart';

class CardPage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Cards'),
      ),
      body: ListView(
        padding: EdgeInsets.all(10),
        children: <Widget>[

            _cardTipo1(),
            SizedBox(height: 30.0),
            _cardTipo2(),
            SizedBox(height: 30.0),
            _cardTipo1(),
            SizedBox(height: 30.0),
            _cardTipo2(),
            SizedBox(height: 30.0),
            _cardTipo1(),
            SizedBox(height: 30.0),
            _cardTipo2(),
            SizedBox(height: 30.0),
            _cardTipo1(),
            SizedBox(height: 30.0),
            _cardTipo2(),
            SizedBox(height: 30.0),
            _cardTipo1(),
            SizedBox(height: 30.0),
            _cardTipo2(),
            SizedBox(height: 30.0),

        ]
      ),
      );
  }

  Widget _cardTipo1(){

    return Card(
      elevation: 1.0,
      shape: RoundedRectangleBorder( borderRadius:BorderRadius.circular(20) ),
      child: Column(
        children: <Widget>[
          ListTile(
            leading: Icon(
              Icons.photo_album, color:Colors.blue
            ),
            title: Text('Titulo Mamon'),
            subtitle:Text('NO SE SE QUIERO IR A HACER EJERCICIO CON EL SHIAPAS'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              FlatButton(
                
                child: Text('ok'),
                onPressed:(){},
                 ),
                  FlatButton(
                
                child: Text('cancelar'),
                onPressed:(){},
                 )
            ]
          )
        ]
      ),
    );

  }

  Widget _cardTipo2(){
    final card= Container(
      
      child: Column(
      children: <Widget>[
        FadeInImage(
          placeholder: AssetImage('assets/original.gif') , 
          image: NetworkImage('https://i.dailymail.co.uk/1s/2020/04/08/08/26945158-8199329-image-a-2_1586332048016.jpg'),
          fadeInDuration: Duration( milliseconds: 200),
          fit: BoxFit.cover,
          height: 300,
          ),
        //Image(image: NetworkImage('https://i.dailymail.co.uk/1s/2020/04/08/08/26945158-8199329-image-a-2_1586332048016.jpg')
        //),
        Container(
        child: Text('UN TEXTO')
        )
      ]
    ),
    );

    return Container(
     
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: Colors.white,
         boxShadow: <BoxShadow>[
           BoxShadow(
             color: Colors.black26,
             blurRadius: 10.0,
             spreadRadius:  2.0
           )
         ]
         ),
         child:ClipRRect(
           borderRadius: BorderRadius.circular(30.0),
           child: card,
         
         )

    );
  }
}