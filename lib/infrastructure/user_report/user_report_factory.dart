import 'package:flutter/cupertino.dart';
import 'package:kokuchi_event/domain/user_report/user_report.dart';
import 'package:kokuchi_event/domain/user_report/user_report_factory_base.dart';
import 'package:kokuchi_event/domain/user_report/value/user_report_content.dart';
import 'package:kokuchi_event/domain/user_report/value/user_report_my_id.dart';
import 'package:kokuchi_event/domain/user_report/value/user_report_other_id.dart';

class UserReportFactory implements UserReportFactoryBase {
  const UserReportFactory();

  @override
  UserReport create({
    @required String myId,
    @required String otherId,
    @required String content,
  }) {
    return UserReport(UserReportMyId(myId), UserReportOtherId(otherId),
        UserReportContent(content));
  }
}
