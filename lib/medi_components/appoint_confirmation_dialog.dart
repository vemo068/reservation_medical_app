import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reservation_medical_app/Controllers/appointement_controller.dart';
import 'package:reservation_medical_app/Controllers/doctor_controller.dart';
import 'package:reservation_medical_app/Controllers/user_controller.dart';
import 'package:reservation_medical_app/Styles/medi_styles.dart';

class AppointConfirmation extends StatelessWidget {
  AppointConfirmation({Key? key}) : super(key: key);
  DoctorController doctorController = Get.find<DoctorController>();
  AppointementController _appointementController =
      Get.find<AppointementController>();
  final UserController userController = Get.find<UserController>();
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        "Appointement Confirmation",
        style: mediHeading2Style,
      ),
      actions: [
        TextButton(
          onPressed: () {
            Get.back();
          },
          child: Text(
            'Cancel',
            style: mediBodyStyle.copyWith(color: Colors.grey),
          ),
        ),
        TextButton(
          onPressed: () {
            _appointementController.sendRendv(
                doctorController.currentDoctor!, userController.currentUser!);
            
          },
          child: Text(
            'Ok',
            style: mediBodyStyle.copyWith(color: Colors.blue),
          ),
        ),
      ],
      content: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              _appointementController.appointementMessage!,
              style: mediBodyStyle,
            )
          ]),
    );
  }
}
