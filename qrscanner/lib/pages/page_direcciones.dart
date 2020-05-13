import 'package:flutter/material.dart';
import 'package:qrscanner/bloc/scans_bloc.dart';
import 'package:qrscanner/models/scan_model.dart';
import 'package:qrscanner/utils/utils.dart';



class PageDirecciones extends StatelessWidget {

  final scansBloc = new ScansBloc();


  @override
  Widget build(BuildContext context) {

    scansBloc.obtenerScans();


    return StreamBuilder<List<ScanModel>>(
      stream: scansBloc.scansStreamHTTP,
      
      builder: (BuildContext context, AsyncSnapshot<List<ScanModel>> snapshot) {
     

        if(!snapshot.hasData){
          return Center(child: CircularProgressIndicator(),);
        }
        final scans = snapshot.data;

        if (scans.length == 0){

          return Center(
            child: Text('no hay ni madres '),
          );
        }
        return ListView.builder(itemCount: scans.length,
       
        itemBuilder: (context,i)=> Dismissible(
          key: UniqueKey(), 
          background: Container(color: Colors.red),
          onDismissed: (direction) =>scansBloc.borrarScan(scans[i].id),
                  child: ListTile(
            leading: Icon(Icons.cloud_queue, color:Theme.of(context).primaryColor,),
            title: Text(scans[i].valor,),
            trailing: Icon(Icons.keyboard_arrow_right, color: Colors.grey),
            onTap: (){
              abrirScan(scans[i], context);

            },
            ),
              
        ),
        
        );
      },
    );
  }
}