import 'package:flutter/material.dart';
import 'package:reservation_medical_app/models/speciality.dart';

class Doctor {
  final int? id;
  final String email;
  final String password;

  final String name;
  final String img;
  final Specility speciality;
  final String workTime;
  final String phoneNumber;
  Doctor(
      {this.id,
      required this.email,
      required this.password,
      required this.phoneNumber,
      required this.name,
      required this.img,
      required this.speciality,
      this.workTime = "08:00-14:00"});

  static fromJson(Map<String, dynamic> json) {
    return Doctor(
        id: json["doctorId"],
        email: json["email"],
        password: json["password"],
        phoneNumber: json["phoneNumber"],
        name: json["name"],
        img: "assets/doctor.jpg",
        speciality: Specility.fromJson(json["speciality"]));
  }
}
