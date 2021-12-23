import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kokuchi_event/domain/user_report/user_report.dart';
import 'package:kokuchi_event/domain/user_report/user_report_repository_base.dart';

class UserReportRepository extends UserReportRepositoryBase {
  final _usersCollection = Firestore.instance.collection('users');

  @override
  Future<void> reportUser(UserReport report) async {
    await _usersCollection
        .document(report.otherId.value)
        .collection('userReports')
        .document(report.myId.value)
        .set(<String, dynamic>{
      'content': report.content.value,
      'createdAt': FieldValue.serverTimestamp(),
    }, SetOptions(merge: true));
  }
}
