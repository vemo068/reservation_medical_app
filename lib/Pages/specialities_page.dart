import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reservation_medical_app/Controllers/speciality_controller.dart';
import 'package:reservation_medical_app/Pages/doctors_by_speciality_page.dart';
import 'package:reservation_medical_app/Styles/medi_colors.dart';
import 'package:reservation_medical_app/medi_components/mediappbar.dart';
import 'package:reservation_medical_app/models/speciality.dart';

class SpecialitiesPage extends StatelessWidget {
  SpecialitiesPage({Key? key}) : super(key: key);
  final SpecialityController _specialityController =
      Get.find<SpecialityController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: mediAppBar("All Specialities"),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: GetBuilder(
            init: _specialityController,
            builder: (_) {
              return GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 30,
                      mainAxisSpacing: 30),
                  itemCount: _specialityController.specialities.length,
                  itemBuilder: (context, index) {
                    return Material(
                      elevation: 5,
                      borderRadius: BorderRadius.circular(8),
                      child: InkWell(
                        splashColor: kcsecondary,
                        borderRadius: BorderRadius.circular(8),
                        onTap: () {
                          _specialityController.onTapSpeciality(
                              _specialityController.specialities[index]);
                          Get.to(() => SpecialityDoctorsPage());
                        },
                        child: Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: kcmain.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                  flex: 2,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        image: DecorationImage(
                                            image: NetworkImage(
                                                _specialityController
                                                    .specialities[index]
                                                    .imgUrl))),
                                  )),
                              Expanded(
                                  child: Text(_specialityController
                                      .specialities[index].specialityName))
                            ],
                          ),
                        ),
                      ),
                    );
                  });
            }),
      ),
    );
  }
}
