import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:qrscanner/models/scan_model.dart';
import 'package:sqflite/sqflite.dart';

class DBProvider{

  static Database _database;
                            //constructor privado
  static final DBProvider db = DBProvider._();

  DBProvider._();

  Future<Database> get database async{

    if(_database != null) return _database;

    _database = await initDB();

    return _database;

  }
  //crear Database
  initDB()async {

   Directory documentsDirectory = await getApplicationDocumentsDirectory();

    final path = join(documentsDirectory.path, 'ScansDB.db');

    return await openDatabase(
      path,
      version: 1,
      onOpen: (db){},
      onCreate: (Database db , int version) async {
        await db.execute(
        'CREATE TABLE Scans('
        'id INTEGER PRIMARY KEY,'
        'tipo TEXT,'
        'valor TEXT'
        ')'
        );
      }


    );


  }


  //insertar en Scans forma 1
  /*
  nuevoScanRaw(ScanModel nuevoScan) async{

    final db = await database;

    final res = await db.rawInsert(
      'INSERT Into Scans (id,tipo,valor)'
      'VALUES ( ${nuevoScan.id},${nuevoScan.tipo}, ${nuevoScan.valor})'
      
    );

    return res;


  }*/

  //insertar en Scans forma 2 (facil)
  nuevoScan ( ScanModel nuevoScan)async {
    final db = await database;

    final res = await db.insert('Scans', nuevoScan.toJson());

    return res;
  }

  //SELECT 
  Future<ScanModel> getScanId(int id) async {

    final db = await database;

    final res = await db.query('Scans', where: 'id = ?', whereArgs: [
      id
    ] );

    return res.isNotEmpty ? ScanModel.fromJson(res.first) : null;

  }

  //select all
  Future<List<ScanModel>> getAllScans()async{

    final db = await database;
    final  res = await db.query('Scans') ;

    List<ScanModel> list = res.isNotEmpty 
                            ? res.map((e) => ScanModel.fromJson(e)).toList()
                            : [];

    return list;
  }
  //select by type
  Future<List<ScanModel>> getScansType(String tipo)async{

    final db = await database;
    final  res = await db.rawQuery("SELEC * FROM Scans WHER tipo = '$tipo'");

    List<ScanModel> list = res.isNotEmpty 
                            ? res.map((e) => ScanModel.fromJson(e)).toList()
                            : [];

    return list;
  }

  //update
  Future<int> updateScan(ScanModel nuevoScan)async{
    final db = await database;
    final res = await db.update('Scans',nuevoScan.toJson(), where: 'id = ?',
    whereArgs: [nuevoScan.id] );
    return res;
  
  }

  //delete
  Future<int>deleteScan(int id) async{

    final db = await database;

    final res = await db.delete('Scans',where: 'id = ?', whereArgs: [
      id
    ] );

    return res;


  }


  Future<int>deleteAll() async{

    final db = await database;
    
    final res = await db.rawDelete('DELETE FROM Scans');

    return res;


  }





}