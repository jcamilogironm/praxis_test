class User {
  final String? id;
  final String? razonSocial;
  final String? direccion;
  final String? municipio;
  final String? modalidad;
  final String? telefono;
  final String? contacto;
  final String? frecuencia;

  static final String columnId = 'id';
  static final String columnRazonSocial = 'razon_social';
  static final String columnDireccion = 'direccion';
  static final String columnMunicipio = 'municipio';
  static final String columnModalidad = 'modalidad';
  static final String columnTelefono = 'telefono';
  static final String columnContacto = 'contacto';
  static final String columnFrecuencia = 'frecuencia';

  User(
      {this.id,
      this.razonSocial,
      this.direccion,
      this.municipio,
      this.modalidad,
      this.telefono,
      this.contacto,
      this.frecuencia});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      razonSocial: json['razon_social'],
      direccion: json['direccion'],
      municipio: json['municipio'],
      modalidad: json['modalidad'],
      telefono: json['telefono'],
      contacto: json['contacto'],
      frecuencia: json['frecuencia'],
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      columnId: id,
      columnRazonSocial: razonSocial,
      columnDireccion: direccion,
      columnMunicipio: municipio,
      columnModalidad: modalidad,
      columnTelefono: telefono,
      columnContacto: contacto,
      columnFrecuencia: frecuencia,
    };
  }

  static List<String> columns() {
    return [
      "$columnId TEXT,",
      "$columnRazonSocial TEXT,",
      "$columnDireccion TEXT,",
      "$columnMunicipio TEXT,",
      "$columnModalidad TEXT,",
      "$columnTelefono TEXT,",
      "$columnContacto TEXT,",
      "$columnFrecuencia TEXT",
    ];
  }
}
