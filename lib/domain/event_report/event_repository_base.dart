import 'package:kokuchi_event/domain/event_report/event_report.dart';

abstract class EventReportRepositoryBase {
  Future<void> reportEvent(EventReport report);
}
