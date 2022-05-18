import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reservation_medical_app/Controllers/appointement_controller.dart';
import 'package:reservation_medical_app/Styles/medi_colors.dart';
import 'package:reservation_medical_app/Styles/medi_styles.dart';
import 'package:reservation_medical_app/models/hour_label.dart';

class HourSlot extends StatelessWidget {
  final HourLabel label;
  bool isSelected = false;
  HourSlot({Key? key, required this.label}) : super(key: key);
  final AppointementController _appointementController =
      Get.find<AppointementController>();
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: _appointementController,
        builder: (_) {
          if (label.label == _appointementController.choosedHour.label) {
            isSelected = true;
          } else {
            isSelected = false;
          }
          return InkWell(
            onTap: () {
              _appointementController.onSelectHour(label);
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: isSelected ? kcmain : Colors.grey[300],
              ),
              child: Text(
                label.label,
                style: mediButtonStyle.copyWith(
                    color: isSelected ? Colors.white : Colors.black),
              ),
            ),
          );
        });
  }
}
