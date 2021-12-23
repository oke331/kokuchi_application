import 'package:kokuchi_event/domain/user_report/user_report.dart';

abstract class UserReportRepositoryBase {
  Future<void> reportUser(UserReport report);
}
