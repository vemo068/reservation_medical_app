import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reservation_medical_app/Controllers/appointement_controller.dart';
import 'package:reservation_medical_app/Controllers/doctor_controller.dart';
import 'package:reservation_medical_app/Controllers/user_appointments.dart';
import 'package:reservation_medical_app/Styles/medi_colors.dart';
import 'package:reservation_medical_app/Styles/medi_styles.dart';
import 'package:reservation_medical_app/medi_components/appointments_card.dart';
import 'package:reservation_medical_app/medi_components/medi_button.dart';
import 'package:reservation_medical_app/medi_components/medi_card.dart';
import 'package:reservation_medical_app/medi_components/mediappbar.dart';
import 'package:reservation_medical_app/models/RendV.dart';
import 'package:reservation_medical_app/models/doctor.dart';
import 'package:reservation_medical_app/models/hour_label.dart';
import 'package:reservation_medical_app/models/speciality.dart';
import 'package:reservation_medical_app/models/user.dart';

class MyAppointementsPage extends StatelessWidget {
  MyAppointementsPage({Key? key}) : super(key: key);
  final DoctorController doctorController = Get.put(DoctorController());
  final UserAppointments userAppointments = Get.find<UserAppointments>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kcbackground,
      appBar: mediAppBar("My Appointements"),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GetBuilder(
            init: userAppointments,
            builder: (_) {
              return ListView.builder(
                itemCount: userAppointments.myAppointements.length,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      AppointementCard(
                        rendV: userAppointments.myAppointements[index],
                      ),
                      SizedBox(height: 20),
                    ],
                  );
                },
              );
            }),
      ),
    );
  }
}

var fakeRenv = RendV(
  id: 1,
  date: "2022-05-22",
  doctor: Doctor(
    id: 1,
    name: "Dr. A",
    speciality: Speciality(
      imgUrl: "assets/doctor.jpg",
      specialityId: 1,
      specialityName: "Cardiologue",
    ),
    email: '',
    img: 'assets/doctor.jpg',
    password: '',
    phoneNumber: '',
  ),
  patient: Patient(
    id: 1,
    name: "Patient A",
    email: '',
    password: '',
    phone: '',
  ),
  hour: HourLabel(label: "11:00"),
);
