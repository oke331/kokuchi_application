import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kokuchi_event/application/dto/event/event_dto.dart';
import 'package:kokuchi_event/application/dto/user_dto.dart';
import 'package:kokuchi_event/application/user_app_service.dart';
import 'package:kokuchi_event/common/exception.dart';
import 'package:kokuchi_event/presentation/notifier/event/my_event_edit/my_event_edit_state.dart';
import 'package:kokuchi_event/presentation/widget/common/toast.dart';
import 'package:state_notifier/state_notifier.dart';

part 'event_detail_state.freezed.dart';

@freezed
abstract class EventDetailState with _$EventDetailState {
  const factory EventDetailState({
    @Default(false) bool isLoading,
    @Default(false) bool isPostConfirm,
    @Default(false) bool isMyEventEdit,
    String id,
    DocumentReference author,
    String title,
    String category,
    DateTime startDate,
    DateTime endDate,
    String status,
    bool online,
    String venue,
    String tool,
    String joinUrl,
    String text,
    int letsGoCount,
    String officialPageUrl,
    String mainImageUrl,
    List<String> subImagesUrl,
    File mainImageFile,
    File subImageFile1,
    File subImageFile2,
    File subImageFile3,
    String phoneNumber,
    String email,
    UserDto userDto,
    @Default(false) bool userGetInit,
    DateTime createdAt,
    DateTime updatedAt,
  }) = _EventDetailState;
}

class EventDetailStateNotifier extends StateNotifier<EventDetailState>
    with LocatorMixin {
  EventDetailStateNotifier({@required UserAppService app})
      : _app = app,
        super(const EventDetailState()) {}

  final UserAppService _app;

  // 新規作成画面から確認画面に移行した時
  EventDetailStateNotifier.fromMyEventEditState(
      {MyEventEditState myEventEditState, @required UserAppService app})
      : _app = app,
        super(const EventDetailState()) {
    state = state.copyWith(
      isLoading: false,
      isPostConfirm: true,
      userGetInit: true,
    );

    _myEventEditStateChange(myEventEditState);
  }

  // 編集画面から確認画面に移行した時
  EventDetailStateNotifier.fromIsEditTrueMyEventEditState(
      {MyEventEditState myEventEditState, @required UserAppService app})
      : _app = app,
        super(const EventDetailState()) {
    state = state.copyWith(
      isLoading: false,
      isPostConfirm: true,
      isMyEventEdit: true,
      userGetInit: true,
    );
    _myEventEditStateChange(myEventEditState);
  }

  void _myEventEditStateChange(MyEventEditState myEventEditState) {
    // 以前アップロードしたURLを削除していた場合、表示させない
    final mainImageUrl = myEventEditState.trashBeforeMainImage
        ? null
        : myEventEditState.beforeMainImageUrl;
    final subImagesUrl = myEventEditState.beforeSubImagesUrl;
    final subImageTrashes = myEventEditState.trashBeforeSubImages;
    final subImageUrl = List<String>(3);
    for (var i = 0; i < 3; i++) {
      if (subImageTrashes[i]) {
        subImageUrl[i] = null;
      } else {
        subImageUrl[i] = subImagesUrl[i];
      }
    }

    state = state.copyWith(
      id: myEventEditState.id,
      author: myEventEditState.author,
      title: myEventEditState.title,
      category: myEventEditState.category,
      startDate: myEventEditState.startDate,
      endDate: myEventEditState.endDate,
      status: myEventEditState.status,
      online: myEventEditState.online,
      venue: myEventEditState.venue,
      tool: myEventEditState.tool,
      joinUrl: myEventEditState.joinUrl,
      text: myEventEditState.text,
      officialPageUrl: myEventEditState.officialPageUrl,
      letsGoCount: myEventEditState.letsGoCount,
      mainImageUrl: mainImageUrl,
      subImagesUrl: subImageUrl,
      mainImageFile: myEventEditState.mainImageFile,
      subImageFile1: myEventEditState.subImageFile1,
      subImageFile2: myEventEditState.subImageFile2,
      subImageFile3: myEventEditState.subImageFile3,
      email: myEventEditState.email,
      phoneNumber: myEventEditState.phoneNumber,
    );
  }

  // 自分以外の詳細画面
  EventDetailStateNotifier.fromEventDto(
      {EventDto eventDto, @required UserAppService app})
      : _app = app,
        super(const EventDetailState()) {
    _eventDtoStateChange(eventDto);
  }

  // 自分以外の詳細画面の場合、ユーザー情報を取得
  @override
  Future<void> initState() async {
    if (!state.userGetInit) {
      try {
        final userDto = await _app.findById(id: state.author.id);
        state = state.copyWith(userDto: userDto);
      } on GenericException catch (e, s) {
        await commonToast(msg: e.message);
        await FirebaseCrashlytics.instance.recordError(e, s);
      } on Exception catch (e, s) {
        await commonToast(msg: e.toString());
        await FirebaseCrashlytics.instance.recordError(e, s);
      } finally {
        state = state.copyWith(userGetInit: true);
      }
    }
  }

  // 自分イベントの詳細画面
  EventDetailStateNotifier.fromMyEventDto(
      {EventDto eventDto, @required UserAppService app})
      : _app = app,
        super(const EventDetailState()) {
    state = state.copyWith(
      isMyEventEdit: true,
      userGetInit: true,
    );
    _eventDtoStateChange(eventDto);
  }

  void _eventDtoStateChange(EventDto eventDto) {
    state = state.copyWith(
      isLoading: false,
      id: eventDto.id,
      author: eventDto.author,
      title: eventDto.title,
      category: eventDto.category,
      startDate: eventDto.startDate,
      endDate: eventDto.endDate,
      status: eventDto.status,
      online: eventDto.online,
      venue: eventDto.venue,
      tool: eventDto.tool,
      joinUrl: eventDto.joinUrl,
      text: eventDto.text,
      officialPageUrl: eventDto.officialPageUrl,
      letsGoCount: eventDto.letsGoCount,
      mainImageUrl: eventDto.mainImageUrl,
      subImagesUrl: eventDto.subImagesUrl,
      email: eventDto.email,
      phoneNumber: eventDto.phoneNumber,
      createdAt: eventDto.createdAt,
      updatedAt: eventDto.updatedAt,
    );
  }

  void incrementLetsGoCount() {
    state = state.copyWith(letsGoCount: state.letsGoCount + 1);
  }

  void decrementLetsGoCount() {
    if (state.letsGoCount == 0) {
      return;
    }
    state = state.copyWith(letsGoCount: state.letsGoCount - 1);
  }
}
