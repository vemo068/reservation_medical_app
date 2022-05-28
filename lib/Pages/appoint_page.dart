import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reservation_medical_app/Controllers/appointement_controller.dart';
import 'package:reservation_medical_app/Styles/medi_colors.dart';
import 'package:reservation_medical_app/Styles/medi_styles.dart';
import 'package:reservation_medical_app/medi_components/hour_slot.dart';
import 'package:reservation_medical_app/medi_components/medi_calendar.dart';
import 'package:reservation_medical_app/medi_components/mediappbar.dart';
import 'package:reservation_medical_app/models/doctor.dart';
import 'package:reservation_medical_app/models/hour_label.dart';

class AppointPage extends StatelessWidget {
  final Doctor dr;
  AppointPage({Key? key, required this.dr}) : super(key: key);
  final AppointementController _appointementController =
      Get.put(AppointementController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(10.0),
        child: MaterialButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          onPressed: () {
            _appointementController.onTabAppointeButton(context);
          },
          color: Colors.green,
          minWidth: double.infinity,
          height: MediaQuery.of(context).size.height * 0.09,
          child: Text(
            "Make Appointement",
            style: mediButtonStyle,
          ),
        ),
      ),
      backgroundColor: kcbackground,
      appBar: mediAppBar("Appoint Page"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Choose Date",
              style: mediHeadlineStyle,
            ),
            MediCalendar(),
            SizedBox(
              height: 40,
            ),
            Text(
              "Choose Time",
              style: mediHeadlineStyle,
            ),
            SizedBox(
              height: 20,
            ),
            GetBuilder<AppointementController>(
                init: _appointementController,
                builder: (_) {
                  return _appointementController.loading
                      ? Expanded(
                          child: SizedBox(
                            child: Center(
                              child: Text(
                                "Loading...",
                                style: mediHeading2Style,
                              ),
                            ),
                          ),
                        )
                      : Wrap(
                          spacing: 20,
                          runSpacing: 20,
                          children: _appointementController.allLabels
                              .map((label) => HourSlot(
                                    label: label,
                                  ))
                              .toList(),
                        );
                }),
          ],
        ),
      ),
    );
  }
}
