import 'package:get/get.dart';
import 'package:intl/intl.dart';

class HomeController extends GetxController {
  String getCurrentDayAndDate() {
    final DateTime now = DateTime.now();
    final String day = DateFormat('EEEE').format(now); // Day of the week
    final String date = DateFormat('d').format(now); // Day of the month

    return '$day, $date';
  }

  static void home() {}
}
