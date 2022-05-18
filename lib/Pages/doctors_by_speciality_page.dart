import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reservation_medical_app/Controllers/speciality_controller.dart';
import 'package:reservation_medical_app/medi_components/medi_card.dart';
import 'package:reservation_medical_app/medi_components/mediappbar.dart';

class SpecialityDoctorsPage extends StatelessWidget {
  SpecialityDoctorsPage({Key? key}) : super(key: key);
  final SpecialityController _specialityController =
      Get.find<SpecialityController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: mediAppBar("${_specialityController.currentSpeciality.specialityName} doctors"),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GetBuilder<SpecialityController>(
            init: _specialityController,
            builder: (_) {
              return ListView.builder(
                  itemCount: _specialityController.doctors.length,
                  itemBuilder: (context, index) {
                    return MediCard(doctor: _specialityController.doctors[index]);
                  });
            }),
      ),
    );
  }
}
