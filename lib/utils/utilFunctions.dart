import 'package:intl/intl.dart';

String timeFormatDate(DateTime _selectedTime) {
  DateTime tempDate = DateFormat("hh:mm").parse(
      _selectedTime.hour.toString() + ":" + _selectedTime.minute.toString());
  var dateFormat = DateFormat("h:mm a");
  return dateFormat.format(tempDate);
}

String dateFormat(DateTime date) {
  var formatDate = DateFormat('dd-MM-yyyy').format(date);
  return formatDate.toString();
}

String dateFormatString(String date) {
  DateTime dateFormatted = DateTime.parse(date);
  var formatDate = DateFormat('dd-MM-yyyy').format(dateFormatted);
  return formatDate.toString();
}