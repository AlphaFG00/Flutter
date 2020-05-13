import 'dart:async';

import 'package:qrscanner/bloc/validator.dart';
import 'package:qrscanner/models/scan_model.dart';
import 'package:qrscanner/providers/db_provider.dart';

            //mixin
class ScansBloc with Validators{

  static final ScansBloc _singleton  = new ScansBloc._();

  factory ScansBloc(){
    return _singleton;
  }


  ScansBloc._(){

    //obtener los scans de la base de datos:
    obtenerScans();
  }

  final _scansController = StreamController<List<ScanModel>>.broadcast();

  Stream <List<ScanModel>> get scansStream => _scansController.stream.transform(validarGEO);
  Stream <List<ScanModel>> get scansStreamHTTP => _scansController.stream.transform(validarhttp);


  dispose()
  {
    _scansController?.close();
  }



  obtenerScans()async{

    _scansController.sink.add( await DBProvider.db.getAllScans() );

  }

  agregarScan(ScanModel scan)async{

    await DBProvider.db.nuevoScan(scan);
    obtenerScans();

  }

  borrarScan(int id) async{
   await DBProvider.db.deleteScan(id);
   obtenerScans();

  }

  borrarTodos()async{

    await DBProvider.db.deleteAll();
    obtenerScans();

  }

}