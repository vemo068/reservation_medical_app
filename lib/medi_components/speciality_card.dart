import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reservation_medical_app/Controllers/speciality_controller.dart';
import 'package:reservation_medical_app/Styles/medi_colors.dart';
import 'package:reservation_medical_app/models/speciality.dart';

class SpecialityCard extends StatelessWidget {
  final Specility speciality;
  final Function(String) tapped;
  final bool isSelected;
  SpecialityCard({
    Key? key,
    required this.speciality,
    required this.tapped,
    required this.isSelected,
  }) : super(key: key);
  final SpecialityController specialityController =
      Get.find<SpecialityController>();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SpecialityController>(
        init: specialityController,
        builder: (_) {
          return InkWell(
            splashColor: Colors.transparent,
            hoverColor: Colors.transparent,
            onTap: () {
              tapped(speciality.name);
            },
            child: AnimatedContainer(
              duration: Duration(milliseconds: 150),
              margin: const EdgeInsets.only(left: 10),
              height: 60,
              width: 60,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: isSelected ? kcmain : kcmain.withOpacity(0.2),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Image.asset(
                speciality.img,
                fit: BoxFit.cover,
              ),
            ),
          );
        });
  }
}
