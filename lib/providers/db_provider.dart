import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:qr_scanner/models/scan_model.dart';
import 'package:sqflite/sqflite.dart';
// ignore: depend_on_referenced_packages
import 'package:path/path.dart';

class DBProvider {
  late Database _database;
  static final DBProvider db = DBProvider._();
  DBProvider._();

  Future<Database> get database async {
    _database = await initDB();
    return _database;
  }

  Future<Database> initDB() async {
    Directory docDirectory = await getApplicationDocumentsDirectory();
    final path = join(docDirectory.path, 'ScanDB.db');
    debugPrint(path);
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
        CREATE TABLE Scans(
          id INTEGER  PRIMARY KEY,
          tipo TEXT,
          valor TEXT
        )
        ''');
      },
    );
  }

  Future<int> nuevoScanRaw(ScanModel nuevoscan) async {
    //verificar la base de datos
    final db = await database;

    final id = nuevoscan.id;
    final tipo = nuevoscan.tipo;
    final val = nuevoscan.valor;

    final res = await db.rawInsert('''
    INSERT INTO Scans(id, tipo, valor)
    VALUES ($id, '$tipo', '$val')''');

    return res;
  }

  Future<int> nuevoSca(ScanModel nuevo) async {
    final db = await database;

    final res = await db.insert('Scans', nuevo.toJson());
    debugPrint(res.toString());
    return res;
  }

  Future<ScanModel?> getSacnbyID(int id) async {
    final db = await database;

    final res = await db.query('Scans', where: 'id=?', whereArgs: [id]);

    return res.isNotEmpty ? ScanModel.fromJson(res.first) : null;
  }

  Future<List<ScanModel>> getTodosSacns() async {
    final db = await database;

    final res = await db.query('Scans');

    return res.isNotEmpty ? res.map((e) => ScanModel.fromJson(e)).toList() : [];
  }

  Future<List<ScanModel>> getTodosSacnsporTipo(String tipo) async {
    final db = await database;

    final res =
        await db.rawQuery(''' SELECT * FROM SCANS WHERE tipo = $tipo''');

    return res.isNotEmpty ? res.map((e) => ScanModel.fromJson(e)).toList() : <ScanModel>[];
  }

  Future<int> actualizar(ScanModel scanModel) async {
    final db = await database;

    final res = db.update('Scans', scanModel.toJson(),
        where: 'id = ?', whereArgs: [scanModel.id]);
    return res;

    //return res.isNotEmpty ? res.map((e) => ScanModel.fromJson(e)).toList() : [];
  }

  Future<int> borrar(int i) async {
    final db = await database;

    final res = db.delete('Scans', where: 'id = ?', whereArgs: [i]);

    return res;
  }

  Future<int> borrartodo() async {
    final db = await database;
    //final res = db.delete('Scans');
    final res = db.rawDelete('''DELETE  FROM SCANS''');
    return res;
  }
}