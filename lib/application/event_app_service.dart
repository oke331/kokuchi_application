import 'dart:io';

import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:kokuchi_event/application/dto/event/event_dto.dart';
import 'package:kokuchi_event/domain/event/event_factory_base.dart';
import 'package:kokuchi_event/domain/event/event_repository_base.dart';
import 'package:kokuchi_event/domain/event/value/event_id.dart';
import 'package:kokuchi_event/domain/user/value/user_id.dart';

class EventAppService {
  EventAppService(
      {@required EventRepositoryBase repository,
      @required EventFactoryBase factory})
      : _repository = repository,
        _factory = factory;

  final EventRepositoryBase _repository;
  final EventFactoryBase _factory;

  Future<List<EventDto>> findByUserId(String id, {DateTime startAfter}) async {
    final events =
        await _repository.findByUserId(20, UserId(id), startAfter: startAfter);
    return events.map((e) => EventDto(e)).toList();
  }

  Future<EventDto> findByUserIdAndEventId(String userId, String eventId) async {
    final event = await _repository.findByUserIdAndEventId(
        UserId(userId), EventId(eventId));
    return EventDto(event);
  }

  Future<EventDto> findByEventId(String eventId) async {
    final event = await _repository.findByEventId(EventId(eventId));
    return EventDto(event);
  }

  Future<List<EventDto>> fetchByMap({
    @required int pageIndex,
    String searchWord,
    String category,
    DateTime startDate,
    DateTime endDate,
    bool online,
  }) async {
    final events = await _repository.fetchByMap(100, pageIndex,
        searchWord: searchWord,
        category: category,
        startDate: startDate,
        endDate: endDate,
        online: online);

    return events.map((e) => EventDto(e)).toList();
  }

  Future<void> save({
    bool isDelete = false,
    String userId,
    String id,
    @required String title,
    @required String category,
    @required DateTime startDate,
    @required DateTime endDate,
    @required String status,
    @required bool online,
    @required String text,
    @required String venue,
    @required String joinUrl,
    @required String tool,
    @required File mainImageFile,
    @required String beforeMainImageUrl,
    @required List<File> subImagesFile,
    @required List<String> beforeSubImagesUrl,
    @required String officialPageUrl,
    @required int letsGoCount,
    @required String email,
    @required String phoneNumber,
    @required bool trashBeforeMainImage,
    @required List<bool> trashBeforeSubImages,
  }) async {
    final author = await _repository.getUserReference(UserId(userId));
    letsGoCount ??= 0;

    // 新規作成
    if (id == null || id.isEmpty) {
      id = await _repository.getIdBeforeCreate(UserId(userId));
      final uploadMainImageUrl = await _uploadMainImage(
          id, userId, mainImageFile, beforeMainImageUrl, trashBeforeMainImage);
      final uploadSubImagesUrl = await _uploadSubImages(
          id, userId, subImagesFile, beforeSubImagesUrl, trashBeforeSubImages);
      await _repository.saveCreate(
          UserId(userId),
          _factory.create(
              id: id,
              author: author,
              title: title,
              category: category,
              start: startDate,
              end: endDate,
              status: status,
              online: online,
              venue: venue,
              tool: tool,
              joinUrl: joinUrl,
              text: text,
              letsGoCount: letsGoCount,
              officialPageUrl: officialPageUrl,
              phoneNumber: phoneNumber,
              email: email,
              mainImageUrl: uploadMainImageUrl ?? beforeMainImageUrl,
              subImagesUrl: uploadSubImagesUrl ?? beforeSubImagesUrl));
    } else {
      // 編集
      final uploadMainImageUrl = await _uploadMainImage(
          id, userId, mainImageFile, beforeMainImageUrl, trashBeforeMainImage);
      final uploadSubImagesUrl = await _uploadSubImages(
          id, userId, subImagesFile, beforeSubImagesUrl, trashBeforeSubImages);
      if (isDelete) {
        await _repository.saveDelete(
            UserId(userId),
            _factory.create(
                id: id,
                author: author,
                title: title,
                category: category,
                start: startDate,
                end: endDate,
                status: status,
                online: online,
                venue: venue,
                tool: tool,
                joinUrl: joinUrl,
                text: text,
                letsGoCount: letsGoCount,
                officialPageUrl: officialPageUrl,
                phoneNumber: phoneNumber,
                email: email,
                mainImageUrl: uploadMainImageUrl,
                subImagesUrl: uploadSubImagesUrl));
      } else {
        await _repository.saveUpdate(
            UserId(userId),
            _factory.create(
                id: id,
                author: author,
                title: title,
                category: category,
                start: startDate,
                end: endDate,
                status: status,
                online: online,
                venue: venue,
                tool: tool,
                joinUrl: joinUrl,
                text: text,
                letsGoCount: letsGoCount,
                officialPageUrl: officialPageUrl,
                phoneNumber: phoneNumber,
                email: email,
                mainImageUrl: uploadMainImageUrl,
                subImagesUrl: uploadSubImagesUrl));
      }
    }
  }

  Future<String> _uploadMainImage(String eventId, String userId, File file,
      String beforeImageUrl, bool trashBeforeImage) async {
    if (file != null) {
      // upload
      final url = await _repository.uploadImage(
          eventId: EventId(eventId),
          userId: UserId(userId),
          file: file,
          folderName: 'mainImage');

      // 削除
      if (beforeImageUrl != null && beforeImageUrl.isNotEmpty) {
        await _repository.deleteImage(beforeImageUrl);
      }

      return url;
    }

    // ファイルが何も選択されていない場合で削除された場合
    if (trashBeforeImage) {
      if (beforeImageUrl != null && beforeImageUrl.isNotEmpty) {
        await _repository.deleteImage(beforeImageUrl);
      }

      return null;
    }

    return beforeImageUrl;
  }

  Future<List<String>> _uploadSubImages(
      String eventId,
      String userId,
      List<File> files,
      List<String> beforeImagesUrl,
      List<bool> trashBeforeImages) async {
    final urls = <String>[];

    if (files != null) {
      for (var i = 0; i < files.length; i++) {
        if (files[i] != null) {
          final url = await _repository.uploadImage(
              eventId: EventId(eventId),
              userId: UserId(userId),
              file: files[i],
              folderName: 'subImages');
          if (beforeImagesUrl != null && beforeImagesUrl[i] != null) {
            await _repository.deleteImage(beforeImagesUrl[i]);
          }

          urls.add(url);
        } else {
          // 何も選択されなかった場合
          // ファイルが何も選択されていない場合で削除された場合
          if (trashBeforeImages[i]) {
            if (beforeImagesUrl[i] != null && beforeImagesUrl[i].isNotEmpty) {
              await _repository.deleteImage(beforeImagesUrl[i]);
            }

            urls.add(null);
            // 以前登録したURLがある場合
          } else if (beforeImagesUrl[i] != null &&
              beforeImagesUrl[i].isNotEmpty) {
            urls.add(beforeImagesUrl[i]);
            // ファイルの削除もせず、以前登録したURLもない場合
          } else {
            urls.add(null);
          }
        }
      }
      return urls;
    }
    return beforeImagesUrl;
  }

//  Future<void> remove(String userId, String eventId) async {
  // Cloud Function側に移行
//    await _repository.deleteEventStorage(UserId(userId), EventId(eventId));

//    return _repository.remove(UserId(userId), EventId(eventId));
//  }
}
