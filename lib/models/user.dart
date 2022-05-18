class Patient {
  final int? id;
  final String name;
  final String email;
  final String phone;
  final String password;

  Patient(
      {required this.email,
      required this.name,
      required this.password,
      required this.phone,
      this.id});


      
  static fromJson(Map<String, dynamic> json) {
    return Patient(
        id: json["userId"],
        email: json["email"],
        password: json["password"],
        phone: json["phoneNumber"],
        name: json["name"],
       
        );
  }
}
