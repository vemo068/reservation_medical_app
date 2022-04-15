import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reservation_medical_app/Pages/appoint_page.dart';
import 'package:reservation_medical_app/Styles/medi_colors.dart';
import 'package:reservation_medical_app/Styles/medi_styles.dart';
import 'package:reservation_medical_app/medi_components/contact_buttons.dart';
import 'package:reservation_medical_app/medi_components/mediappbar.dart';
import 'package:reservation_medical_app/models/doctor.dart';

class DoctorPage extends StatelessWidget {
  final Doctor doctor;
  const DoctorPage({Key? key, required this.doctor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Scaffold(
            backgroundColor: kcbackground,
            appBar: mediAppBar("Doctor Details"),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: SingleChildScrollView(
                  child: Column(
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
                      ContactButtons(doctor:doctor),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        doctor.name,
                        style: mediHeading3Style,
                      ),
                      Text(
                        doctor.speciality.name,
                        style: mediBodyStyle,
                      ),
                    ],
                  ),
                ],
              )),
            ),
          ),
          Positioned(
            bottom: 20,
            left: 20,
            right: 20,
            child: MaterialButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              onPressed: () {
                Get.to(() => AppointPage());
              },
              color: kcsecondary,
              minWidth: double.infinity,
              height: MediaQuery.of(context).size.height * 0.09,
              child: Text(
                "Appoint",
                style: mediButtonStyle,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
