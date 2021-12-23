import 'package:kokuchi_event/domain/event_report/value/event_report_content.dart';
import 'package:kokuchi_event/domain/event_report/value/event_report_event_id.dart';
import 'package:kokuchi_event/domain/event_report/value/event_report_my_id.dart';
import 'package:kokuchi_event/domain/event_report/value/event_report_other_id.dart';

class EventReport {
  EventReport(this.myId, this.otherId, this.eventId, this.content) {}

  final EventReportMyId myId;
  final EventReportOtherId otherId;
  final EventReportEventId eventId;
  final EventReportContent content;
}
