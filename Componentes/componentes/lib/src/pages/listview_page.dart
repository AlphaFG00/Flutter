import 'dart:async';

import 'package:flutter/material.dart';

class ListaPage extends StatefulWidget {
  @override
  _ListaPageState createState() => _ListaPageState();
}

class _ListaPageState extends State<ListaPage> {


  ScrollController _scrollController = new ScrollController();
  List <int> _numlist = new List() ;
  int _lastInt =0;
  bool _load = false;




  @override
  void initState() {
    
    super.initState();
    _agregar10();

    _scrollController.addListener(() {
      if(_scrollController.position.pixels == _scrollController.position.maxScrollExtent)
      
      fecthData();

    });



  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Listas')
      ),
      body: Stack(
        children: <Widget>[

          _crearLista(),
          _crearLoading(),
        ]
      )
      
      
      
       
    );
  }

  Widget _crearLista(){

    return RefreshIndicator(

              onRefresh: obtenerPag1,
              child: ListView.builder(
              controller: _scrollController,
              itemCount: _numlist.length,
              itemBuilder: (BuildContext context, int index){

              final imagen = _numlist[index];

                return FadeInImage(
                  placeholder: AssetImage('assets/original.gif'), image: NetworkImage('https://picsum.photos/500/300/?image=$imagen')
                  );
              },

            ),
    );
    



  }

  //infinite Scroll
  void _agregar10(){
    for(var j=1 ;j < 10; j++){
      _lastInt++;
      _numlist.add(_lastInt);
    }
    setState(() {
      
    });


  }

  void dispose(){
   super.dispose();
   _scrollController.dispose();
 }



  //infiniteScrollconFutures

  Future fecthData() async {

    _load = true;
    setState(() {

      final duration = new Duration(seconds:2);


      new Timer(
        duration,
         respuestaHTTP
      );
    });
    

  }

  //subir al recibir respuesta del Fetch
  void respuestaHTTP(){
    _load = false;
    _scrollController.animateTo(
      _scrollController.position.pixels +100,
      duration: Duration(milliseconds: 250),
       curve: Curves.fastOutSlowIn,
       );
    _agregar10();
  }

  Widget _crearLoading(){
  if (_load){
    return  Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget> [
        Row(
          
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircularProgressIndicator()
            ]
           
        ),
        SizedBox(height:15.0)


      ]
    );
    
    
     
  }else{
    return Container();
  }
}

  //scroll hacia arriba
  Future<Null> obtenerPag1() async{
  final duration = new Duration(seconds: 1);
  new Timer(duration, (){
    _numlist.clear();
    _lastInt++;
    _agregar10();
  });

  return Future.delayed(duration);
    
}



}