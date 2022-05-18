import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:reservation_medical_app/Controllers/doctor_controller.dart';
import 'package:reservation_medical_app/Controllers/speciality_controller.dart';
import 'package:reservation_medical_app/Pages/specialities_page.dart';
import 'package:reservation_medical_app/Styles/medi_colors.dart';
import 'package:reservation_medical_app/Styles/medi_styles.dart';
import 'package:reservation_medical_app/medi_components/medi_card.dart';
import 'package:reservation_medical_app/medi_components/mediappbar.dart';
import 'package:reservation_medical_app/medi_components/search_bar.dart';
import 'package:reservation_medical_app/medi_components/speciality_card.dart';
import 'package:reservation_medical_app/models/speciality.dart';
import 'package:reservation_medical_app/utils/http_service.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final DoctorController doctorController = Get.put(DoctorController());
  final SpecialityController specialityController =
      Get.put(SpecialityController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: mediAppBar("Home"),
          drawer: const NewD(),
          backgroundColor: kcbackground,
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Center(child: Text("Welcome", style: mediHeading3Style)),
                const Center(
                    child: Text("Choose a Doctor", style: mediHeading3Style)),
                const SearchBar(),
                GetBuilder<SpecialityController>(
                    init: specialityController,
                    builder: (_) {
                      return Column(
                        children: [
                        
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Specialities"),
                              TextButton(
                                  onPressed: () async {
                                    await HttpService().getAllSpecilities();
                                    // specialityController.getRequet();
                                    Get.to(() => SpecialitiesPage());
                                  },
                                  child: Text("Show All"))
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            height: 60,
                            width: double.infinity,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount:
                                  specialityController.specialities.length,
                              itemBuilder: ((context, index) {
                                return SpecialityCard(
                                  speciality:
                                      specialityController.specialities[index],
                                  tapped: (catId) {
                                    specialityController.onTapSpeciality(
                                        specialityController
                                            .specialities[index]);
                                  },
                                );
                              }),
                            ),
                          ),
                          Text(
                            specialityController
                                    .currentSpeciality.specialityName +
                                " doctors",
                            style: mediSubheadingStyle,
                          ),
                        ],
                      );
                    }),
                GetBuilder<SpecialityController>(
                    init: specialityController,
                    builder: (_) {
                      return Expanded(
                        child: SizedBox(
                          width: double.infinity,
                          child: ListView.builder(
                            itemCount: specialityController.doctors.length,
                            itemBuilder: (context, index) {
                              return MediCard(
                                doctor: specialityController.doctors[index],
                              );
                            },
                          ),
                        ),
                      );
                    })
              ],
            ),
          )),
    );
  }
}

class NewD extends StatelessWidget {
  const NewD({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Drawer();
  }
}
