import 'package:get/get.dart';

class DateController extends GetxController {
  DateTime? choosedDate = DateTime.now();

  onSelectDate(DateTime? date) {
    choosedDate = date;
    update();
    print(choosedDate);
  }
}
