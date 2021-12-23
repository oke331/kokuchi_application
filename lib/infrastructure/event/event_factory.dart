import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:kokuchi_event/domain/event/event.dart';
import 'package:kokuchi_event/domain/event/event_date/event_date.dart';
import 'package:kokuchi_event/domain/event/event_factory_base.dart';
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

class EventFactory implements EventFactoryBase {
  const EventFactory();

  @override
  Event create({
    @required String id,
    @required String title,
    @required String category,
    @required DateTime start,
    @required DateTime end,
    @required String status,
    @required bool online,
    DocumentReference author,
    String venue,
    String tool,
    String joinUrl,
    String text,
    int letsGoCount,
    String officialPageUrl,
    String mainImageUrl,
    List<String> subImagesUrl,
    String email,
    String phoneNumber,
  }) {
    return Event(
      id: EventId(id),
      author: author,
      title: EventTitle(title),
      category: EventCategory(category),
      date: EventDate(start, end),
      status: EventStatus(status),
      holdWay: EventHoldWay(
          online: EventOnline(online),
          joinUrl: EventJoinUrl(joinUrl),
          venue: EventVenue(venue),
          tool: EventTool(tool)),
      text: EventText(text),
      letsGoCount: letsGoCount,
      officialPageUrl: EventOfficialPageUrl(officialPageUrl),
      phoneNumber: EventPhoneNumber(phoneNumber),
      email: EventEmail(email),
      mainImageUrl: EventMainImageUrl(mainImageUrl),
      subImagesUrl: EventSubImagesUrl(
        subImagesUrl.map((e) => EventSubImageUrl(e)).toList(),
      ),
    );
  }
}
