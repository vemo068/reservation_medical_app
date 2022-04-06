import 'package:flutter/material.dart';

import 'package:reservation_medical_app/medi_components/medi_text.dart';

import '../Styles/medi_colors.dart';

class MediDoctorProfile extends StatelessWidget {
  const MediDoctorProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      height: 150,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                MediText.subHeading("الاسم واللقب"),
                MediText.subHeading("الاسم واللقب"),
                MediText.subHeading("الاسم واللقب"),
                MediText.subHeading("الاسم واللقب"),
              ],
            ),
          ),
          Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
                border: Border.all(color: kcsecondary),
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: AssetImage("assets/docpic1.jpg"),
                    fit: BoxFit.cover)),
          )
        ],
      ),
    );
  }
}
