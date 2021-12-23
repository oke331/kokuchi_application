import 'package:cloud_firestore/cloud_firestore.dart';

class EventLetsGoDto {
  EventLetsGoDto({this.id, this.eventRef, this.createdAt});

  final String id;
  final DocumentReference eventRef;
  final DateTime createdAt;
}
