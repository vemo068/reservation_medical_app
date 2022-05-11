import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reservation_medical_app/medi_components/appoint_confirmation_dialog.dart';

class AppointementController extends GetxController {
  DateTime? choosedDate = DateTime.now();
  String? choosedHour;
  String? appointementMessage;

  onSelectDate(DateTime? date) {
    choosedDate = DateTime(date!.year, date.month, date.day);
    update();
    print(choosedDate);
  }

  onSelectHour(String hour) {
    choosedHour = hour;
    update();
    print(choosedHour);
  }

  onTabAppointeButton(BuildContext context) {
    if (choosedHour == null) {
      Get.snackbar("Time not choosed", "Please choose Appointement hour");
    } else {
      appointementMessage =
          "Appointement on ${choosedDate!.toLocal()} at $choosedHour";
      showDialog(
          context: context,
          builder: (_) {
            return AppointConfirmation();
          });
    }
    update();
  }
}
