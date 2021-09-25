import 'package:get/get.dart';
import 'package:intl/intl.dart';

class OrderHistoryController extends GetxController {
  List<OrderUiModerl> orderList = [
    OrderUiModerl('Ахуенбаева 12', DateTime.now(), 'Новый'),
    OrderUiModerl('5 мкр 44', DateTime.now(), 'Получен'),
    OrderUiModerl('Манаса 3', DateTime.now(), 'Отменен')
  ];
}

class OrderUiModerl {
  OrderUiModerl(this.address, this.dateTime, this.status);
  final String address;
  final DateTime dateTime;
  final String status;
  String get getDateTimeString => dateFormat('dd MMMM yyyy, HH:mm', dateTime);
}

String dateFormat(String pattern, DateTime date) {
  return DateFormat(
    pattern,
  ).format(date);
}
