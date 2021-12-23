import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:kokuchi_event/domain/user_report/user_report.dart';

export 'package:kokuchi_event/domain/user/user.dart';

abstract class UserReportFactoryBase {
  UserReport create({
    @required String myId,
    @required String otherId,
    @required String content,
  });
}
