
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:qrscanner/models/scan_model.dart';

class MapaPage extends StatefulWidget {

  @override
  _MapaPageState createState() => _MapaPageState();
}

class _MapaPageState extends State<MapaPage> {
  final MapController mapCtrl = new MapController();

  String maptype = 'streets';

  @override
  Widget build(BuildContext context) {

    final ScanModel scan = ModalRoute.of(context).settings.arguments ;


    return Scaffold(
      appBar: AppBar(title: Text('COORDENADAS'),
      actions: <Widget>[

        IconButton(
          icon: Icon(Icons.my_location),
          onPressed: (){

            mapCtrl.move(scan.getLatLng(), 15);

          })

      ],
      
      ),
      body: _crearFluttMapa(scan),
      floatingActionButton: _botonFlotante(context)
    );
  }

  Widget _botonFlotante( BuildContext context){

    return FloatingActionButton(
      child: Icon(Icons.repeat),
      backgroundColor: Theme.of(context).primaryColor,
      onPressed: (){
        
          if( maptype =='streets' ){
            maptype = 'dark';
          }
          else if (maptype == 'dark'){
            maptype = 'light';
          }
          else if (maptype == 'light'){
            maptype = 'outdorrs';
          }
          else if (maptype == 'outdoors'){
            maptype = 'satellite';
          }
          else{
            maptype = 'streets';
          }
          setState(() {});
      },
     
    );

  }

  Widget _crearFluttMapa(ScanModel scan){

    return FlutterMap(
      mapController: mapCtrl,
      options: MapOptions(
      center: scan.getLatLng(),
      zoom: 10,
    ),
    layers: [
      _crearMapa(),
      _crearMarcadores(scan),
    ],
    );

  }

   _crearMapa(){
    return TileLayerOptions(

      urlTemplate: 'https://api.mapbox.com/v4/' 
              '{id}/{z}/{x}/{y}@2x.png?access_token={accessToken}',
      additionalOptions: {
      'accessToken':'pk.eyJ1Ijoiam9zZXJyYTExOSIsImEiOiJjazl2M2FlNmUwM2VhM2dxb3JkNTZubnNhIn0._rvO9_B7c-rt4BSk-x2rvg',
        'id': 'mapbox.$maptype' 
    }
    );
  }

  _crearMarcadores(ScanModel scan){
    return MarkerLayerOptions(

      markers: <Marker>[

        Marker(width: 150.0,
        height: 150.0,
        point: scan.getLatLng(),
        builder: ( context ) => Container(

          child: Icon(Icons.location_on,
          size: 80.0,
          color:  Theme.of(context).primaryColor,
          ),
        )
        )
      ]

    );
  }
}