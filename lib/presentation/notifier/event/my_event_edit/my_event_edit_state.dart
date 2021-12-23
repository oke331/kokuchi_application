import 'dart:io';

import 'package:characters/characters.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kokuchi_event/application/event_app_service.dart';
import 'package:kokuchi_event/common/event_status_situation.dart';
import 'package:kokuchi_event/common/exception.dart';
import 'package:kokuchi_event/presentation/notifier/event/event_detail/event_detail_state.dart';
import 'package:kokuchi_event/presentation/notifier/user/user/user_state.dart';
import 'package:kokuchi_event/presentation/share/network_check.dart';
import 'package:kokuchi_event/presentation/widget/common/compress_file.dart';
import 'package:kokuchi_event/presentation/widget/common/toast.dart';
import 'package:state_notifier/state_notifier.dart';

part 'my_event_edit_state.freezed.dart';

@freezed
abstract class MyEventEditState with _$MyEventEditState {
  const factory MyEventEditState({
    @Default(false) bool init,
    @Default(false) bool isEdit,
    @Default(false) bool isClear,
    String id,
    DocumentReference author,
    String title,
    @Default('お祭り') String category,
    DateTime startDate,
    DateTime endDate,
    String status,
    @Default(true) bool online,
    String venue,
    String tool,
    String joinUrl,
    String text,
    int letsGoCount,
    String officialPageUrl,
    String email,
    String phoneNumber,
    String beforeMainImageUrl,
    @Default(false) bool trashBeforeMainImage,
    File mainImageFile,
    @Default([null, null, null]) List<String> beforeSubImagesUrl,
    @Default([false, false, false]) List<bool> trashBeforeSubImages,
    File subImageFile1,
    File subImageFile2,
    File subImageFile3,
  }) = _MyEventEditState;
}

class MyEventEditStateNotifier extends StateNotifier<MyEventEditState>
    with LocatorMixin {
  MyEventEditStateNotifier(
      {@required EventAppService app, EventDetailState eventDetailData})
      : _app = app,
        _eventDetailData = eventDetailData,
        super(const MyEventEditState());

  final EventAppService _app;
  final EventDetailState _eventDetailData;

  @override
  void initState() {
    // 編集の時はstateに反映、新規の場合は何もしない。
    if (_eventDetailData != null) {
      state = state.copyWith(
        init: true,
        isEdit: true,
        id: _eventDetailData.id,
        title: _eventDetailData.title,
        category: _eventDetailData.category,
        startDate: _eventDetailData.startDate,
        endDate: _eventDetailData.endDate,
        status: _eventDetailData.status,
        online: _eventDetailData.online,
        venue: _eventDetailData.venue,
        tool: _eventDetailData.tool,
        joinUrl: _eventDetailData.joinUrl,
        text: _eventDetailData.text,
        letsGoCount: _eventDetailData.letsGoCount,
        email: _eventDetailData.email,
        phoneNumber: _eventDetailData.phoneNumber,
        officialPageUrl: _eventDetailData.officialPageUrl,
        beforeMainImageUrl: _eventDetailData.mainImageUrl,
        beforeSubImagesUrl: _eventDetailData.subImagesUrl,
      );
    }
  }

  void changeTitle(String value) {
    state = state.copyWith(title: value);
  }

  void changeCategory(String value) {
    if (value == null || value.isEmpty) return;
    state = state.copyWith(category: value);
  }

  void changeStartDate(DateTime value) {
    // presentation側でリアルタイムバリデーション実施
    state = state.copyWith(startDate: value);
  }

  void changeEndDate(DateTime value) {
    state = state.copyWith(endDate: value);
  }

  void changeStatus(String value) {
    state = state.copyWith(status: value);
  }

  void toggleOnline() {
    state = state.copyWith(online: !state.online);
  }

  void changeVenue(String value) {
    if (value.characters.length >= 100) {
      commonToast(msg: '100文字以内で入力してください');
    }
    state = state.copyWith(venue: value);
  }

  void changeTool(String value) {
    state = state.copyWith(tool: value);
  }

  void changeJoinUrl(String value) {
    if (value.characters.length >= 10000) {
      commonToast(msg: '10000文字以内で入力してください');
    }
    state = state.copyWith(joinUrl: value);
  }

  void changeText(String value) {
    state = state.copyWith(text: value);
  }

  void changeLetsGoCount(int value) {
    state = state.copyWith(letsGoCount: value);
  }

  void changeOfficialPageUrl(String value) {
    if (value.characters.length >= 10000) {
      commonToast(msg: '10000文字以内で入力してください');
    }
    state = state.copyWith(officialPageUrl: value);
  }

  void changeEmail(String value) {
    if (value.characters.length >= 1000) {
      commonToast(msg: '1000文字以内で入力してください');
    }
    state = state.copyWith(email: value);
  }

  void changePhoneNumber(String value) {
    state = state.copyWith(phoneNumber: value);
  }

  void changeMainImageFile(File value) {
    // 削除された場合は以前のイメージファイルを削除する。
    if (value == null) {
      state = state.copyWith(trashBeforeMainImage: true);
    } else {
      state = state.copyWith(trashBeforeMainImage: false);
    }
    state = state.copyWith(mainImageFile: value);
  }

  void changeSubImageFile1(File value) {
    _changeTrashBeforeSubImageState(value: value, index: 0);
    state = state.copyWith(subImageFile1: value);
  }

  void changeSubImageFile2(File value) {
    _changeTrashBeforeSubImageState(value: value, index: 1);
    state = state.copyWith(subImageFile2: value);
  }

  void changeSubImageFile3(File value) {
    _changeTrashBeforeSubImageState(value: value, index: 2);
    state = state.copyWith(subImageFile3: value);
  }

  void _changeTrashBeforeSubImageState({File value, int index}) {
    // 削除された場合は以前のイメージファイルを削除する。
    final trashImages = state.trashBeforeSubImages.toList();
    if (value == null) {
      trashImages.replaceRange(index, index + 1, [true]);
      state = state.copyWith(trashBeforeSubImages: trashImages);
    } else {
      trashImages.replaceRange(index, index + 1, [false]);
      state = state.copyWith(trashBeforeSubImages: trashImages);
    }
  }

  void isClearFalse() {
    state = state.copyWith(isClear: false);
  }

  Future<void> save() async {
    // インターネット接続をチェック
    if (!await NetworkCheck.isConnect()) {
      throw InternetException();
    }

    final userId = read<UserState>().id;

    await _fileCompress();

    await _app.save(
        id: state.id,
        userId: userId,
        title: state.title,
        category: state.category,
        startDate: state.startDate,
        endDate: state.endDate,
        status: state.status ?? EventStatusSituation.public,
        online: state.online,
        text: state.text,
        venue: state.venue,
        joinUrl: state.joinUrl,
        tool: state.tool,
        phoneNumber: state.phoneNumber,
        email: state.email,
        mainImageFile: state.mainImageFile,
        beforeMainImageUrl: state.beforeMainImageUrl,
        subImagesFile: [
          state.subImageFile1,
          state.subImageFile2,
          state.subImageFile3
        ],
        beforeSubImagesUrl: state.beforeSubImagesUrl,
        officialPageUrl: state.officialPageUrl,
        letsGoCount: state.letsGoCount,
        trashBeforeMainImage: state.trashBeforeMainImage,
        trashBeforeSubImages: state.trashBeforeSubImages);

    _clearStateAfterSave();
  }

  void _clearStateAfterSave() {
    state = state.copyWith(
      isClear: true,
      id: null,
      isEdit: false,
      author: null,
      title: null,
      category: 'お祭り',
      startDate: null,
      endDate: null,
      status: null,
      online: true,
      venue: null,
      tool: null,
      joinUrl: null,
      text: null,
      letsGoCount: null,
      officialPageUrl: null,
      mainImageFile: null,
      subImageFile1: null,
      subImageFile2: null,
      subImageFile3: null,
      beforeMainImageUrl: null,
      beforeSubImagesUrl: [null, null, null],
      trashBeforeMainImage: false,
      trashBeforeSubImages: [false, false, false],
      phoneNumber: null,
      email: null,
    );
  }

  Future<void> _fileCompress() async {
    if (state.mainImageFile != null) {
      final compressIconFile =
          await CommonCompressFile.compress(state.mainImageFile);
      state = state.copyWith(mainImageFile: compressIconFile);
    }

    if (state.subImageFile1 != null) {
      final compressIconFile =
          await CommonCompressFile.compress(state.subImageFile1);
      state = state.copyWith(subImageFile1: compressIconFile);
    }
    if (state.subImageFile2 != null) {
      final compressIconFile =
          await CommonCompressFile.compress(state.subImageFile2);
      state = state.copyWith(subImageFile2: compressIconFile);
    }
    if (state.subImageFile3 != null) {
      final compressIconFile =
          await CommonCompressFile.compress(state.subImageFile3);
      state = state.copyWith(subImageFile3: compressIconFile);
    }
  }
}
