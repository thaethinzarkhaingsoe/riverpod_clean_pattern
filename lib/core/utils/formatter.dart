
import 'package:intl/intl.dart';
/// Format date (e.g., 2025-07-28 -> July 28, 2025)
String formatDate(DateTime date, {String format = 'yMMMMd'}) {
  return DateFormat(format).format(date);
}
