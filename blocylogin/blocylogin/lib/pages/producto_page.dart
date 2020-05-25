//import 'dart:html';
import 'package:blocylogin/blocs/productos_bloc.dart';
import 'package:blocylogin/blocs/provider.dart';
import 'package:blocylogin/models/producto_model.dart';
import 'package:blocylogin/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class ProductoPage extends StatefulWidget {

  @override
  _ProductoPageState createState() => _ProductoPageState();
}

class _ProductoPageState extends State<ProductoPage> {

  //final productoProvider = new ProductosProvider();
  final formKey = GlobalKey<FormState>();
  final scaffoldkey = GlobalKey<ScaffoldState>();
  ProductoModel producto = new ProductoModel();
  bool _guardado = false;
  File foto;
  ProductosBloc productosBloc;

  @override
  Widget build(BuildContext context) {

    productosBloc = Provider.productosBloc(context);

    //data precargada antes de disparar las acciones
    final ProductoModel prodData = ModalRoute.of(context).settings.arguments;
    if (prodData != null){

      producto = prodData;


    }


    return Scaffold(
      key: scaffoldkey,
      appBar: AppBar(

        title: Text('Producto'),
        actions: <Widget>[

          IconButton(
            icon: Icon(Icons.photo_size_select_actual), 
            onPressed: _selectFoto,
            ),


          IconButton(
            icon: Icon(Icons.camera_alt), 
            onPressed: _tomarFoto,
            )

        ],

      ),
      body: SingleChildScrollView(child: Container(
        padding: EdgeInsets.all(15.0),
        child: Form(
          key: formKey,
          child: Column(
            children: <Widget>[
              _mostrarFoto(),
              _crearNombre(),
              _crearPrecio(),
              _crearDisponible(),
              _crearBoton(),


            ]
          ),
          ),

        ),
      ),



    );
  }

  Widget _crearNombre(){

    return TextFormField(
      initialValue: producto.titulo,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        labelText:'Producto'
      ),
      onSaved: (value) => producto.titulo = value,
      validator: (value){




        if(value.length <3){
          return 'ingrese el nombre bien, meco';
        }else{
          return null;
        }
      },
    );

  }

  Widget _crearPrecio(){
    return TextFormField(
      initialValue: producto.valor.toString(),
      keyboardType: TextInputType.number,
      decoration: InputDecoration(

        labelText: 'Precio'

      ),
      onSaved: (value) => producto.valor = double.parse(value),
      validator: (value){
        if(isNumber(value)){
          return null;
        }else{
          
          return 'ingrese solo numeros , meco';
        }
      },

    );



  }

  Widget _crearBoton(){

    return RaisedButton.icon(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0)
      ),
      color: Colors.deepPurple,
      textColor: Colors.white,
      label: Text('Guardar'),
      icon: Icon(Icons.save),
     onPressed: (_guardado) ? null : _submit,
      
      
    );

  }

  void _submit()async{
    //true si formulario valido, false si no lo es
    //cuando no es valido
   if(!formKey.currentState.validate()) return;
  //cuando  es valido el formulario
   formKey.currentState.save();

   setState(() {_guardado = true;});

   if(foto != null){
     producto.fotoUrl = await productosBloc.addFoto(foto);
   }
      
    print(producto.disponible);
    print(producto.valor);
    print(producto.titulo);

    if(producto.id == null){
        productosBloc.addProducto(producto);
    }
    else{

      productosBloc.editarProducto(producto);

    }
   
    mostrarSnackBar('etsito :V');

    Navigator.pop(context);
  
}

  Widget _crearDisponible(){

    return SwitchListTile(
    value: producto.disponible, 
    activeColor: Colors.deepPurple,
    onChanged: (value) => setState((){
      producto.disponible = value;
    }),
    title: Text('disponible'),
    );


  }

  void mostrarSnackBar(String mensaje){

    final snackbar = SnackBar(
      content: Text(mensaje) ,
      duration: Duration(milliseconds: 1000),
      
    );

    scaffoldkey.currentState.showSnackBar(snackbar);
  }

  _selectFoto()async{

   _procesarImagen(ImageSource.gallery);

  }

  
 _mostrarFoto() {
 
    if (producto.fotoUrl != null) {
      return FadeInImage(
        placeholder: AssetImage('assets/loading.gif'),
        height: 300.0,
        fit: BoxFit.cover,
        image: NetworkImage(producto.fotoUrl)
        );
    } else {
 
      if( foto != null ){
        return Image.file(
          foto,
          fit: BoxFit.cover,
          height: 300.0,
        );
      }
      return Image.asset('assets/noimage.png');
    }
  }
  
  
  
  _tomarFoto()async{

    _procesarImagen(ImageSource.camera);


  }

  _procesarImagen(ImageSource origen )async{

    foto = await ImagePicker.pickImage(
      
    source: origen

    );
    if(foto != null){
      //limpieza
      producto.fotoUrl = null;

    }

    setState(() {
      
    });


  }

}