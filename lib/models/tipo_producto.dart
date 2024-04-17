class TipoProducto {
  final int id;
  final String nombre;

  TipoProducto({required this.id, required this.nombre});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nombre': nombre,
    };
  }

  static TipoProducto fromMap(Map<String, dynamic> map) {
    return TipoProducto(
      id: map['id'],
      nombre: map['nombre'],
    );
  }
}
