import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reservation_medical_app/Controllers/appointement_controller.dart';
import 'package:reservation_medical_app/Controllers/doctor_controller.dart';
import 'package:reservation_medical_app/Controllers/speciality_controller.dart';
import 'package:reservation_medical_app/Controllers/user_appointments.dart';
import 'package:reservation_medical_app/Pages/my_appoitements.dart';
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
          drawer: NewD(),
          backgroundColor: kcbackground,
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10,
                ),
                Text("Welcome", style: mediHeadlineStyle),
                Text("Choose a Doctor", style: mediHeadlineStyle),
                SizedBox(
                  height: 20,
                ),
                GetBuilder<SpecialityController>(
                    init: specialityController,
                    builder: (_) {
                      return specialityController.spLoading
                          ? Center(child: CircularProgressIndicator())
                          : Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Specialities"),
                                    TextButton(
                                        onPressed: () async {
                                          await HttpService()
                                              .getAllSpecilities();
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
                                    itemCount: specialityController
                                        .specialities.length,
                                    itemBuilder: ((context, index) {
                                      return SpecialityCard(
                                        speciality: specialityController
                                            .specialities[index],
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
                      return specialityController.drLoading
                          ? Center(
                              child: CircularProgressIndicator(),
                            )
                          : Expanded(
                              child: SizedBox(
                                width: double.infinity,
                                child: ListView.builder(
                                  itemCount:
                                      specialityController.doctors.length,
                                  itemBuilder: (context, index) {
                                    return MediCard(
                                      doctor:
                                          specialityController.doctors[index],
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
  NewD({
    Key? key,
  }) : super(key: key);
  //final UserController userController = Get.find<UserController>();
  final UserController userController = Get.put(UserController());
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            child: userController.currentUser == null
                ? Container(
                    color: kcmain,
                  )
                : UserAccountsDrawerHeader(
                    accountEmail: Text(userController.currentUser!.email),
                    accountName: Text(
                      userController.currentUser!.name,
                      style: mediSubheadingStyle,
                    ),
                  ),
          ),
          ListTile(
            leading: Icon(Icons.calendar_month_outlined),
            title: Text("My Appointments"),
            onTap: () {
              userController.getMyAppointements(0);
              Get.back();
              Get.to(() => MyAppointementsPage());
            },
          )
        ],
      ),
    );
  }
}
