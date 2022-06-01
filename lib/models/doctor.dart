

import 'package:reservation_medical_app/models/speciality.dart';

class Doctor {
  final int? id;
  final String email;
  final String password;
  final int price;
  final String name;
  final bool? verified;
  final String? img;
  final Speciality speciality;
  final String workTime;
  final String phoneNumber;
  final int hourLimit;
  final String? mapUrl;
  Doctor(
      {this.id,
      this.verified,
      required this.price,
      required this.mapUrl,
      required this.hourLimit,
      required this.email,
      required this.password,
      required this.phoneNumber,
      required this.name,
      this.img,
      required this.speciality,
      this.workTime = "08:00-14:00"});

  static fromJson(Map<String, dynamic> json) {
    return Doctor(
        verified: json['verified'],
        mapUrl: json["mapUrl"],
        price: json["price"],
        id: json["doctorId"],
        hourLimit: json["hourLimit"],
        email: json["email"],
        password: json["password"],
        phoneNumber: json["phoneNumber"],
        name: json["name"],
        img: "assets/doctor.jpg",
        speciality: Speciality.fromJson(json["speciality"]));
  }

  static Map<String, dynamic> toJson(Doctor doctor) {
    return {
      "doctorId": doctor.id,
      "price": doctor.price,
      "mapUrl": doctor.mapUrl,
      "hourLimit": doctor.hourLimit,
      "email": doctor.email,
      "password": doctor.password,
      "phoneNumber": doctor.phoneNumber,
      "name": doctor.name,
      "speciality": Speciality.toJson(doctor.speciality),
    };
  }
}
