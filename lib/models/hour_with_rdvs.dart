import 'package:reservation_medical_app/models/RendV.dart';
import 'package:reservation_medical_app/models/hour_label.dart';

class HourWithRdvs {
  HourLabel hourLabel;
  List<RendV> rdvs;
  HourWithRdvs({required this.hourLabel, required this.rdvs});

  static fromJson(Map<String, dynamic> json) {
    return HourWithRdvs(
      hourLabel: HourLabel.fromJson(json["hourLabel"]),
      rdvs: cToList(json["rdvs"]),
    );
  }
}

List<RendV> cToList(List<dynamic> body) {
    
      List<RendV> rdvs = [];
      for (var item in body) {
        rdvs.add(RendV.fromJson(item));
      }
      return rdvs;
}