import 'package:intl/intl.dart';

String dateTimeAndWeekDay(
    DateTime startDateDateTime, DateTime endDateDateTime) {
  final startDate = DateFormat('yyyy/MM/dd').format(startDateDateTime);

  final startTime = DateFormat('HH:mm').format(startDateDateTime);

  final endDate = DateFormat('yyyy/MM/dd').format(endDateDateTime);

  final endTime = DateFormat('HH:mm').format(endDateDateTime);

  return '$startDate（${YOUBI[startDateDateTime.weekday - 1]}）$startTime\n〜 $endDate（${YOUBI[endDateDateTime.weekday - 1]}）$endTime';
}

const List<String> YOUBI = ['月', '火', '水', '木', '金', '土', '日'];
