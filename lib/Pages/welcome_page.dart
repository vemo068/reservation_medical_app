import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reservation_medical_app/Controllers/user_controller.dart';
import 'package:reservation_medical_app/Pages/home_page.dart';
import 'package:reservation_medical_app/Pages/login/login_form.dart';
import 'package:reservation_medical_app/Styles/medi_colors.dart';
import 'package:reservation_medical_app/Styles/medi_styles.dart';
import 'package:reservation_medical_app/medi_components/medi_button.dart';

class WelcomePage extends StatelessWidget {
  WelcomePage({Key? key}) : super(key: key);
  final UserController userController = Get.put(UserController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(flex: 4, child: Container()),
          Expanded(
              flex: 2,
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    MediButton(
                        onPressed: () {
                          Get.to(() => LoginForm());
                        },
                        text: "Login",
                        color: kcsecondary,
                        ctx: context),
                    TextButton(
                        onPressed: () {
                          Get.offAll(() => HomePage());
                        },
                        child: Text(
                          "Later",
                          style: mediButtonStyle.copyWith(color: kcmain),
                        )),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
