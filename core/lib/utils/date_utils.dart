import '../types/timestamp.dart';

class DateUtil {
  static final DateTime dateZero = DateTime(0);

  static DateTime toDateTimeDefaultDateZero(dynamic value) {
    if (value is DateTime) return value;

    if(value is Timestamp ){
      
      final date = DateTime.fromMillisecondsSinceEpoch(value.microsecondsSinceEpoch);
      return date;
    }
    return DateTime.tryParse(value.toString()) ?? dateZero;
  }
}

extension DateUtils on DateTime {
  String toJsonString() {
    return toString();
  }
}
