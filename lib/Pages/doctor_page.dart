import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reservation_medical_app/Controllers/doctor_controller.dart';
import 'package:reservation_medical_app/Pages/appoint_page.dart';

import 'package:reservation_medical_app/Styles/medi_colors.dart';
import 'package:reservation_medical_app/Styles/medi_styles.dart';
import 'package:reservation_medical_app/medi_components/contact_buttons.dart';
import 'package:reservation_medical_app/medi_components/mediappbar.dart';
import 'package:reservation_medical_app/models/doctor.dart';

class DoctorPage extends StatelessWidget {
  final DoctorController doctorController = Get.find<DoctorController>();
  DoctorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Doctor doctor = doctorController.currentDoctor!;
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(10.0),
          child: MaterialButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            onPressed: () {
              Get.to(() => AppointPage(
                    dr: doctor,
                  ));
            },
            color: kcsecondary,
            minWidth: double.infinity,
            height: MediaQuery.of(context).size.height * 0.07,
            child: Text(
              "Appoint",
              style: mediButtonStyle,
            ),
          ),
        ),
        backgroundColor: kcbackground,
        appBar: mediAppBar("Doctor Details"),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: SingleChildScrollView(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Hero(
                    tag: doctor.name,
                    child: Center(
                      child: Container(
                        height: 180,
                        width: 180,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image: AssetImage(doctor.img),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ContactButtons(phone: doctor.phoneNumber,email: doctor.email,),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    doctor.name,
                    style: mediHeading3Style,
                  ),
                  Text(
                    doctor.speciality.specialityName,
                    style: mediBodyStyle,
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Location:",
                style: mediHeadlineStyle,
              ),
              Container(
                height: MediaQuery.of(context).size.height / 4,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(18),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "Price:",
                    style: mediHeadlineStyle,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    "1200 DA",
                    style: mediButtonStyle.copyWith(color: Colors.green),
                  )
                ],
              ),
            ],
          )),
        ),
      ),
    );
  }
}
