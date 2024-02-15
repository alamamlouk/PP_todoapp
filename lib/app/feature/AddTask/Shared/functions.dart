import 'package:intl/intl.dart';

String convertDate(DateTime dateTime) {
  return DateFormat('dd/MM/yyyy HH:mm').format(dateTime);
}
