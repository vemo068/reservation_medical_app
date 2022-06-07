import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reservation_medical_app/Controllers/user_controller.dart';
import 'package:reservation_medical_app/Styles/medi_colors.dart';
import 'package:reservation_medical_app/Styles/medi_styles.dart';
import 'package:reservation_medical_app/medi_components/medi_card.dart';
import 'package:reservation_medical_app/models/RendV.dart';

class AppointementCard extends StatelessWidget {
  final RendV rendV;
  AppointementCard({Key? key, required this.rendV}) : super(key: key);
  final UserController userController = Get.find<UserController>();
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: Center(
              child: Wrap(
                children: [
                  Icon(Icons.timer, color: kcbackground),
                  SizedBox(
                    width: 10,
                  ),
                  Text(rendV.date + ", " + rendV.hour.label,
                      style: mediButtonStyle.copyWith(color: kcwhite)),
                ],
              ),
            ),
            decoration: BoxDecoration(
              color: kcsecondary,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8), topRight: Radius.circular(8)),
            ),
          ),
          MediCard(
            doctor: rendV.doctor,
            clickable: false,
          ),
          SizedBox(
            height: 10,
          ),
          InkWell(
            onTap: () {
              userController.deleteMyAppointment(rendV.id!);
            },
            child: Container(
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.red, width: 1),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Cancel Appointment",
                  style: mediCaptionStyle.copyWith(color: kcwhite),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
