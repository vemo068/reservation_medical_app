import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reservation_medical_app/Pages/home_page.dart';
import 'package:reservation_medical_app/models/RendV.dart';
import 'package:reservation_medical_app/models/user.dart';
import 'package:reservation_medical_app/utils/http_service.dart';

class UserController extends GetxController {
  Patient? currentUser;



TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  List<RendV> myAppointements = [];
  HttpService _httpService = HttpService();
  bool loading = false;
  Future<void> getMyAppointements(int userId) async {
    loading = true;
    myAppointements = await _httpService.getMyAppointments(userId);
    loading = false;
    update();
  }

  Future<void> loginUser(String email, String password) async {
currentUser = await _httpService.loginUser(email, password);

    if (currentUser == null) {
      Get.snackbar("Login Faild", "please check your password or email");
    } else {
      Get.offAll(() => HomePage());
    }

  }
}
