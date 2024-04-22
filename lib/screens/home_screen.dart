import 'package:flutter/material.dart';
import 'package:productos_app/models/producto.dart';
import 'package:productos_app/services/api_service.dart';
import 'package:productos_app/screens/createProduct_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ApiService _apiService = ApiService();
  List<Producto> _productos = [];

  @override
  void initState() {
    super.initState();
    _loadProducts();
  }

  // Método para cargar los productos desde el servicio API
  _loadProducts() async {
    _productos = await _apiService.getProduct();
    setState(() {});
  }

  // Método para navegar a la pantalla de crear producto
  void _navigateToCreateProductScreen() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => CreateProductScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Productos Disponibles'),
      ),
      body: ListView.builder(
        itemCount: _productos.length,
        itemBuilder: (context, index) {
          Producto producto = _productos[index];
          return ListTile(
            title: Text(producto.nombre),
            subtitle: Text(producto.descripcion),
            trailing: Text('\$${producto.precio.toString()}'),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _navigateToCreateProductScreen,
        backgroundColor: Colors.blue,  
        child: Row(
          children: [
            Icon(Icons.add),  
            SizedBox(width: 8),  
          ],
        ),
      ),
    );
  }
}
