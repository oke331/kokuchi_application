import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:kokuchi_event/domain/event/event_date/event_date.dart';
import 'package:kokuchi_event/domain/event/event_field.dart';
import 'package:kokuchi_event/domain/event/eveny_hold_way/event_hold_way.dart';
import 'package:kokuchi_event/domain/event/eveny_hold_way/value/event_join_url.dart';
import 'package:kokuchi_event/domain/event/eveny_hold_way/value/event_online.dart';
import 'package:kokuchi_event/domain/event/eveny_hold_way/value/event_tool.dart';
import 'package:kokuchi_event/domain/event/eveny_hold_way/value/event_venue.dart';
import 'package:kokuchi_event/domain/event/value/event_category.dart';
import 'package:kokuchi_event/domain/event/value/event_email.dart';
import 'package:kokuchi_event/domain/event/value/event_id.dart';
import 'package:kokuchi_event/domain/event/value/event_main_image_url.dart';
import 'package:kokuchi_event/domain/event/value/event_official_page_url.dart';
import 'package:kokuchi_event/domain/event/value/event_phone_number.dart';
import 'package:kokuchi_event/domain/event/value/event_status.dart';
import 'package:kokuchi_event/domain/event/value/event_sub_image_url.dart';
import 'package:kokuchi_event/domain/event/value/event_sub_images_url.dart';
import 'package:kokuchi_event/domain/event/value/event_text.dart';
import 'package:kokuchi_event/domain/event/value/event_title.dart';

class Event {
  Event({
    @required EventId id,
    @required EventTitle title,
    @required EventCategory category,
    @required EventDate date,
    @required EventStatus status,
    @required EventHoldWay holdWay,
    DocumentReference author,
    EventText text,
    int letsGoCount,
    EventOfficialPageUrl officialPageUrl,
    EventMainImageUrl mainImageUrl,
    EventSubImagesUrl subImagesUrl,
    EventPhoneNumber phoneNumber,
    EventEmail email,
    DateTime createdAt,
    DateTime updatedAt,
  })  : id = id,
        _title = title,
        _category = category,
        _date = date,
        _status = status,
        _holdWay = holdWay,
        _author = author,
        _text = text,
        _letsGoCount = letsGoCount,
        _email = email,
        _phoneNumber = phoneNumber,
        _officialPageUrl = officialPageUrl,
        _mainImageUrl = mainImageUrl,
        _subImagesUrl = subImagesUrl,
        _createdAt = createdAt,
        _updatedAt = updatedAt;

  EventId id;
  EventTitle _title;
  EventCategory _category;
  EventDate _date;
  EventStatus _status;
  EventHoldWay _holdWay;
  DocumentReference _author;
  EventText _text;
  int _letsGoCount;
  EventEmail _email;
  EventPhoneNumber _phoneNumber;
  EventOfficialPageUrl _officialPageUrl;
  EventMainImageUrl _mainImageUrl;
  EventSubImagesUrl _subImagesUrl;
  DateTime _createdAt;
  DateTime _updatedAt;

  EventTitle get title => _title;
  EventCategory get category => _category;
  EventDate get date => _date;
  EventStatus get status => _status;
  EventHoldWay get holdWay => _holdWay;
  DocumentReference get author => _author;
  EventText get text => _text;
  int get letsGoCount => _letsGoCount;
  EventEmail get email => _email;
  EventPhoneNumber get phoneNumber => _phoneNumber;
  EventOfficialPageUrl get officialPageUrl => _officialPageUrl;
  EventMainImageUrl get mainImageUrl => _mainImageUrl;
  EventSubImagesUrl get subImageUrl => _subImagesUrl;
  DateTime get createdAt => _createdAt;
  DateTime get updateAt => _updatedAt;

  // FirestoreのMapからインスタンス化
  Event.fromMap(
      {@required String documentId, @required Map<String, dynamic> map}) {
    _fromCommonWithoutDateAndAuthor(documentId: documentId, map: map);

    _author = map[EventField.author] as DocumentReference ?? null;

    // DartのDateに変換
    final originStartDate = map[EventField.startDate] != null
        ? map[EventField.startDate] as Timestamp
        : null;

    final originEndDate = map[EventField.endDate] != null
        ? map[EventField.endDate] as Timestamp
        : null;

    if (originStartDate is Timestamp && originEndDate is Timestamp) {
      _date = EventDate(originStartDate.toDate(), originEndDate.toDate());
    }

    // DartのDateに変換
    final originCreatedAt = map[EventField.createdAt] != null
        ? map[EventField.createdAt] as Timestamp
        : null;

    if (originCreatedAt is Timestamp) {
      _createdAt = originCreatedAt.toDate();
    }

    // DartのDateに変換
    final originUpdatedAt = map[EventField.updatedAt] != null
        ? map[EventField.updatedAt] as Timestamp
        : null;

    if (originUpdatedAt is Timestamp) {
      _updatedAt = originUpdatedAt.toDate();
    }
  }

  // AlgoliaのMapからインスタンス化
  Event.fromMapUseDateTime(
      {@required String documentId,
      @required DocumentReference author,
      @required Map<String, dynamic> map}) {
    _fromCommonWithoutDateAndAuthor(documentId: documentId, map: map);

    _author = author;

    final originStartDate = map[EventField.startDate] != null
        ? map[EventField.startDate] as int
        : null;

    final originEndDate =
        map[EventField.endDate] != null ? map[EventField.endDate] as int : null;

    _date = EventDate(DateTime.fromMillisecondsSinceEpoch(originStartDate),
        DateTime.fromMillisecondsSinceEpoch(originEndDate));

    final originCreatedAt = map[EventField.createdAt] != null
        ? map[EventField.createdAt] as int
        : null;

    _createdAt = DateTime.fromMillisecondsSinceEpoch(originCreatedAt);

    final originUpdatedAt = map[EventField.updatedAt] != null
        ? map[EventField.updatedAt] as int
        : null;

    _updatedAt = DateTime.fromMillisecondsSinceEpoch(originUpdatedAt);
  }

  void _fromCommonWithoutDateAndAuthor(
      {@required String documentId, @required Map<String, dynamic> map}) {
    id = EventId(documentId);
    _title = map[EventField.title] != null
        ? EventTitle(map[EventField.title].toString())
        : null;
    _category = map[EventField.category] != null
        ? EventCategory(map[EventField.category].toString())
        : null;
    _status = map[EventField.status] != null
        ? EventStatus(map[EventField.status].toString())
        : null;
    _text = map[EventField.text] != null
        ? EventText(map[EventField.text].toString())
        : null;
    _letsGoCount = map[EventField.letsGoCount] != null
        ? int.parse(map[EventField.letsGoCount].toString())
        : null;
    _phoneNumber = map[EventField.phoneNumber] != null
        ? EventPhoneNumber(map[EventField.phoneNumber].toString())
        : null;
    _email = map[EventField.email] != null
        ? EventEmail(map[EventField.email].toString())
        : null;
    _officialPageUrl = map[EventField.officialPageUrl] != null
        ? EventOfficialPageUrl(map[EventField.officialPageUrl].toString())
        : null;
    _mainImageUrl = map[EventField.mainImageUrl] != null
        ? EventMainImageUrl(map[EventField.mainImageUrl].toString())
        : null;

    final subImagesUrl = map[EventField.subImagesUrl] != null
        ? map[EventField.subImagesUrl] as List<dynamic>
        : null;
    _subImagesUrl = EventSubImagesUrl(subImagesUrl
        ?.map((dynamic e) => EventSubImageUrl(e?.toString()))
        ?.toList());

    final online = map[EventField.online] != null
        ? EventOnline(map[EventField.online] as bool)
        : null;

    final venue = map[EventField.venue] != null
        ? EventVenue(map[EventField.venue].toString())
        : null;

    final tool = map[EventField.tool] != null
        ? EventTool(map[EventField.tool].toString())
        : null;

    final joinUrl = map[EventField.joinUrl] != null
        ? EventJoinUrl(map[EventField.joinUrl].toString())
        : null;

    _holdWay = EventHoldWay(
        venue: venue, joinUrl: joinUrl, online: online, tool: tool);
  }

  // Firestore用のMapに変換
  Map<String, dynamic> toMapAndAddTimeStampCreate() {
    return <String, dynamic>{
      EventField.id: id.value,
      EventField.author: _author,
      EventField.title: _title.value,
      EventField.category: _category.value,
      EventField.startDate: Timestamp.fromDate(_date.start),
      EventField.endDate: Timestamp.fromDate(_date.end),
      EventField.status: _status.value,
      EventField.online: _holdWay.online.value,
      EventField.venue: _holdWay?.venue?.value,
      EventField.tool: _holdWay?.tool?.value,
      EventField.joinUrl: _holdWay?.joinUrl?.value,
      EventField.text: _text?.value,
      EventField.letsGoCount: _letsGoCount,
      EventField.email: _email.value,
      EventField.phoneNumber: _phoneNumber.value,
      EventField.officialPageUrl: _officialPageUrl?.value,
      EventField.mainImageUrl: _mainImageUrl?.value,
      EventField.subImagesUrl:
          _subImagesUrl?.value?.map((e) => e.value)?.toList(),
      EventField.createdAt: FieldValue.serverTimestamp(),
      EventField.reportCount: 0,
      EventField.updatedAt: FieldValue.serverTimestamp(),
    };
  }

  Map<String, dynamic> toMapAndAddTimeStampUpdate() {
    return <String, dynamic>{
      EventField.id: id.value,
      EventField.author: _author,
      EventField.title: _title.value,
      EventField.category: _category.value,
      EventField.startDate: Timestamp.fromDate(_date.start),
      EventField.endDate: Timestamp.fromDate(_date.end),
//      EventField.status: _status.value,
      EventField.online: _holdWay.online.value,
      EventField.venue: _holdWay?.venue?.value,
      EventField.tool: _holdWay?.tool?.value,
      EventField.joinUrl: _holdWay?.joinUrl?.value,
      EventField.text: _text?.value,
//      EventField.letsGoCount: _letsGoCount,
      EventField.email: _email?.value,
      EventField.phoneNumber: _phoneNumber?.value,
      EventField.officialPageUrl: _officialPageUrl?.value,
      EventField.mainImageUrl: _mainImageUrl?.value,
      EventField.subImagesUrl:
          _subImagesUrl?.value?.map((e) => e.value)?.toList(),
      EventField.updatedAt: FieldValue.serverTimestamp(),
    };
  }

  Map<String, dynamic> toMapAndAddTimeStampDelete() {
    return <String, dynamic>{
      EventField.id: id.value,
      EventField.author: _author,
      EventField.title: _title.value,
      EventField.category: _category.value,
      EventField.startDate: Timestamp.fromDate(_date.start),
      EventField.endDate: Timestamp.fromDate(_date.end),
      EventField.status: _status.value,
      EventField.online: _holdWay.online.value,
      EventField.venue: _holdWay?.venue?.value,
      EventField.tool: _holdWay?.tool?.value,
      EventField.joinUrl: _holdWay?.joinUrl?.value,
      EventField.text: _text?.value,
//      EventField.letsGoCount: _letsGoCount,
      EventField.email: _email?.value,
      EventField.phoneNumber: _phoneNumber?.value,
      EventField.officialPageUrl: _officialPageUrl?.value,
      EventField.mainImageUrl: _mainImageUrl?.value,
      EventField.subImagesUrl:
          _subImagesUrl?.value?.map((e) => e.value)?.toList(),
      EventField.updatedAt: FieldValue.serverTimestamp(),
    };
  }
}
