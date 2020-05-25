//import 'package:blocylogin/blocs/provider.dart';
import 'package:blocylogin/blocs/productos_bloc.dart';
import 'package:blocylogin/blocs/provider.dart';
import 'package:blocylogin/models/producto_model.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {

  

  @override
  Widget build(BuildContext context) {
    
    final productosBloc = Provider.productosBloc(context);
    productosBloc.cargarProductos();

    return Scaffold(
      appBar: AppBar(
        title: Text('Bienvenido Prro')
      ),
      body: _crearListado(productosBloc),
      floatingActionButton: _crearBoton(context),
    );
  }

  Widget _crearBoton(BuildContext context){

    return FloatingActionButton(
      onPressed: () => Navigator.pushNamed(context, 'producto').then((value) {

}),
      child: Icon(Icons.add), 
      backgroundColor: Colors.deepPurple,
    );


  }

  Widget _crearListado(ProductosBloc productosBloc){


    return StreamBuilder(
      stream: productosBloc.productosStream,
      builder: (BuildContext context, AsyncSnapshot<List<ProductoModel>> snapshot){
         if(snapshot.hasData){

            final productos = snapshot.data;

            return ListView.builder(
              
              itemCount: productos.length,
              itemBuilder: (context, i) => _crearItems(productos[i], context, productosBloc)

            );
        }else{
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      }
    );

  }

  Widget _crearItems(ProductoModel producto, BuildContext context, ProductosBloc productosBloc){

    return Dismissible(
        key: UniqueKey(),
        background: Container(
          color: Colors.teal
        ),
        onDismissed: (direccion){
          //borrar el producto en firebase

          productosBloc.deleteProducto(producto.id);

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
                          
                            }),
                    ),

            ],)
          )




    
    );



  }
}