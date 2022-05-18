import 'package:reservation_medical_app/models/doctor.dart';
import 'package:reservation_medical_app/models/hour_label.dart';
import 'package:reservation_medical_app/models/user.dart';

class RendV {
  final String date;
  final Patient patient;
  final Doctor doctor;
  final HourLabel hour;

  RendV(
      {required this.date,
      required this.patient,
      required this.doctor,
      required this.hour});

  static fromJson(Map<String, dynamic> json) {
    return RendV(
        date: json["date"],
        patient: Patient.fromJson(json["user"]),
        doctor: Doctor.fromJson(json["doctor"]),
        hour: HourLabel.fromJson(json["hourLabel"]));
  }
}
