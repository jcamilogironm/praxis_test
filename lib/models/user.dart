class User {
  final String? id;
  final String? razonSocial;
  final String? direccion;
  final String? municipio;
  final String? modalidad;
  final String? telefono;
  final String? contacto;
  final String? frecuencia;

  User({this.id,
      this.razonSocial,
      this.direccion,
      this.municipio,
      this.modalidad,
      this.telefono,
      this.contacto,
      this.frecuencia});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id : json['id'],
      razonSocial : json['razon_social'],
      direccion : json['direccion'],
      municipio : json['municipio'],
      modalidad : json['modalidad'],
      telefono : json['telefono'],
      contacto : json['contacto'],
      frecuencia : json['frecuencia'],
    );
  }
}
