import 'package:flutter/cupertino.dart';
import 'package:kokuchi_event/common/exception.dart';
import 'package:kokuchi_event/domain/event/eveny_hold_way/value/event_join_url.dart';
import 'package:kokuchi_event/domain/event/eveny_hold_way/value/event_online.dart';
import 'package:kokuchi_event/domain/event/eveny_hold_way/value/event_tool.dart';
import 'package:kokuchi_event/domain/event/eveny_hold_way/value/event_venue.dart';

@immutable
class EventHoldWay {
  EventHoldWay({this.venue, this.joinUrl, this.online, this.tool}) {
    if (online.value) {
//      if (joinUrl == null || tool == null) {
//        throw TwoNullEmptyException(
//            code: ExceptionCode.eventJoinUrl, code2: ExceptionCode.eventTool);
//      }
    } else {
      if (venue == null) {
        throw NullEmptyException(code: ExceptionCode.eventVenue);
      }
    }
  }

  final EventOnline online;
  final EventVenue venue;
  final EventTool tool;
  final EventJoinUrl joinUrl;
}
