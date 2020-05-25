import 'dart:io';
import 'package:blocylogin/models/producto_model.dart';
import 'package:blocylogin/providers/productos_provider.dart';
import 'package:rxdart/rxdart.dart';

class ProductosBloc{

  //listado completo

  final _productosController = new BehaviorSubject<List<ProductoModel>>();


  //subida de informacion
  final _cargandoControler = new BehaviorSubject<bool>();


  final _productosProvider = new ProductosProvider();

  //escuchar el controller de productos y el de cargando
  Stream<List<ProductoModel>> get productosStream => _productosController.stream;
  Stream<bool> get cargando =>_cargandoControler.stream;

  //agregar funciones al stream

  void cargarProductos()async{

    final productos =  await _productosProvider.cargarProductos();

    //insertar al stream
    _productosController.sink.add(productos);

  }

  void addProducto(ProductoModel producto)async{
    //notificar carga
    _cargandoControler.sink.add(true);


    await _productosProvider.crearProducto(producto);

    
    _cargandoControler.sink.add(true);

  }


  Future<String> addFoto(File foto)async{
    //notificar carga
    _cargandoControler.sink.add(true);


    final fotoURL = await _productosProvider.subirImagen(foto);

    
    _cargandoControler.sink.add(true);


    return fotoURL;

  }
  

    void editarProducto(ProductoModel producto)async{
    //notificar carga
    _cargandoControler.sink.add(true);


    await _productosProvider.editarProducto(producto);

    
    _cargandoControler.sink.add(true);


  }



    void deleteProducto(String id)async{
    //notificar carga
    _cargandoControler.sink.add(true);


    await _productosProvider.borrarProducto(id);

    
    _cargandoControler.sink.add(true);


  }





  dispose(){
    _productosController?.close();
    _cargandoControler?.close();

  }



}