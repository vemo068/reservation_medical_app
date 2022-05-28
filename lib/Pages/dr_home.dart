import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reservation_medical_app/Controllers/appointement_controller.dart';
import 'package:reservation_medical_app/Controllers/doctor_controller.dart';
import 'package:reservation_medical_app/Styles/medi_colors.dart';
import 'package:reservation_medical_app/Styles/medi_styles.dart';
import 'package:reservation_medical_app/medi_components/medi_calendar.dart';
import 'package:reservation_medical_app/medi_components/mediappbar.dart';

class HomeDoctor extends StatelessWidget {
  HomeDoctor({Key? key}) : super(key: key);
  final AppointementController appointementController =
      Get.put(AppointementController());
  final DoctorController doctorController = Get.put(DoctorController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kcbackground,
      appBar: mediAppBar("Home"),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(
              "Welcome Dr. ${doctorController.currentDoctor!.name}",
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Your Appointments",
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 20,
            ),
            MediCalendar(),
            GetBuilder(
                init: appointementController,
                builder: (_) {
                  return Expanded(
                    child: ListView.builder(
                      itemCount: appointementController.appointments.length,
                      itemBuilder: (context, indexAppoint) {
                        return Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ListTile(
                              title: Text(
                                appointementController
                                    .appointments[indexAppoint].hourLabel.label,
                                style: mediHeading1Style,
                              ),
                            ),
                            SizedBox(
                              height: 80,
                              child: ListView.builder(
                                  itemCount: appointementController
                                      .appointments[indexAppoint].rdvs.length,
                                  itemBuilder: (context, index) {
                                    return appointementController
                                            .appointments[indexAppoint]
                                            .rdvs
                                            .isNotEmpty
                                        ? Column(
                                            children: [
                                              ListTile(
                                                title: Text(
                                                  appointementController
                                                      .appointments[
                                                          indexAppoint]
                                                      .rdvs[index]
                                                      .patient
                                                      .name,
                                                  style: mediBodyStyle,
                                                ),
                                                subtitle: Text(
                                                  "${appointementController.appointments[indexAppoint].rdvs[index].id}",
                                                  style: mediBodyStyle,
                                                ),
                                              ),
                                              Divider(
                                                thickness: 1,
                                              ),
                                            ],
                                          )
                                        : Center(
                                            child: Text(
                                            "No Appointments",
                                            style: mediHeading2Style.copyWith(
                                                color: Colors.grey),
                                          ));
                                  }),
                            ),
                          ],
                        );
                      },
                    ),
                  );
                }),
          ],
        ),
      ),
    );
  }
}
