import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kokuchi_event/application/dto/event/event_dto.dart';
import 'package:kokuchi_event/presentation/notifier/auth/auth_state.dart';
import 'package:kokuchi_event/presentation/notifier/event/lets_go/lets_go_state.dart';
import 'package:kokuchi_event/presentation/share/lets_go_notification.dart';
import 'package:notification_permissions/notification_permissions.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:state_notifier/state_notifier.dart';

part 'setting_state.freezed.dart';

@freezed
abstract class SettingState with _$SettingState {
  const factory SettingState({
    @Default(true) bool letsGoReminder,
    String developerRequestText,
    String developerRequestMail,
    @Default(false) bool developerRequestLoading,
    PermissionStatus settingNoticeState,
  }) = _SettingState;
}

class SettingStateNotifier extends StateNotifier<SettingState>
    with LocatorMixin {
  SettingStateNotifier() : super(const SettingState()) {}

  static const _letsGoReminderPref = 'letsGoReminderPref';
  String _myUserId;

  @override
  Future<void> update(Locator watch) async {
    super.update(watch);

    _myUserId = watch<AuthState>().id;
    if (_myUserId != null && _myUserId.isNotEmpty) {
      final sharedPreference = await SharedPreferences.getInstance();

      final getLetsGoReminder =
          sharedPreference.getBool(_myUserId + _letsGoReminderPref);

      if (getLetsGoReminder != null) {
        state = state.copyWith(letsGoReminder: getLetsGoReminder);
      } else {
        //　アプリインストール初期のときはONにしておく
        await sharedPreference.setBool(_myUserId + _letsGoReminderPref, true);
      }
    }

//    await getCheckNotificationPermStatus();
  }

  Future<void> letsGoReminderON() async {
    // 全ての通知を再登録
    final eventDtos = read<LetsGoState>().letsGosEventDto;
    if (eventDtos == null) {
      state = state.copyWith(letsGoReminder: true);
      final sharedPreference = await SharedPreferences.getInstance();
      await sharedPreference.setBool(_myUserId + _letsGoReminderPref, true);
      return;
    }

    for (final eventDto in eventDtos) {
      await _registerScheduleNotification(eventDto);
    }
    final sharedPreference = await SharedPreferences.getInstance();
    await sharedPreference.setBool(_myUserId + _letsGoReminderPref, true);
    state = state.copyWith(letsGoReminder: true);
  }

  Future<void> letsGoReminderOFF() async {
    // 全ての通知をキャンセル
    await _letsGoNotificationAllCancel();
    final sharedPreference = await SharedPreferences.getInstance();
    await sharedPreference.setBool(_myUserId + _letsGoReminderPref, false);
    state = state.copyWith(letsGoReminder: false);
  }

  Future<void> _letsGoNotificationAllRegist() async {
    final eventDtos = read<LetsGoState>().letsGosEventDto;
    if (eventDtos == null || eventDtos.isEmpty) return;

    for (final eventDto in eventDtos) {
      await _registerScheduleNotification(eventDto);
    }
  }

  Future<void> _letsGoNotificationAllCancel() async {
    await LetsGoNotification.flutterLocalNotificationsPlugin.cancelAll();
  }

  Future<void> reloadLetsGos() async {
    // リマインダーの通知がONのときだけ再度登録する
    if (state.letsGoReminder) {
      await _letsGoNotificationAllCancel();
      await _letsGoNotificationAllRegist();
    }
  }

  Future<void> _registerScheduleNotification(EventDto eventDto) async {
    final noticeDateTime = eventDto.startDate.subtract(const Duration(days: 1));

    if (noticeDateTime.isAfter(DateTime.now())) {
      await LetsGoNotification.flutterLocalNotificationsPlugin.schedule(
        eventDto.id.hashCode,
        '明日開催のイベント',
        eventDto.title,
        noticeDateTime,
        LetsGoNotification.platformChannelSpecifics,
        androidAllowWhileIdle: true,
      );
    }
  }

  void changeDeveloperRequestText(String val) {
    state = state.copyWith(developerRequestText: val);
  }

  void changeDeveloperRequestMail(String val) {
    state = state.copyWith(developerRequestMail: val);
  }

  void changeDeveloperRequestLoading({bool val}) {
    state = state.copyWith(developerRequestLoading: val);
  }

  void resetDeveloperRequest() {
    state = state.copyWith(
      developerRequestText: null,
      developerRequestMail: null,
    );
  }

  ///
  /// 設定の通知の状態を取得
  ///
  Future<void> getCheckNotificationPermStatus() async {
    final settingNoticeState =
        await NotificationPermissions.getNotificationPermissionStatus();
    state = state.copyWith(settingNoticeState: settingNoticeState);
  }
}
