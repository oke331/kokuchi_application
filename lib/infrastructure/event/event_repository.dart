import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:kokuchi_event/algolia_environment.dart';
import 'package:kokuchi_event/common/event_status_situation.dart';
import 'package:kokuchi_event/common/exception.dart';
import 'package:kokuchi_event/domain/event/event.dart';
import 'package:kokuchi_event/domain/event/event_field.dart';
import 'package:kokuchi_event/domain/event/event_repository_base.dart';
import 'package:kokuchi_event/domain/event/value/event_id.dart';
import 'package:kokuchi_event/domain/user/value/user_id.dart';
import 'package:kokuchi_event/domain/user/value/user_prefecture.dart';

class EventRepository extends EventRepositoryBase {
  final usersCollection = Firestore.instance.collection('users');
  static const eventsCollection = 'events';
  static const letsGosCollection = 'letsGos';
  static const letsGoUsersCollection = 'letsGoUsers';

  @override
  Future<List<Event>> fetchNewEvent(int limitNumber,
      {DateTime startAfter}) async {
    var query = Firestore.instance
        .collectionGroup(eventsCollection)
        .where(EventField.status,
            whereIn: EventStatusSituation.getOKSituation())
        .orderBy('createdAt', descending: true);

    if (startAfter != null) {
      final updatedAtTimestamp = Timestamp.fromDate(startAfter);
      query = query.startAfter(<Timestamp>[updatedAtTimestamp]);
    }

    if (limitNumber != null) {
      query = query.limit(limitNumber);
    }

    final events = await query.getDocuments();

    return events.documents
        .map((e) => Event.fromMap(documentId: e.id, map: e.data()))
        .toList();
  }

  @override
  Future<List<Event>> findByUserId(int limitNumber, UserId id,
      {DateTime startAfter}) async {
    var query = usersCollection
        .document(id.value)
        .collection(eventsCollection)
        .where(EventField.status,
            whereIn: EventStatusSituation.getOKSituation())
        .orderBy('updatedAt', descending: true);

    if (startAfter != null) {
      final updatedAtTimestamp = Timestamp.fromDate(startAfter);
      query = query.startAfter(<Timestamp>[updatedAtTimestamp]);
    }

    if (limitNumber != null) {
      query = query.limit(limitNumber);
    }

    final events = await query.getDocuments();

    return events.documents
        .map((e) => Event.fromMap(documentId: e.id, map: e.data()))
        .toList();
  }

  @override
  Future<Event> findByUserIdAndEventId(UserId userId, EventId eventId) async {
    final event = await Firestore.instance
        .collection('users')
        .document(userId.value)
        .collection('events')
        .document(eventId.value)
        .get();

    return Event.fromMap(documentId: event.id, map: event.data());
  }

  @override
  Future<Event> findByEventId(EventId eventId) async {
    final events = await Firestore.instance
        .collectionGroup('events')
        .where('id', isEqualTo: eventId.value)
        .getDocuments();

    final event = events.documents[0];

    return Event.fromMap(documentId: event.id, map: event.data());
  }

  @override
  Future<List<Event>> fetchByMap(
    int limitNumber,
    int pageIndex, {
    String searchWord,
    String category,
    DateTime startDate,
    DateTime endDate,
    bool online,
  }) async {
    var query =
        AlgoliaEnvironment.indexAtUpdatedAtDesc.search(searchWord ?? '');
    query = query.setFacetFilter(EventStatusSituation.getOKAlgoliaSituation());

    if (online != null) query = query.setFacetFilter('online:$online');
    if (endDate != null)
      query = query
          .setNumericFilter('startDate <  ${endDate.millisecondsSinceEpoch}');
    if (startDate != null)
      query = query
          .setNumericFilter('endDate >  ${startDate.millisecondsSinceEpoch}');
    if (category != null && category.isNotEmpty)
      query = query.setFacetFilter('category:$category');

    query = query.setHitsPerPage(limitNumber);
    query = query.setPage(pageIndex);

    final result = await query.getObjects();

    return result.hits.map((e) {
      final authorString =
          e.data[EventField.author]['_path']['segments'][1] as String;
      final author = usersCollection.document(authorString);
      return Event.fromMapUseDateTime(
          documentId: e.data['id'] as String, author: author, map: e.data);
    }).toList();
  }

  @override
  Future<DocumentReference> getUserReference(UserId id) async {
    return usersCollection.document(id.value);
  }

  @override
  Future<String> getIdBeforeCreate(UserId id) async {
    return usersCollection
        .document(id.value)
        .collection(eventsCollection)
        .doc()
        .id;
  }

  @override
  Future<void> saveCreate(UserId id, Event event) async {
    final createdEventData = event.toMapAndAddTimeStampCreate();
    await usersCollection
        .document(id.value)
        .collection(eventsCollection)
        .document(event.id.value)
        .set(createdEventData, SetOptions(merge: true));
  }

  @override
  Future<void> saveUpdate(UserId id, Event event) async {
    final updateEventData = event.toMapAndAddTimeStampUpdate();
    await usersCollection
        .document(id.value)
        .collection(eventsCollection)
        .document(event.id.value)
        .set(updateEventData, SetOptions(merge: true));
  }

  @override
  Future<void> saveDelete(UserId id, Event event) async {
    final updateEventData = event.toMapAndAddTimeStampDelete();
    await usersCollection
        .document(id.value)
        .collection(eventsCollection)
        .document(event.id.value)
        .set(updateEventData, SetOptions(merge: true));
  }

  ///
  /// 削除してもイベント自体は残し、ステータスを変更するようにsaveで対応
  ///
//  @override
//  Future<void> remove(UserId userId, Event event) async {
//
//        await usersCollection
//        .document(userId.value)
//        .collection(eventsCollection)
//        .document(eventId.value)
//        .delete();
//  }

  @override
  Future<String> uploadImage(
      {EventId eventId, UserId userId, File file, String folderName}) async {
    final timestamp = DateTime.now().microsecondsSinceEpoch;
    const subDirectoryName = 'eventImages';
    final ref = FirebaseStorage()
        .ref()
        .child('users')
        .child(userId.value)
        .child(subDirectoryName)
        .child(eventId.value)
        .child(folderName)
        .child('$timestamp');
    final uploadTask = ref.putFile(file);
    final snapshot = await uploadTask.onComplete;
    if (snapshot.error == null) {
      final dynamic url = await snapshot.ref.getDownloadURL();
      return url.toString();
    } else {
      throw FileUploadException();
    }
  }

  @override
  Future<void> deleteImage(String imageUrl) async {
    final result = await FirebaseStorage.instance.getReferenceFromUrl(imageUrl);
    if (result != null) {
      await result.delete();
    }
  }

//  @override
//  Future<void> deleteEventStorage(UserId userId, EventId eventId) async {
//    const subDirectoryName = 'eventImages';
//    final ref = FirebaseStorage()
//        .ref()
//        .child('users')
//        .child(userId.value)
//        .child(subDirectoryName)
//        .child(eventId.value);
//    await ref.delete();
//  }

  @override
  Future<void> letsGoAdd(
      {UserId postUserId, EventId eventId, UserId myUserId}) async {
    final batch = Firestore.instance.batch();
    final letsGoUserRef = usersCollection
        .document(postUserId.value)
        .collection(eventsCollection)
        .document(eventId.value)
        .collection(letsGoUsersCollection)
        .document(myUserId.value);

    final letsGoRef = usersCollection
        .document(myUserId.value)
        .collection(letsGosCollection)
        .document(eventId.value);

    final eventRef = usersCollection
        .document(postUserId.value)
        .collection(eventsCollection)
        .document(eventId.value);

    // eventのletsGoUsersコレクションに追加
    batch.set(letsGoUserRef, <String, dynamic>{
      EventLetsGoUserField.userRef: usersCollection.document(myUserId.value),
      EventLetsGoUserField.createdAt: FieldValue.serverTimestamp(),
    });
    // 自分のletsGosに追加
    batch.set(letsGoRef, <String, dynamic>{
      EventLetsGoField.eventRef: eventRef,
      EventLetsGoField.createdAt: FieldValue.serverTimestamp(),
    });

    await batch.commit();
  }

  @override
  Future<void> letsGoDelete(
      {UserId postUserId, EventId eventId, UserId myUserId}) async {
    final batch = Firestore.instance.batch();
    final letsGoUserRef = usersCollection
        .document(postUserId.value)
        .collection(eventsCollection)
        .document(eventId.value)
        .collection(letsGoUsersCollection)
        .document(myUserId.value);

    final letsGoRef = usersCollection
        .document(myUserId.value)
        .collection(letsGosCollection)
        .document(eventId.value);

    // eventのletsGoUsersコレクションから削除
    batch.delete(letsGoUserRef);
    // 自分のletsGosから削除
    batch.delete(letsGoRef);

    await batch.commit();
  }

  @override
  Future<void> fetchLetsGoUser(EventId eventId) {
    // TODO: implement fetchLetsGoUser
    throw UnimplementedError();
  }

  @override
  Future<LetsGoEventFetch> fetchLetsGos(
      {UserId userId, DateTime startAfter, int limitNumber}) async {
    var query = usersCollection
        .document(userId.value)
        .collection(letsGosCollection)
        .orderBy(EventLetsGoField.createdAt, descending: true);
    if (startAfter != null) {
      final updatedAtTimestamp = Timestamp.fromDate(startAfter);
      query = query.startAfter(<Timestamp>[updatedAtTimestamp]);
    }
    if (limitNumber != null) {
      query = query.limit(limitNumber);
    }
    final letsGos = await query.getDocuments();

    if (letsGos != null && letsGos.documents.isEmpty) {
      return null;
    }

    var orgEvents = await Future.wait(
        letsGos.documents.map((e) async => _letsGoSideJoin(e)).toList());

    var events = List<Event>.from(orgEvents);
    // statusがrejectのものを外す
    events.removeWhere((element) =>
        element.status.value == EventStatusSituation.reject ||
        element.status.value == EventStatusSituation.delete);

    final startAfterTimestamp = letsGos.documents?.last
        ?.data()[EventLetsGoField.createdAt] as Timestamp;

    final startAfterDate = startAfterTimestamp?.toDate();

    return LetsGoEventFetch(events: events, startAfter: startAfterDate);
  }

  Future<Event> _letsGoSideJoin(DocumentSnapshot e) async {
    final eventRef = e.data()[EventLetsGoField.eventRef] != null
        ? e.data()[EventLetsGoField.eventRef] as DocumentReference
        : null;

    if (eventRef != null) {
      final event = await Firestore.instance.document(eventRef.path).get();
      if (event != null) {
        return Event.fromMap(documentId: event.id, map: event.data());
      }
    }
    return null;
  }

  @override
  Future<List<Event>> getEventsByOnline() async {
    final now = DateTime.now();
    print(now.millisecondsSinceEpoch.toString());
    var query = AlgoliaEnvironment.indexAtLetsGoCountDesc.search('');
    query = query.setFacetFilter('online:true');
    query = query.setNumericFilter('endDate > ${now.millisecondsSinceEpoch}');
    query = query.setFacetFilter(EventStatusSituation.getOKAlgoliaSituation());
    query = query.setHitsPerPage(30);

    final result = await query.getObjects();
    return result.hits.map((e) {
      final authorString =
          e.data[EventField.author]['_path']['segments'][1] as String;
      final author = usersCollection.document(authorString);
      return Event.fromMapUseDateTime(
          documentId: e.data['id'] as String, author: author, map: e.data);
    }).toList();
  }

  @override
  Future<List<Event>> getEventsByPrefecture({UserPrefecture prefecture}) async {
    final now = DateTime.now();

    final prefectureValue = prefecture.value;

    // 都道府県の文字を削除するため、末尾の場所を返す
    final pos = prefectureValue.length - 1;
    // 最初からposまでの部分文字列を取得
    final prefectureLastCut = prefectureValue.substring(0, pos);

    var query =
        AlgoliaEnvironment.indexAtLetsGoCountDesc.search(prefectureLastCut);
    query = query.setFacetFilter('online:false');
    query = query
        .setNumericFilter('endDate > ${now.millisecondsSinceEpoch.toString()}');
    query = query.setFacetFilter(EventStatusSituation.getOKAlgoliaSituation());
    query = query.setHitsPerPage(30);

    final result = await query.getObjects();
    return result.hits.map((e) {
      final authorString =
          e.data[EventField.author]['_path']['segments'][1] as String;
      final author = usersCollection.document(authorString);
      return Event.fromMapUseDateTime(
          documentId: e.data['id'] as String, author: author, map: e.data);
    }).toList();
  }

  /// user情報はすでに変更している前提
  /// eventsのステータスをdeleteにし、letsGoを０にする
  /// ユーザーのeventのletsGoUserを削除はコストがかかるため行わない（要するに、イベントの情報はそのまま）
  /// ユーザーがいきたい！を押したイベントのletsGoUsersは削除
  ///
  ///
  var _operationCounter = 0;
  var _batchIndex = 0;
  var _batchList = <WriteBatch>[];

  @override
  Future<void> cancelMember(UserId userId) async {
    _batchList = <WriteBatch>[];
    _batchIndex = 0;

    // eventのステータスをdeleteに変更
    await _changeEventStatusDelete(userId.value);

    // いきたいを押していたイベント側のユーザーから削除
    await _deleteEventLetsGoUser(userId.value);

    // letsGosを削除
    await _deleteLetsGos(userId.value);

    if (_batchList.isNotEmpty) {
      for (final batch in _batchList) {
        await batch.commit();
      }
    }
  }

  Future<void> _changeEventStatusDelete(String userId) async {
    _operationCounter = 0;

    final getEvents = await usersCollection
        .document(userId)
        .collection('events')
        .where('status', whereIn: <String>['public', 'reject']).getDocuments();

    if (getEvents.documents.isNotEmpty) {
      _batchList.add(Firestore.instance.batch());

      getEvents.documents.forEach((element) {
        // eventのstatusをdeleteに変更
        final eventID = element.id;
        final event = element.data();
        event.update(EventField.status, (dynamic e) => 'delete');
        event.remove(EventField.createdAt);
        event.update(
            EventField.updatedAt, (dynamic e) => FieldValue.serverTimestamp());

        _operationCounter++;
        _batchList[_batchIndex].update(
            usersCollection
                .document(userId)
                .collection('events')
                .document(eventID),
            event);

        if (_operationCounter == 499) {
          _batchList.add(Firestore.instance.batch());
          _batchIndex++;
          _operationCounter = 0;
        }
      });
    }
  }

  Future<void> _deleteEventLetsGoUser(String userId) async {
    _operationCounter = 0;

    final letsGoUsers = await Firestore.instance
        .collectionGroup('letsGoUsers')
        .where('userRef', isEqualTo: usersCollection.document(userId))
        .getDocuments();

    if (letsGoUsers.documents.isNotEmpty) {
      _batchList.add(Firestore.instance.batch());

      letsGoUsers.documents.forEach((element) {
        _operationCounter++;
        _batchList[_batchIndex].delete(element.reference);

        if (_operationCounter == 499) {
          _batchList.add(Firestore.instance.batch());
          _batchIndex++;
          _operationCounter = 0;
        }
      });
    }
  }

  Future<void> _deleteLetsGos(String userId) async {
    _operationCounter = 0;

    final letsGos = await usersCollection
        .document(userId)
        .collection(letsGosCollection)
        .getDocuments();

    if (letsGos.documents.isNotEmpty) {
      _batchList.add(Firestore.instance.batch());

      letsGos.documents.forEach((element) {
        _operationCounter++;
        _batchList[_batchIndex].delete(element.reference);

        if (_operationCounter == 499) {
          _batchList.add(Firestore.instance.batch());
          _batchIndex++;
          _operationCounter = 0;
        }
      });
    }
  }
}
