import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reservation_medical_app/Controllers/user_controller.dart';
import 'package:reservation_medical_app/Pages/home_page.dart';
import 'package:reservation_medical_app/Pages/server_config.dart';
import 'package:reservation_medical_app/Pages/signup_personal.dart';
import 'package:reservation_medical_app/Styles/medi_colors.dart';
import 'package:reservation_medical_app/medi_components/medi_button.dart';
import 'package:reservation_medical_app/medi_components/mediappbar.dart';

class LoginForm extends StatelessWidget {
  final UserController userController = Get.find<UserController>();
  LoginForm({Key? key}) : super(key: key);
  String email = "";
  String password = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kcbackground,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kcmain,
        title: Text("Login"),
        actions: [
          IconButton(
              onPressed: () {
                Get.to(() => ServerConfig());
              },
              icon: Icon(Icons.computer))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              onChanged: (value) {
                email = value;
              },
              decoration: InputDecoration(
                hintText: "Email",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              onChanged: (value) {
                password = value;
              },
              decoration: InputDecoration(
                hintText: "Password",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            MediButton(
                onPressed: () {
                  userController.loginUser(email, password);
                },
                text: "Login",
                color: Colors.green,
                ctx: context),
            SizedBox(
              height: 40,
            ),
            MediButton(
                onPressed: () {
                  Get.to(() => SignUpPersonal());
                },
                text: "Sign Up",
                color: kcsecondary,
                ctx: context),
          ],
        ),
      ),
    );
  }
}
