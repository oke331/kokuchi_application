import 'package:kokuchi_event/domain/user_report/value/user_report_content.dart';
import 'package:kokuchi_event/domain/user_report/value/user_report_my_id.dart';
import 'package:kokuchi_event/domain/user_report/value/user_report_other_id.dart';

class UserReport {
  UserReport(this.myId, this.otherId, this.content) {}

  final UserReportMyId myId;
  final UserReportOtherId otherId;
  final UserReportContent content;
}
