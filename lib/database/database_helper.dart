import 'package:path/path.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import '../models/producto.dart';

class DatabaseHelper {
  Future<Database> database() async {
    final dbPath = await getDatabasesPath();
    return openDatabase(
      join(dbPath, 'productos.db'),
      onCreate: (db, version) async {
        await db.execute(
          'CREATE TABLE productos(id INTEGER PRIMARY KEY, nombre TEXT, descripcion TEXT, precio REAL, tipoProductoId INTEGER, proveedorId INTEGER)',
        );
      },
      version: 1,
    );
  }

  Future<void> insertProducto(Producto producto) async {
    final db = await database();
    await db.insert(
      'productos',
      producto.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Producto>> getProductos() async {
    final db = await database();
    final List<Map<String, dynamic>> productoMap = await db.query('productos');
    return List.generate(productoMap.length, (i) {
      return Producto.fromMap(productoMap[i]);
    });
  }
}
