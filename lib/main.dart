import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/createProduct_screen.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void main() async {
  // Inicializa FFI
  sqfliteFfiInit();

  // Configura la fábrica de bases de datos
  databaseFactory = databaseFactoryFfi;

  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Productos App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
       initialRoute: '/', // Ruta inicial
      routes: {
        '/': (context) => HomeScreen(), // Ruta para HomeScreen 
        '/createProduct_screen': (context) => CreateProductScreen(), // Ruta para CreateProductScreen
      },
    );
  }
}
