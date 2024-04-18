import 'dart:async';
import 'package:productos_app/models/producto.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';



class ProductosDB {
  static final ProductosDB instance = ProductosDB._internal();
static Database? _db = null; 

  ProductosDB._internal();

Future<Database> get db async {
  if (_db == null) {
    _db = await initializeDatabase();
  }
  return _db!;  // Use ! to indicate non-nullness
}


  Future<Database> initializeDatabase() async {
    final databasesPath = await getDatabasesPath();
    final path = join(databasesPath, 'productos.db');  

    // Abre la base de datos y crea la tabla productos si es necesario
    return openDatabase(path,
        version: 1,
        onOpen: (db) {
          db.execute('''
        CREATE TABLE IF NOT EXISTS productos (
              id INTEGER PRIMARY KEY AUTOINCREMENT,
              nombre TEXT NOT NULL,
              descripcion TEXT,
              precio REAL
            )
          ''');
        });
  }

  // Métodos para insertar, eliminar, actualizar y consultar datos (faltan implementar)
  Future<List<Producto>> getProductos() async {
  final db = await instance.db;
  final List<Map<String, dynamic>> maps = await db.query('productos');
  return List.generate(maps.length, (i) {
    return Producto.fromMap(maps[i]);
  });
}
}

