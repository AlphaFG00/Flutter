import 'package:flutter/material.dart';

class BasicPage extends StatelessWidget {

  final _paisajeUrl = 'https://images.pexels.com/photos/814499/pexels-photo-814499.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500';
  final estiloTitulo = TextStyle(fontSize: 20.0 , fontWeight: FontWeight.bold);
  final estilosubTitulo = TextStyle(fontSize: 20.0 , color: Colors.grey);



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
              child: Column(
          children: <Widget>[
            imagenPaisaje(),
            primerContainer(),
            iconosRow(),
            crearTexto(),
          ],


        ),
      ),
      

      );
    
  }

  Widget imagenPaisaje(){
    return Container(
      width: double.infinity,
      height: 250.0,
     
      child: Image(image: NetworkImage(_paisajeUrl),
       fit: BoxFit.cover
      )
      );
  }

  Widget primerContainer(){
    return  SafeArea(
          child: Container(
              padding: EdgeInsets.symmetric(horizontal:60.0, vertical:20.0),
              child: Row(
                children: <Widget>[
                        Expanded(
                            child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,

                            children: <Widget>[
                            //crosaxis: vertical , mainaxis: horizontal

                            

                            Text('Lago XD ', style: estiloTitulo,),
                            SizedBox(height: 8.0),
                            Text('esta cute', style: estilosubTitulo, overflow: TextOverflow.ellipsis,),
                            

                          ],
                          ),
                        ),
                          Icon(Icons.star, color:Colors.red,
                          size: 30.0,),
                          Text('41', style: TextStyle(fontSize: 20.0))
                 
                ],
              
                
              ),
            ),
    );

  }

  Widget iconosRow(){
     
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        optimIconos(Icons.call,'Fonazo' ),
        optimIconos(Icons.near_me,'Camino' ),
        optimIconos(Icons.share,'Rolalo' ),

      ],
    );
  }

  Widget optimIconos(IconData icon, String texto){

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
       children: <Widget>[
        Icon(icon, color: Colors.indigoAccent ,size: 35.0,),
        SizedBox(height: 7.0),
        Text(texto, style: TextStyle(fontSize:15.0),)
      ],

    );
  }

  Widget crearTexto(){

    return SafeArea(
          child: Container(
        padding: EdgeInsets.symmetric(horizontal:30.0, vertical:25.0),
        child: Text(

          'ñaoinevalkñndvlankeoprijapoekedfc{askdmlairngoairungvadnv{lakmsdpvoiamorejnvisaoefvl{aknxdvl{oakmrwoedikjsdnbninterobgnedl{añsorinperñndev{aoirnfgoinwdf' ,
          textAlign: TextAlign.justify,     

        ),
      ),
    );


  }


}