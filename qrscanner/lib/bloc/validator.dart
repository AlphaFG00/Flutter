import 'dart:async';
import 'package:qrscanner/models/scan_model.dart';

class Validators {
  //clasificar el sink por lo que contenga
  final validarGEO = StreamTransformer<List<ScanModel>, List<ScanModel>>.fromHandlers(
    handleData: (scans, sink){

      final geoScans = scans.where((s)=> s.tipo == 'geo').toList();
      sink.add(geoScans);

    }
  );

    final validarhttp = StreamTransformer<List<ScanModel>, List<ScanModel>>.fromHandlers(
    handleData: (scans, sink){

      final geoScans = scans.where((s)=> s.tipo == 'http').toList();
      sink.add(geoScans);

    }


  );


}