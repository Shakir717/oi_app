
import 'package:intl/intl.dart';

class HelperFunctions {

  static String getTime(String timestamp) {
    DateTime dateTime =
    DateTime.fromMillisecondsSinceEpoch(int.parse(timestamp));
    DateFormat format;
    if (DateTime.now().difference(dateTime).inMilliseconds <= 86400000) {
      format = DateFormat('E,  h:mm a');
    } else {

      format = DateFormat('E,  h:mm a');
    }
    return format
        .format(DateTime.fromMillisecondsSinceEpoch(int.parse(timestamp)));
  }
}
