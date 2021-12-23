import 'dart:io';

import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kokuchi_event/application/dto/user_dto.dart';
import 'package:kokuchi_event/application/user_app_service.dart';
import 'package:kokuchi_event/application/user_report_app_service.dart';
import 'package:kokuchi_event/common/exception.dart';
import 'package:kokuchi_event/common/string.dart';
import 'package:kokuchi_event/common/user_status_situation.dart';
import 'package:kokuchi_event/main.dart';
import 'package:kokuchi_event/presentation/notifier/auth/auth_state.dart';
import 'package:kokuchi_event/presentation/share/network_check.dart';
import 'package:kokuchi_event/presentation/widget/common/compress_file.dart';
import 'package:kokuchi_event/presentation/widget/common/toast.dart';
import 'package:state_notifier/state_notifier.dart';

part 'user_state.freezed.dart';

@freezed
abstract class UserState with _$UserState {
  const factory UserState(
      {@Default(false) bool init,
      @Default(false) bool isLoading,
      String id,
      String name,
      String text,
      String iconUrl,
      @Default(false) bool trashBeforeIconUrl,
      File iconFile,
      String prefecture,
      @Default(true) bool prefectureStatus,
      String status}) = _UserState;
}

class UserStateNotifier extends StateNotifier<UserState> with LocatorMixin {
  UserStateNotifier(
      {@required UserAppService app, @required UserReportAppService reportApp})
      : _app = app,
        _reportApp = reportApp,
        super(const UserState());

  final UserAppService _app;
  final UserReportAppService _reportApp;
  String _id;

  @override
  Future<void> update(Locator watch) async {
    super.update(watch);

    if (!watch<AuthState>().init) return;

    _id = watch<AuthState>().id;
    if (_id != null) {
      try {
        final userDto = await _app.findById(id: _id);
        // 退会済みユーザーで合った場合はチュートリアルに遷移
        if (userDto.status == UserStatusSituation.delete) {
          _stateTutorial(_id);

          // 拒否されたユーザーはログインさせない
        } else if (userDto.status == UserStatusSituation.reject) {
          _stateReject();
        } else {
          _stateUpdate(userDto);
        }
      } on NotFoundException catch (e) {
        _stateTutorial(_id);
      } on PlatformException catch (e, s) {
        if (e.code == 'network_error') {
          await commonToast(msg: CommonString.noNetworkError);
        } else {
          await commonToast(msg: CommonString.exceptionLogin);
          await FirebaseCrashlytics.instance.recordError(e, s);
        }
        logger.e(e.toString());
        state = state.copyWith(init: true);
      } on Exception catch (e, s) {
        logger.d('user_state userDto Exception:${e.toString()}');
        await commonToast(msg: CommonString.exceptionError);
        await FirebaseCrashlytics.instance.recordError(e, s);

        state = state.copyWith(init: true);
      }
    } else {
      stateLogin();
    }
  }

  Future<void> fetch() async {
    final userDto = await _app.findById(id: _id);
    _stateUpdate(userDto);
  }

  void stateLogin() {
    state = state.copyWith(
        init: true,
        id: null,
        name: null,
        text: null,
        iconUrl: null,
        iconFile: null,
        prefecture: null,
        prefectureStatus: true,
        status: null);
  }

  void _stateReject() {
    state = state.copyWith(
        init: true,
        id: null,
        name: null,
        text: null,
        iconUrl: null,
        iconFile: null,
        prefecture: null,
        prefectureStatus: true,
        status: UserStatusSituation.reject);
  }

  void _stateTutorial(String id) {
    state = state.copyWith(
        init: true,
        id: id,
        name: null,
        text: null,
        iconUrl: null,
        iconFile: null,
        prefecture: '東京都',
        prefectureStatus: true,
        status: UserStatusSituation.progress);
  }

  void _stateUpdate(UserDto userDto) {
    state = state.copyWith(
        init: true,
        id: userDto.id,
        name: userDto.name,
        text: userDto.text,
        iconUrl: userDto.iconUrl,
        iconFile: null,
        prefecture: userDto.prefecture,
        prefectureStatus: userDto.prefectureStatus,
        status: userDto.status);
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

  void loadingChange({bool val}) {
    state = state.copyWith(isLoading: val);
  }

  Future<void> saveTutorial() async {
    // インターネット接続をチェック
    if (!await NetworkCheck.isConnect()) {
      throw InternetException();
    }

    await _fileCompress();

    await _app.save(
        tutorial: true,
        id: state.id,
        name: state.name,
        prefecture: state.prefecture,
        prefectureStatus: state.prefectureStatus,
        iconFile: state.iconFile,
        text: state.text,
        status: UserStatusSituation.public,
        trashBeforeIconUrl: state.trashBeforeIconUrl);

    await fetch();
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
        iconFile: state.iconFile,
        text: state.text,
        status: state.status,
        trashBeforeIconUrl: state.trashBeforeIconUrl);

    if (state.status == UserStatusSituation.reject) {
      _stateReject();
    }
  }

  Future<void> _fileCompress() async {
    if (state.iconFile != null) {
      final compressIconFile =
          await CommonCompressFile.compress(state.iconFile);
      state = state.copyWith(iconFile: compressIconFile);
    }
  }

  Future<void> reportUser(String otherId, String content) async {
    await _reportApp.reportUser(
        myId: state.id, otherId: otherId, content: content);
  }

  DateTime rejectCheckDateTime;
  Future<bool> rejectCheck() async {
    // ログイン前とチュートリアル中はstatusが取れないため、
    // returnする！
    if (_id == null ||
        _id.isEmpty ||
        state.status == null ||
        state.status == UserStatusSituation.progress) {
      return false;
    }

    // カメラを開いた時とかも走る、かつrejectとなる確率も低いことから、
    // 前にチェックした時から3分経っていた場合にチェックが走る。
    final now = DateTime.now();
    if (rejectCheckDateTime == null) {
      await fetch();
      rejectCheckDateTime = now;
    } else if (now.difference(rejectCheckDateTime).inMinutes >= 3) {
      await fetch();
      rejectCheckDateTime = now;
    }

    if (state.status == UserStatusSituation.reject) {
      return true;
    }
    return false;
  }
}
