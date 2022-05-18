import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reservation_medical_app/medi_components/appoint_confirmation_dialog.dart';
import 'package:reservation_medical_app/models/RendV.dart';
import 'package:reservation_medical_app/models/doctor.dart';
import 'package:reservation_medical_app/models/hour_label.dart';
import 'package:reservation_medical_app/models/user.dart';
import 'package:reservation_medical_app/utils/http_service.dart';

class AppointementController extends GetxController {
  HttpService _httpService = HttpService();
  String? choosedDate = DateTime.now().toString().substring(0, 10);
  HourLabel choosedHour = HourLabel(label: "label");
  DateTime initDate = DateTime.now();
  String? appointementMessage;
  List<HourLabel> allLabels = [];
  @override
  void onInit() {
    super.onInit();
    getAllLabels();
  }

  onSelectDate(DateTime? date) {
    getAllLabels();
    choosedHour = HourLabel(label: "label");
    initDate = date!;
    choosedDate = date.toString().substring(0, 10);
    update();
    print(choosedDate);
  }

  onSelectHour(HourLabel label) {
    choosedHour = label;
    update();
    print(choosedHour.label);
  }

  onTabAppointeButton(BuildContext context) {
    if (choosedHour.label == "label") {
      Get.snackbar("Time not choosed", "Please choose Appointement hour");
    } else {
      appointementMessage =
          "Appointement on $choosedDate at ${choosedHour.label}";
      showDialog(
          context: context,
          builder: (_) {
            return AppointConfirmation();
          });
    }
    update();
  }

  bool loading = false;

  Future<void> getAllLabels() async {
    loading = true;
    allLabels = await _httpService.getAllHourLabels();
    loading = false;
    update();
  }

  Future<void> sendRendv(Doctor doctor) async {
    RendV rendV = RendV(
        date: choosedDate!,
        patient: Patient(
            id: 0,
            email: "email",
            name: "name",
            password: "password",
            phone: "phone"),
        doctor: doctor,
        hour: choosedHour);
    await _httpService.postRendV(rendV);
  }
}
