import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:kokuchi_event/domain/event/event.dart';
import 'package:kokuchi_event/presentation/notifier/event/event_detail/event_detail_state.dart';

class EventDto extends ChangeNotifier {
  EventDto(Event source)
      : id = source.id.value,
        author = source.author,
        title = source.title.value,
        category = source.category.value,
        startDate = source.date.start,
        endDate = source.date.end,
        status = source.status.value,
        online = source.holdWay.online.value,
        venue = source.holdWay.venue?.value,
        tool = source.holdWay.tool?.value,
        joinUrl = source.holdWay.joinUrl?.value,
        text = source.text?.value,
        letsGoCount = source.letsGoCount,
        officialPageUrl = source.officialPageUrl?.value,
        mainImageUrl = source.mainImageUrl?.value,
        subImagesUrl =
            source.subImageUrl?.value?.map((e) => e?.value)?.toList(),
        email = source.email?.value,
        phoneNumber = source.phoneNumber?.value,
        createdAt = source.createdAt,
        updatedAt = source.updateAt;

  EventDto.fromEventDetailState(EventDetailState source)
      : id = source.id,
        author = source.author,
        title = source.title,
        category = source.category,
        startDate = source.startDate,
        endDate = source.endDate,
        status = source.status,
        online = source.online,
        venue = source.venue,
        tool = source.tool,
        joinUrl = source.joinUrl,
        text = source.text,
        letsGoCount = source.letsGoCount,
        officialPageUrl = source.officialPageUrl,
        mainImageUrl = source.mainImageUrl,
        subImagesUrl = source.subImagesUrl,
        email = source.email,
        phoneNumber = source.phoneNumber,
        createdAt = source.createdAt,
        updatedAt = source.updatedAt;

  final String id;
  final DocumentReference author;
  final String title;
  final String category;
  final DateTime startDate;
  final DateTime endDate;
  final String status;
  final bool online;
  final String venue;
  final String tool;
  final String joinUrl;
  final String text;
  int letsGoCount;
  final String officialPageUrl;
  final String mainImageUrl;
  final List<String> subImagesUrl;
  final String email;
  final String phoneNumber;
  final DateTime createdAt;
  final DateTime updatedAt;

  void incrementLetsGoCount() {
    letsGoCount++;
    notifyListeners();
  }

  void decrementLetsGoCount() {
    // 表示上マイナスになるのを防ぐ
    if (letsGoCount == 0) {
      return;
    }

    letsGoCount--;
    notifyListeners();
  }
}
