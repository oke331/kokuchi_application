import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:kokuchi_event/domain/event_report/event_report.dart';

export 'package:kokuchi_event/domain/user/user.dart';

abstract class EventReportFactoryBase {
  EventReport create({
    @required String myId,
    @required String eventId,
    @required String content,
    @required String otherId,
  });
}
