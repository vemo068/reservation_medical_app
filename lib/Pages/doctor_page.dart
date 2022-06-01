import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reservation_medical_app/Controllers/doctor_controller.dart';
import 'package:reservation_medical_app/Controllers/user_appointments.dart';
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
  

  Future<void> _launchInBrowser(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw 'Could not launch $url';
    }
  }

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
                    "Login First", "You should login to make appointments");
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
                  ContactButtons(
                    phone: doctor.phoneNumber,
                    email: doctor.email,
                  ),
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
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                child: MaterialButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  color: kcmain,
                  height: 50,
                  onPressed: () {
                    _launchInBrowser(Uri.parse(doctor.mapUrl!));
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.location_on,
                        color: kcwhite,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Open in Google Maps",
                        style: mediButtonStyle,
                      ),
                    ],
                  ),
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
                    "${doctor.price}DA",
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
