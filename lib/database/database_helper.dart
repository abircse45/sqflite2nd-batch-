import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_class_2nd_batch/model/product_model.dart';

class DbHelper {
  static Database? _database;

  Future<Database?> get db async {
    if (_database != null) {
      return _database;
    }
    _database = await initalDatabase();
    return _database;
  }

  Future<Database> initalDatabase() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    var openDB =
        openDatabase(documentDirectory.path, version: 1, onCreate: _onCreate);
    return openDB;
  }

  _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE product
      
      (
      
      id INTEGER PRIMARY KEY,
      title TEXT,
      price INTEGER,
      description TEXT,
      dateTime TEXT
      
      )
      
      
      
      ''');
  }

  Future insertProductData(ProductrModel productrModel) async {
    Database? database = await db;
    return await database?.insert("product", productrModel.toJson());
  }

  Future<List<ProductrModel>?> getProductData() async {
    Database? database = await db;
    var data = await database!.query("product", orderBy: "id");
    List<ProductrModel> productModel =
        data.map((e) => ProductrModel.fromJson(e)).toList();
    return productModel;
  }
}
