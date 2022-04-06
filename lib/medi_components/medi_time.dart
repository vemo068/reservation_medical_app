import 'package:flutter/material.dart';
import '../Styles/medi_colors.dart';
import 'package:reservation_medical_app/medi_components/medi_text.dart';

class MediTime extends StatelessWidget {
  final String time;
  const MediTime(this.time, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      child: MediText.subHeading(time),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: kcsecondary, width: 2)),
    );
  }
}
