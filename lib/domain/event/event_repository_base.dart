import 'dart:core';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kokuchi_event/domain/event/event.dart';
import 'package:kokuchi_event/domain/event/value/event_id.dart';
import 'package:kokuchi_event/domain/user/value/user_id.dart';
import 'package:kokuchi_event/domain/user/value/user_prefecture.dart';

abstract class EventRepositoryBase {
  Future<List<Event>> fetchNewEvent(int limitNumber, {DateTime startAfter});
  Future<List<Event>> findByUserId(int limitNumber, UserId id,
      {DateTime startAfter});
  Future<Event> findByUserIdAndEventId(UserId userId, EventId eventId);
  Future<Event> findByEventId(EventId eventId);
  Future<List<Event>> fetchByMap(
    int limitNumber,
    int pageIndex, {
    String searchWord,
    String category,
    DateTime startDate,
    DateTime endDate,
    bool online,
  });
  Future<DocumentReference> getUserReference(UserId id);
  Future<String> getIdBeforeCreate(UserId id);
  Future<void> saveCreate(UserId id, Event event);
  Future<void> saveUpdate(UserId id, Event event);
  Future<void> saveDelete(UserId id, Event event);
//  Future<void> remove(UserId userId, Event event);
  Future<String> uploadImage(
      {EventId eventId, UserId userId, File file, String folderName});
  Future<void> deleteImage(String imageUrl);
  // Cloud Storage側に移行
//  Future<void> deleteEventStorage(UserId userId, EventId eventId);
  Future<void> letsGoAdd({UserId postUserId, EventId eventId, UserId myUserId});
  Future<void> letsGoDelete(
      {UserId postUserId, EventId eventId, UserId myUserId});
  Future<void> fetchLetsGoUser(EventId eventId);
  Future<LetsGoEventFetch> fetchLetsGos(
      {UserId userId, DateTime startAfter, int limitNumber});
  Future<List<Event>> getEventsByPrefecture({UserPrefecture prefecture});
  Future<List<Event>> getEventsByOnline();
  Future<void> cancelMember(UserId userId);
}

class LetsGoEventFetch {
  LetsGoEventFetch({this.events, this.startAfter});

  final List<Event> events;
  final DateTime startAfter;
}
