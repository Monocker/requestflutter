import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:productos_app/models/producto.dart';

class ApiService {
  final String _baseUrl = 'https://localhost:7146/api/producto';

  Future<List<Producto>> getProduct() async {
    final response = await http.get(Uri.parse('$_baseUrl/GetProducto'));

    print(response);

    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);
      return body.map((dynamic item) => Producto.fromJson(item)).toList();
    } else {
      throw Exception('No se pudieron cargar los productos');
    }
  }
}
