import 'package:flutter/material.dart';
import 'package:productos_app/models/producto.dart';
import 'package:productos_app/services/api_service.dart';

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

  _loadProducts() async {
    _productos = await _apiService.getProduct();
    setState(() {});
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
    );
  }
}
