import 'package:get/get.dart';
import 'package:reservation_medical_app/models/RendV.dart';
import 'package:reservation_medical_app/utils/http_service.dart';


class UserAppointments extends GetxController {
  List<RendV> myAppointements = [];
   HttpService _httpService = HttpService();
   bool loading = false;
   Future<void> getMyAppointements(int userId) async {
    loading = true;
    myAppointements = await _httpService.getMyAppointments(
       userId);
    loading = false;
    update();
  }
}