import 'package:flutter/material.dart';
import 'package:productos_app/models/producto.dart'; // Asegúrate de importar el paquete path
import 'package:productos_app/database/database_helper.dart'; // Importa tu clase DatabaseHelper

class CreateProductScreen extends StatelessWidget {
  final DatabaseHelper dbHelper = DatabaseHelper(); // Crea una instancia de DatabaseHelper

  // Método para guardar un nuevo producto
  Future<void> saveProduct() async {
    final newProduct = Producto(
      // Crea un objeto Producto con los datos apropiados
      id: 1, // Cambia esto según tus necesidades
      nombre: 'Nuevo Producto',
      descripcion: 'Descripción del producto',
      precio: 19.99,
    );

    await dbHelper.insertProducto(newProduct); // Llama al método insertProducto
    print('Producto guardado en la base de datos.');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Product'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            saveProduct(); // Llama al método para guardar el producto
          },
          child: Text('Guardar Producto'),
        ),
      ),
    );
  }
}
