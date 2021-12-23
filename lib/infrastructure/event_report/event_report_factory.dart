import 'package:flutter/cupertino.dart';
import 'package:kokuchi_event/domain/event_report/event_factory_base.dart';
import 'package:kokuchi_event/domain/event_report/event_report.dart';
import 'package:kokuchi_event/domain/event_report/value/event_report_content.dart';
import 'package:kokuchi_event/domain/event_report/value/event_report_event_id.dart';
import 'package:kokuchi_event/domain/event_report/value/event_report_my_id.dart';
import 'package:kokuchi_event/domain/event_report/value/event_report_other_id.dart';

class EventReportFactory implements EventReportFactoryBase {
  const EventReportFactory();

  @override
  EventReport create({
    @required String myId,
    @required String otherId,
    @required String eventId,
    @required String content,
  }) {
    return EventReport(EventReportMyId(myId), EventReportOtherId(otherId),
        EventReportEventId(eventId), EventReportContent(content));
  }
}
