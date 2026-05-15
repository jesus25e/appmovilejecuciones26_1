class UserModel {
  final int? id;
  final String nombres;
  final String apellidos;
  final String dni;
  final String sexo;
  final String registro;
  final String direccion;
  final String email;
  final String password;
  //Creamos el constructor
  UserModel({
    this.id,
    required this.nombres,
    required this.apellidos,
    required this.dni,
    required this.sexo,
    required this.registro,
    required this.direccion,
    required this.email,
    required this.password,
  });
  //convierte el objeto UserModel a Map para SQlite
  Map<String, dynamic> ToMap() {
    //Retornamos los datos como Map
    return {
      'id': id,
      'nombres': nombres,
      'apellidos': apellidos,
      'dni': dni,
      'sexo': sexo,
      'registro': registro,
      'direccion': direccion,
      'email': email,
      'password': password,
    };
  }

  //Convertimos un map de SQLite a UserModel
  factory UserModel.fromMap(Map<String, dynamic> map) {
    //Retornamos un usuario creaedo desde el Map
    return UserModel(
      id: map['id'],
      nombres: map['nombres'],
      apellidos: map['apellidos'],
      dni: map['dni'],
      sexo: map['sexo'],
      registro: map['registro'],
      direccion: map['direccion'],
      email: map['email'],
      password: map['password'],
    );
  }
}
