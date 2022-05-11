import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reservation_medical_app/Controllers/speciality_controller.dart';
import 'package:reservation_medical_app/Pages/home_page.dart';
import 'package:reservation_medical_app/Pages/login/login_page.dart';
import 'package:reservation_medical_app/Styles/medi_colors.dart';
import 'package:reservation_medical_app/Styles/medi_styles.dart';
import 'package:reservation_medical_app/medi_components/medi_card.dart';
import 'package:reservation_medical_app/medi_components/search_bar.dart';
import 'package:reservation_medical_app/medi_components/speciality_card.dart';

import 'models/speciality.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
