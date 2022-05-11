import 'dart:convert';

import 'package:get/get.dart';
import 'package:reservation_medical_app/models/doctor.dart';
import 'package:reservation_medical_app/models/speciality.dart';
import 'package:http/http.dart' as http;

class SpecialityController extends GetxController {
  Specility currentSpeciality = Specility(name: "All", img: "");
  List<dynamic> specialities = [];
  getRequet() async {
    try {
      var response = await http.get(Uri.parse('http://localhost:8080/sps'));
      if (response.statusCode == 200) {
        var responsebody = await jsonDecode(response.body);
        //var responsebody = jsonDecode(response.body);

        specialities = responsebody;
      } else {
        print("Error ${response.statusCode}");
        specialities = [];
      }
    } catch (e) {
      print("Error Catch $e");
      specialities = [];
    }

    print(specialities);
  }
  // onTapSpeciality(Specility speciality) {
  //   currentSpeciality = speciality;
  //   speciality.isSelected = currentSpeciality == speciality ? true : false;
  //   update();
  //   print(currentSpeciality.name);
  // }

  List<Doctor?> getDoctors() {
    List<Doctor?> listOfDoctors = [];
    for (var i = 0; i < sevenDoctors.length; i++) {
      if (sevenDoctors[i].speciality == currentSpeciality) {
        listOfDoctors.add(sevenDoctors[i]);
      }
    }

    if (currentSpeciality.name == "All") {
      return sevenDoctors;
    } else {
      return listOfDoctors;
    }
  }
}
