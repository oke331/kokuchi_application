import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:kokuchi_event/domain/event/event.dart';

abstract class EventFactoryBase {
  Event create({
    @required String id,
    @required DocumentReference author,
    @required String title,
    @required String category,
    @required DateTime start,
    @required DateTime end,
    @required String status,
    @required bool online,
    @required String venue,
    @required String tool,
    @required String joinUrl,
    @required String text,
    @required int letsGoCount,
//    List<int> starCount,
    @required String officialPageUrl,
    @required String mainImageUrl,
    @required List<String> subImagesUrl,
    @required String email,
    @required String phoneNumber,
  });
}
