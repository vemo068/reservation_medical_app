import 'package:get/get.dart';
import 'package:reservation_medical_app/models/doctor.dart';
import 'package:reservation_medical_app/models/speciality.dart';

class SpecialityController extends GetxController {
  Specility currentSpeciality = Specility(name: "All", img: "");

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
