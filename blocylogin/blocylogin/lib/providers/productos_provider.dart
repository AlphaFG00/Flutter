//interacciones directas con la bd  
import 'dart:convert';
import 'dart:io';
import 'package:blocylogin/preferencias/prefs_usuario.dart';
import 'package:http/http.dart' as http;
import 'package:blocylogin/models/producto_model.dart';
import 'package:mime_type/mime_type.dart';
import 'package:http_parser/http_parser.dart';

class ProductosProvider{

  final String _url = 'https://flutterdb-bad26.firebaseio.com';
  final _prefs = new PreferenciasUsuario();

  //firebase create
  Future<bool> crearProducto(ProductoModel producto) async{

    final url = '$_url/productos.json?auth=${_prefs.token}';
    final resp  = await http.post(url, body: productoModelToJson(producto));
    final decodedData = json.decode(resp.body);

    print(decodedData);

    return true;

  }

  //firebase get all

  Future<List<ProductoModel>> cargarProductos() async{

    final url = '$_url/productos.json?auth=${_prefs.token}';
    final resp  = await http.get(url);
    final Map<String,dynamic> decodedData = json.decode(resp.body);
    final List<ProductoModel> productos = new List();

    if (decodedData == null) return [];
    if ( decodedData['error'] != null ) return [];
    print('no se que pedo ');
    decodedData.forEach((id, producto) {

      print(id);
      final prodTemp = ProductoModel.fromJson(producto);
      prodTemp.id = id;
      productos.add(prodTemp);


    });

   

    return productos;

  }


  //firebase delete
  Future<int> borrarProducto(String id)async{

    final url = '$_url/productos/$id.json?auth=${_prefs.token}';
    final resp = await http.delete(url);

    print (json.decode(resp.body));

    return 1;


  }

  //update firebase
  //firebase delete
  Future<bool> editarProducto(ProductoModel producto)async{

    final url = '$_url/productos/${producto.id}.json?auth=${_prefs.token}';
    final resp = await http.put(url, body: productoModelToJson(producto));
    final decodedData = json.decode(resp.body);

    print(decodedData);

    return true;


    


  }

  Future<String> subirImagen(File imagen)async{

    final url = Uri.parse('https://api.cloudinary.com/v1_1/daejmaflp/image/upload?upload_preset=ver4jod1');
    final mimeType = mime(imagen.path).split('/');

    final imageUpRequest = http.MultipartRequest(
      'POST',
      url
    );

    final file = await http.MultipartFile.fromPath(
      'file',
      imagen.path, 
                          //imagen        Tipo
      contentType: MediaType(mimeType[0], mimeType[1])
      
      );

      imageUpRequest.files.add(file);

      final streamResponse = await imageUpRequest.send();

      final resp = await http.Response.fromStream(streamResponse);


      if(resp.statusCode != 200 && resp.statusCode != 201){
        print('valio pito');
        print(resp.body);
        return null;
      }


      final respData = json.decode(resp.body);
      print(respData);

      return respData['secure_url'];

  }



}