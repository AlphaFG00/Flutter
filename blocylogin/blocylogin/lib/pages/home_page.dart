//import 'package:blocylogin/blocs/provider.dart';
import 'package:blocylogin/models/producto_model.dart';
import 'package:blocylogin/providers/productos_provider.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
   final productosProvider = new ProductosProvider();

  @override
  Widget build(BuildContext context) {
    
    //final bloc = Provider.of(context);
   

    return Scaffold(
      appBar: AppBar(
        title: Text('Bienvenido Prro')
      ),
      body: _crearListado(),
      floatingActionButton: _crearBoton(context),
    );
  }

  Widget _crearBoton(BuildContext context){

    return FloatingActionButton(
      onPressed: () => Navigator.pushNamed(context, 'producto').then((value) {
  setState(() {
    
  });
}),
      child: Icon(Icons.add), 
      backgroundColor: Colors.deepPurple,
    );


  }

  Widget _crearListado(){

    return FutureBuilder(
      future: productosProvider.cargarProductos(),
      builder: (BuildContext context, AsyncSnapshot<List<ProductoModel>> snapshot){
        if(snapshot.hasData){

            final productos = snapshot.data;

            return ListView.builder(
              
              itemCount: productos.length,
              itemBuilder: (context, i) => _crearItems(productos[i], context)

            );
        }else{
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
      
      
      );

    

  }

  Widget _crearItems(ProductoModel producto, BuildContext context){

    return Dismissible(
        key: UniqueKey(),
        background: Container(
          color: Colors.teal
        ),
        onDismissed: (direccion){
          //borrar el producto en firebase

          productosProvider.borrarProducto(producto.id);

        },
          child: Card(
            child: Column(
              children: <Widget>[

                (producto.fotoUrl == null)
                ? Image(image: AssetImage('assets/noimage.png'))
                : FadeInImage(
                  placeholder: AssetImage('assets/loading.gif'),
                  height: 300.0,
                  fit: BoxFit.cover, 
                  image: NetworkImage(producto.fotoUrl)
                ),

                     ListTile(

                          title: Text('${producto.titulo} - ${producto.valor}'),
                          subtitle: Text(producto.id),
                          onTap: () => Navigator.pushNamed(context, 'producto', 
                              arguments: producto
                              ).then((value) {
                              setState(() {
                                
                              });
                            }),
                    ),

            ],)
          )




    
    );



  }
}