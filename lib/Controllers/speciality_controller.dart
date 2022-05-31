

import 'package:get/get.dart';
import 'package:reservation_medical_app/models/doctor.dart';
import 'package:reservation_medical_app/models/speciality.dart';
import 'package:http/http.dart' as http;
import 'package:reservation_medical_app/utils/http_service.dart';

class SpecialityController extends GetxController {
  Speciality currentSpeciality = Speciality(specialityName: "All", imgUrl: "");
  HttpService _httpService = HttpService();
  List<Doctor> doctors = [];
  List<Speciality> specialities = [];

  @override
  void onInit() {
    getAllSpecialities();
    getDoctors();
    update();
    super.onInit();
  }

  onTapSpeciality(Speciality speciality) {
    currentSpeciality = speciality;
    getDoctors();
    // speciality.isSelected = currentSpeciality == speciality ? true : false;
    update();
    print(currentSpeciality.specialityName);
  }
bool spLoading = false;
  Future<void> getAllSpecialities() async {
    spLoading = true;
    specialities = await _httpService.getAllSpecilities();
    spLoading = false;
    update();
  }
bool drLoading = false;
  Future<void> getDoctors() async {
    drLoading = true;
    if (currentSpeciality.specialityName == "All") {
      doctors = await _httpService.getAllDoctors();
    } else {
      doctors = await _httpService
          .getSpecialityDoctors(currentSpeciality.specialityId!);
    }
    drLoading = false;
    update();
  }
}
