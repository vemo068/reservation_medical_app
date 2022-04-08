import 'package:flutter/material.dart';

import 'package:reservation_medical_app/medi_components/medi_text.dart';
import 'package:reservation_medical_app/models/doctor.dart';

import '../Styles/medi_colors.dart';

class MediCard extends StatelessWidget {
  final Doctor? doctor;
  const MediCard({Key? key, required this.doctor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20, right: 20, top: 10),
      child: Material(
        borderRadius: BorderRadius.circular(10),
        elevation: 5,
        child: Container(
          height: 130,
          width: double.infinity,
          decoration: BoxDecoration(
            color: kcwhite,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                flex: 3,
                child: Container(
                  height: 110,
                  width: 110,
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    image: DecorationImage(
                      image: AssetImage(doctor!.img),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Expanded(
                  child: Container(
                    padding: EdgeInsets.only(left: 10, top: 10, bottom: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MediText.headingThree(doctor!.name),
                        MediText.body(doctor!.speciality.name),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(doctor!.workTime,
                                style: TextStyle(
                                    color: kcsecondary,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600)),
                          ],
                        )
                      ],
                    ),
                  ),
                  flex: 5),
            ],
          ),
        ),
      ),
    );
  }
}
