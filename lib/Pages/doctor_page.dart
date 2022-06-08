import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reservation_medical_app/Controllers/doctor_controller.dart';
import 'package:reservation_medical_app/Controllers/user_controller.dart';
import 'package:reservation_medical_app/Pages/appoint_page.dart';
import 'package:reservation_medical_app/Pages/login/login_form.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:reservation_medical_app/Styles/medi_colors.dart';
import 'package:reservation_medical_app/Styles/medi_styles.dart';
import 'package:reservation_medical_app/medi_components/contact_buttons.dart';
import 'package:reservation_medical_app/medi_components/mediappbar.dart';
import 'package:reservation_medical_app/models/doctor.dart';

class DoctorPage extends StatelessWidget {
  final DoctorController doctorController = Get.find<DoctorController>();
  final UserController userController = Get.find<UserController>();
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
              if (userController.currentUser == null) {
                Get.to(() => LoginForm());

                Get.snackbar(
                  "Login First",
                  "You should login to make appointments",
                  colorText: Colors.red,
                  backgroundColor: Colors.white,
                );
              } else {
                Get.to(() => AppointPage(
                      dr: doctor,
                    ));
              }
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
        body: SingleChildScrollView(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 20),
              decoration: BoxDecoration(
                color: kcmain,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Hero(
                    tag: doctor.name,
                    child: Center(
                      child: Container(
                        height: 150,
                        width: 150,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image: AssetImage(doctor.img!),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Dr." + doctor.name,
                    style: mediHeadlineStyle.copyWith(color: kcwhite),
                  ),
                  Text(
                    doctor.speciality.specialityName,
                    style: mediSubheadingStyle.copyWith(color: kcwhite),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ContactButtons(
                    mapUrl: doctor.mapUrl!,
                    phone: doctor.phoneNumber,
                    email: doctor.email,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("About Doctor :", style: mediHeadlineStyle),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "${doctor.name} is an internationally recognised expert in nephrology and transplant medicine in area of cardiovascular diseases of uraemia, renal anaemia, and renal bone disease, progression of chronic kidney disease and mediators of acute kidney injury.",
                    style: mediBodyStyle.copyWith(color: Colors.grey),
                    textAlign: TextAlign.justify,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "Price :",
                        style: mediHeadlineStyle,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        "${doctor.price}DA",
                        style: mediButtonStyle.copyWith(color: Colors.green),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        )),
      ),
    );
  }
}
