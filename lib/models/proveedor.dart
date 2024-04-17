class Proveedor {
  final int id;
  final String nombre;
  final String contacto;

  Proveedor({required this.id, required this.nombre, required this.contacto});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nombre': nombre,
      'contacto': contacto,
    };
  }

  static Proveedor fromMap(Map<String, dynamic> map) {
    return Proveedor(
      id: map['id'],
      nombre: map['nombre'],
      contacto: map['contacto'],
    );
  }
}
