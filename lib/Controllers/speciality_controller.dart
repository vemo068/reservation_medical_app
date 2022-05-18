import 'dart:convert';

import 'package:get/get.dart';
import 'package:reservation_medical_app/models/doctor.dart';
import 'package:reservation_medical_app/models/speciality.dart';
import 'package:http/http.dart' as http;
import 'package:reservation_medical_app/utils/http_service.dart';

class SpecialityController extends GetxController {
  Specility currentSpeciality = Specility(specialityName: "All", imgUrl: "");
  HttpService _httpService = HttpService();
  List<Doctor> doctors = [];
  List<Specility> specialities = [];

  @override
  void onInit() {
    getAllSpecialities();
    getDoctors();
    update();
    super.onInit();
  }

  onTapSpeciality(Specility speciality) {
    currentSpeciality = speciality;
    getDoctors();
    // speciality.isSelected = currentSpeciality == speciality ? true : false;
    update();
    print(currentSpeciality.specialityName);
  }

  Future<void> getAllSpecialities() async {
    specialities = await _httpService.getAllSpecilities();
    update();
  }

  Future<void> getDoctors() async {
    if (currentSpeciality.specialityName == "All") {
      doctors = await _httpService.getAllDoctors();
    } else {
      doctors = await _httpService
          .getSpecialityDoctors(currentSpeciality.specialityId!);
    }
    update();
  }
}
