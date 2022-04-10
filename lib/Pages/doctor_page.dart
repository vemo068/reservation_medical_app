import 'package:flutter/material.dart';
import 'package:reservation_medical_app/Styles/medi_colors.dart';
import 'package:reservation_medical_app/models/doctor.dart';

class DoctorPage extends StatelessWidget {
  final Doctor doctor;
  const DoctorPage({Key? key, required this.doctor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: kcmain,
          title: const Text("Doctor Details"),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: SingleChildScrollView(
              child: Column(
            children: [
              Hero(
                tag: doctor.name,
                child: Container(
                  height: 200,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: AssetImage(doctor.img),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ],
          )),
        ),
      ),
    );
  }
}
