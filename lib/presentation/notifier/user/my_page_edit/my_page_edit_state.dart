import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kokuchi_event/application/user_app_service.dart';
import 'package:kokuchi_event/common/exception.dart';
import 'package:kokuchi_event/presentation/notifier/user/user/user_state.dart';
import 'package:kokuchi_event/presentation/share/network_check.dart';
import 'package:kokuchi_event/presentation/widget/common/compress_file.dart';
import 'package:state_notifier/state_notifier.dart';

part 'my_page_edit_state.freezed.dart';

@freezed
abstract class MyPageEditState with _$MyPageEditState {
  const factory MyPageEditState(
      {@Default(false) bool isLoading,
      String id,
      String name,
      String text,
      String iconUrl,
      File iconFile,
      String prefecture,
      bool prefectureStatus,
      String status,
      @Default(false) bool trashBeforeIconUrl}) = _MyPageEditState;
}

class MyPageEditStateNotifier extends StateNotifier<MyPageEditState>
    with LocatorMixin {
  MyPageEditStateNotifier({@required UserAppService app})
      : _app = app,
        super(const MyPageEditState());

  final UserAppService _app;

  @override
  void initState() {
    super.initState();

    final _userState = read<UserState>();
    state = state.copyWith(
      id: _userState.id,
      name: _userState.name,
      text: _userState.text,
      iconUrl: _userState.iconUrl,
      prefecture: _userState.prefecture,
      prefectureStatus: _userState.prefectureStatus,
      status: _userState.status,
    );
  }

  void changeName(String value) {
    state = state.copyWith(name: value);
  }

  void changeText(String value) {
    state = state.copyWith(text: value);
  }

  void changeIcon(File file) {
    if (file == null) {
      state = state.copyWith(trashBeforeIconUrl: true);
    } else {
      state = state.copyWith(trashBeforeIconUrl: false);
    }
    state = state.copyWith(iconFile: file);
  }

  void changePrefecture(String value) {
    state = state.copyWith(prefecture: value);
  }

  void togglePrefectureStatus() {
    state = state.copyWith(prefectureStatus: !state.prefectureStatus);
  }

  void changeIsLoading({bool val}) {
    state = state.copyWith(isLoading: val);
  }

  Future<void> save() async {
    // インターネット接続をチェック
    if (!await NetworkCheck.isConnect()) {
      throw InternetException();
    }

    await _fileCompress();

    await _app.save(
        tutorial: false,
        id: state.id,
        name: state.name,
        prefecture: state.prefecture,
        prefectureStatus: state.prefectureStatus,
        beforeIconUrl: state.iconUrl,
        iconFile: state.iconFile,
        text: state.text,
        status: state.status,
        trashBeforeIconUrl: state.trashBeforeIconUrl);
  }

  Future<void> _fileCompress() async {
    if (state.iconFile != null) {
      final compressIconFile =
          await CommonCompressFile.compress(state.iconFile);
      state = state.copyWith(iconFile: compressIconFile);
    }
  }
}
