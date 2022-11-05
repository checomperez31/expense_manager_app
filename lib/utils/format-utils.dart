import 'package:intl/intl.dart';

class FormatUtils {
  static String ZonedDateTimeFormat = 'yyyy-MM-ddTHH:mm:ss.SZ';

  static String? dateToServerFormat(DateTime? dateTime) {
    return dateTime != null? formatDate(dateTime, ZonedDateTimeFormat): null;
  }

  static DateTime? dateFromServer(String? str) {
    return str != null? DateTime.tryParse(str): null;
  }

  static String formatDate(DateTime date, String format) {
    if ( format.contains('Z') ) {
      int minutes = date.timeZoneOffset.inMinutes;
      var sign = '+';
      if ( minutes.isNegative ) {
        minutes*=-1;
        sign = '-';
      }
      var hours = '${minutes~/60}'.padLeft(2, '0');
      final remainingMinutes = '${minutes%60}'.padLeft(2, '0');
      format = format.replaceAll('Z', '$sign$hours:$remainingMinutes');
    }
    return DateFormat( format ).format( date );
  }
}