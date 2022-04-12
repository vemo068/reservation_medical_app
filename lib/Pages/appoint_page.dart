import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reservation_medical_app/Controllers/date_controller.dart';
import 'package:reservation_medical_app/medi_components/medi_calendar.dart';
import 'package:reservation_medical_app/medi_components/mediappbar.dart';

class AppointPage extends StatelessWidget {
  AppointPage({Key? key}) : super(key: key);
  final DateController _dateController = Get.put(DateController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: mediAppBar("Appoint Page"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: [Text("Choose Date"), MediCalendar()],
        ),
      ),
    );
  }
}
