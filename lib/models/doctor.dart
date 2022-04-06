import 'package:reservation_medical_app/models/speciality.dart';

class Doctor {
  final String name;
  final String img;
  final Specility speciality;
  final String workTime;
  Doctor({required this.name, required this.img, required this.speciality, required this.workTime});
  
}

var sevenDoctors=[
  Doctor(name: "Dr. Ahmed0", img: "assets/doctor.jpg", speciality: sps[0], workTime: "08:00-12:00"),
  Doctor(name: "Dr. Ahmed00", img: "assets/doctor.jpg", speciality: sps[0], workTime: "08:00-12:00"),
  Doctor(name: "Dr. Ahmed2", img: "assets/doctor.jpg", speciality:sps[2], workTime: "08:00-12:00"),
  Doctor(name: "Dr. Ahmed22", img: "assets/doctor.jpg", speciality: sps[2], workTime: "08:00-12:00"),
  Doctor(name: "Dr. Ahmed3", img: "assets/doctor.jpg", speciality: sps[3], workTime: "08:00-12:00"),
  Doctor(name: "Dr. Ahmed4", img: "assets/doctor.jpg", speciality: sps[4], workTime: "08:00-12:00"),
  Doctor(name: "Dr. Ahmed1", img: "assets/doctor.jpg", speciality:sps[1], workTime: "08:00-12:00"),
  Doctor(name: "Dr. Ahmed11", img: "assets/doctor.jpg", speciality:sps[1], workTime: "08:00-12:00"),
  Doctor(name: "Dr. Ahmed33", img: "assets/doctor.jpg", speciality: sps[3], workTime: "08:00-12:00"),
  Doctor(name: "Dr. Ahmed44", img: "assets/doctor.jpg", speciality:sps[4], workTime: "08:00-12:00"),];