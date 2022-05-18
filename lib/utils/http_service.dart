import 'package:reservation_medical_app/models/RendV.dart';
import 'package:reservation_medical_app/models/doctor.dart';
import 'package:reservation_medical_app/models/hour_label.dart';
import 'package:reservation_medical_app/models/speciality.dart';
import 'dart:convert';
import 'package:http/http.dart';
import 'package:reservation_medical_app/utils/links.dart';

class HttpService {
  Future<List<Specility>> getAllSpecilities() async {
    Response res = await get(Uri.parse(specialitiesUrl));

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);
      List<Specility> specialities = [];
      for (var item in body) {
        specialities.add(Specility.fromJson(item));
      }
      //  List<Specility> specialities =body.map((e) => Speciality.fromJson(e)).toList() ;

      return specialities;
    } else {
      throw "Unable to retrieve specialities.";
    }
  }

  Future<List<Doctor>> getAllDoctors() async {
    Response res = await get(Uri.parse(doctorsUrl));

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);
      List<Doctor> doctors = [];
      for (var item in body) {
        doctors.add(Doctor.fromJson(item));
      }
      //  List<Specility> specialities =body.map((e) => Speciality.fromJson(e)).toList() ;

      return doctors;
    } else {
      throw "Unable to retrieve doctors.";
    }
  }

  Future<List<Doctor>> getSpecialityDoctors(int speciality_id) async {
    Response res =
        await get(Uri.parse(specialityDoctorsUrl + "?id=$speciality_id"));

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);
      List<Doctor> doctors = [];
      for (var item in body) {
        doctors.add(Doctor.fromJson(item));
      }
      //  List<Specility> specialities =body.map((e) => Speciality.fromJson(e)).toList() ;

      return doctors;
    } else {
      throw "Unable to retrieve doctors from this speciality.";
    }
  }

  Future<List<HourLabel>> getAllHourLabels() async {
    Response res = await get(Uri.parse(hourLabelsAll));

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);
      List<HourLabel> hourLabels = [];
      for (var item in body) {
        hourLabels.add(HourLabel.fromJson(item));
      }
      //  List<Specility> specialities =body.map((e) => Speciality.fromJson(e)).toList() ;

      return hourLabels;
    } else {
      throw "Unable to retrieve labels.";
    }
  }

  Future<RendV> postRendV(RendV rendV) async {
    // var response = await http.get(Uri.parse(url));
    Map<String, dynamic> data = {
      "date": rendV.date,
      "user_id": rendV.patient.id,
      "doctor_id": rendV.doctor.id,
      "label_id": rendV.hour.id,
    };
    Response response = await post(Uri.parse(postRdv), body: json.encode(data));

    if (response.statusCode == 200) {
      var body = await json.decode(response.body);
      return RendV.fromJson(body);
    } else {
      throw "Unable to send rendv.";
    }
  }
}