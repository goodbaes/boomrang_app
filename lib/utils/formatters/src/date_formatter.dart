import 'package:intl/intl.dart';

class DateFormatter {
  static final _dateYMD = DateFormat('yyyy-MM-dd');
  static final _dateDMY = DateFormat('dd-MM-yyyy');

  static String? tryFormatDMYToYMD(String value) {
    if (value.length < 10) return null;
    try {
      return _dateYMD.format(_dateDMY.parseLoose(value));
    } catch (_) {
      return null;
    }
  }

  static String formatToDMY(DateTime value) => _dateDMY.format(value);

  static DateTime parseYMD(String value) => _dateYMD.parse(value);
}
