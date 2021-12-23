import 'package:cloud_firestore/cloud_firestore.dart';

class EventLetsGoUserDto {
  EventLetsGoUserDto(this.id, this.userRef, this.createdAt);

  final String id;
  final DocumentReference userRef;
  final DateTime createdAt;
}
