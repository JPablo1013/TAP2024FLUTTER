import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

/*class CategoriesDB{
  static final NAMEDB = "TAQUERIA";
  static final VERSIONDB = 1;

  static Database? _database;
  Future<Database> get database async{
  if (_database != null) return _database!;
  return _database = await _initDatabase();
}
  Future<Database> _initDatabase async{
    Directory folder = await getApplicationCacheDirectory();
    String pathDB = join (folder.path + "/$NAMEDB.db");
  }

}*/