class Producto {
  final int id;
  final String nombre;
  final String descripcion;
  final double precio;

  Producto({
    required this.id,
    required this.nombre,
    required this.descripcion,
    required this.precio,
  });

  factory Producto.fromJson(Map<String, dynamic> json) {
    return Producto(
      id: json['id'] as int,
      nombre: json['nombre'] as String,
      descripcion: json['descripcion'] as String,
      precio: (json['precio'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nombre': nombre,
      'descripcion': descripcion,
      'precio': precio,
    };
  }

  factory Producto.fromMap(Map<String, dynamic> map) {
    return Producto(
      id: map['id'] as int,
      nombre: map['nombre'] as String,
      descripcion: map['descripcion'] as String,
      precio: (map['precio'] as num).toDouble(),
    );
  }
}
