import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reservation_medical_app/Controllers/date_controller.dart';

class MediCalendar extends StatelessWidget {
  MediCalendar({Key? key}) : super(key: key);
  final DateController _dateController = Get.find<DateController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DateController>(
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
