import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reservation_medical_app/Controllers/appointement_controller.dart';

class MediCalendar extends StatelessWidget {
  MediCalendar({Key? key}) : super(key: key);
  final AppointementController _dateController =
      Get.find<AppointementController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppointementController>(
        init: _dateController,
        builder: (_) {
          return CalendarTimeline(
            locale: 'en',
            dayNameColor: Colors.black,
            initialDate: _dateController.choosedDate!,
            firstDate: DateTime.now(),
            lastDate: DateTime(2023, 9, 15),
            onDateSelected: _dateController.onSelectDate,
          );
        });
  }
}
