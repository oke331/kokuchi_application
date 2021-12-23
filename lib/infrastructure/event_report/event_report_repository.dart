import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kokuchi_event/domain/event_report/event_report.dart';
import 'package:kokuchi_event/domain/event_report/event_repository_base.dart';

class EventReportRepository extends EventReportRepositoryBase {
  final _usersCollection = Firestore.instance.collection('users');

  @override
  Future<void> reportEvent(EventReport report) async {
    await _usersCollection
        .document(report.otherId.value)
        .collection('events')
        .document(report.eventId.value)
        .collection('eventReports')
        .document(report.myId.value)
        .set(<String, dynamic>{
      'content': report.content.value,
      'createdAt': FieldValue.serverTimestamp(),
    }, SetOptions(merge: true));
  }
}
