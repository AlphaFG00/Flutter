import 'package:flutter/material.dart';
import 'package:qrscanner/models/scan_model.dart';
import 'package:url_launcher/url_launcher.dart';


abrirScan(ScanModel scan, BuildContext context) async {
  
  if(scan.tipo =='http'){

    if (await canLaunch(scan.valor)) {
    await launch(scan.valor);
  } else {
    throw 'errosito mamon';
  }

  }else{
   Navigator.pushNamed(context, 'mapa', arguments: scan);
  }


  
}