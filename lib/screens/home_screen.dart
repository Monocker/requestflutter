import 'package:flutter/material.dart';
import 'package:productos_app/models/producto.dart';
import 'package:productos_app/services/api_service.dart';
import 'package:connectivity_plus/connectivity_plus.dart';


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
     _checkInternetConnection();
  }

  _loadProducts() async {
    _productos = await _apiService.getProduct();
    setState(() {});
  }


Future<void> _checkInternetConnection() async {
  final connectivityResult = await Connectivity().checkConnectivity();
  if (connectivityResult == ConnectivityResult.none) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Sin conexión a Internet'),
        content: Text('Por favor, verifica tu conexión.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Aceptar'),
          ),
        ],
      ),
    );
  } else {
    // Hay conexión a Internet
    // Carga los productos desde la base de datos local o remota
    _loadProducts();
  }
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
