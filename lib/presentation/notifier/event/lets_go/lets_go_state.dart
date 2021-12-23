import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kokuchi_event/application/dto/event/event_dto.dart';
import 'package:kokuchi_event/application/event_lets_go_app_service.dart';
import 'package:kokuchi_event/common/string.dart';
import 'package:kokuchi_event/main.dart';
import 'package:kokuchi_event/presentation/notifier/auth/auth_state.dart';
import 'package:kokuchi_event/presentation/notifier/event/event_detail/event_detail_state.dart';
import 'package:kokuchi_event/presentation/share/lets_go_notification.dart';
import 'package:kokuchi_event/presentation/widget/common/toast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:state_notifier/state_notifier.dart';

part 'lets_go_state.freezed.dart';

@freezed
abstract class LetsGoState with _$LetsGoState {
  const factory LetsGoState({
    List<EventDto> letsGosEventDto,
    List<String> letsGoEventIDs,
    @Default(false) bool isLoadingChangeLetsGo,
    @Default(false) bool isLoading,
    @Default(false) bool init,
    DateTime startAfter,
  }) = _LetsGoState;
}

class LetsGoStateNotifier extends StateNotifier<LetsGoState> with LocatorMixin {
  LetsGoStateNotifier({@required EventLetsGoAppService app})
      : _app = app,
        super(const LetsGoState());

  final EventLetsGoAppService _app;
  String _myUserId;
  static const _letsGoEventIDsPref = 'letsGoEventIDsPref';

  void changeIsLoadingChangeLetsGo({bool val}) {
    state = state.copyWith(isLoadingChangeLetsGo: val);
  }

  @override
  Future<void> update(Locator watch) async {
    super.update(watch);

    _myUserId = watch<AuthState>().id;
    if (_myUserId != null && _myUserId.isNotEmpty && !state.init) {
      if (await _getEventIdsFromPreference()) {
        await refresh();
      } else {
        await _allFetch();
      }
      state = state.copyWith(init: true);
    }

    // ログアウトしている状態の時はinitをfalseにする
    if ((_myUserId == null || _myUserId.isEmpty) && state.init) {
      state = state.copyWith(init: false);
    }
  }

  Future<bool> _getEventIdsFromPreference() async {
    final pref = await SharedPreferences.getInstance();
    final prefKey = _myUserId + _letsGoEventIDsPref;
    final letsGoEventIDs = pref.getStringList(prefKey);
    if (letsGoEventIDs != null && letsGoEventIDs.isNotEmpty) {
      state = state.copyWith(letsGoEventIDs: letsGoEventIDs);
      return true;
    } else {
      return false;
    }
  }

  Future<void> _allFetch() async {
    await refresh(limitNumber: null);

    if (state.letsGosEventDto == null || state.letsGosEventDto.isEmpty) {
      state = state.copyWith(letsGoEventIDs: null);
      return;
    }

    final pref = await SharedPreferences.getInstance();
    final prefKey = _myUserId + _letsGoEventIDsPref;
    var list = <String>[];

    for (final eventDto in state.letsGosEventDto) {
      list.add(eventDto.id);
    }

    // preferenceに反映
    if (!await pref.setStringList(prefKey, list)) {
      await commonToast(msg: CommonString.exceptionError);
    }

    // stateに反映
    state = state.copyWith(letsGoEventIDs: list);
  }

  Future<void> fetch({int limitNumber = 15}) async {
    if (state.isLoading) return;
    state = state.copyWith(isLoading: true);
    try {
      final letsGoEventFetchDto = await _app.fetchLetsGos(
          userId: _myUserId,
          limitNumber: limitNumber,
          startAfter: state.startAfter);

      final fetchEventDtos = letsGoEventFetchDto.eventDtos;

      if (fetchEventDtos != null && fetchEventDtos.isNotEmpty) {
        if (state.letsGosEventDto != null) {
          fetchEventDtos.insertAll(0, state.letsGosEventDto);
        }

        state = state.copyWith(
            letsGosEventDto: fetchEventDtos,
            startAfter: letsGoEventFetchDto.startAfter);
      }
    } on Exception catch (e, s) {
      await commonToast(msg: CommonString.exceptionError);
      await FirebaseCrashlytics.instance.recordError(e, s);
    } finally {
      state = state.copyWith(isLoading: false);
    }
  }

  Future<void> refresh({int limitNumber = 15}) async {
    if (state.isLoading) return;
    state = state.copyWith(isLoading: true);
    try {
      final letsGoEventFetchDto =
          await _app.fetchLetsGos(userId: _myUserId, limitNumber: limitNumber);

      if (letsGoEventFetchDto.eventDtos != null &&
          letsGoEventFetchDto.eventDtos.isNotEmpty) {
        state = state.copyWith(
            letsGosEventDto: letsGoEventFetchDto.eventDtos,
            startAfter: letsGoEventFetchDto.startAfter);
      } else {
        state = state.copyWith(letsGosEventDto: null, startAfter: null);
      }
    } on Exception catch (e, s) {
      logger.d(e.toString());
      await commonToast(msg: CommonString.exceptionError);
      await FirebaseCrashlytics.instance.recordError(e, s);
    } finally {
      state = state.copyWith(isLoading: false);
    }
  }

  Future<void> letsGoAddFlowFromEventDto(
      {@required EventDto eventDto, @required bool letsGoReminder}) async {
    changeIsLoadingChangeLetsGo(val: true);
    try {
      await _letsGoAddFromEventDto(eventDto: eventDto);

      // カウントをあげる（ここのページのものにしか反映されない、他のページはリロードの必要あり）
      eventDto.incrementLetsGoCount();

      // 設定でリマインダーがONになっていたら通知を登録
      if (letsGoReminder) {
        await onNotificationFromEventDto(eventDto);
      }
    } on Exception catch (e, s) {
      logger.d(e.toString());
      await commonToast(msg: CommonString.exceptionError);
      await FirebaseCrashlytics.instance.recordError(e, s);
    } finally {
      await Future<Duration>.delayed(const Duration(seconds: 1));
      changeIsLoadingChangeLetsGo(val: false);
    }
  }

  Future<void> letsGoDeleteFlowFromEventDto(
      {@required EventDto eventDto, @required bool letsGoReminder}) async {
    changeIsLoadingChangeLetsGo(val: true);
    try {
      await _letsGoDelete(userId: eventDto.author.id, eventId: eventDto.id);

      // カウントを下げる（ここのページのものにしか反映されない、他のページはリロードの必要あり）
      eventDto.decrementLetsGoCount();

      // 設定でリマインダーがONになっていた場合、通知削除の必要あり。
      if (letsGoReminder) {
        await onDeleteNotification(eventDto.id);
      }

      // タイミングが早すぎるとエラーが出るため1秒待つ
      await Future<Duration>.delayed(const Duration(seconds: 1));
      changeIsLoadingChangeLetsGo(val: false);

      //  refreshは処理の最後にする様変更
      await refresh();
    } on Exception catch (e, s) {
      logger.d(e.toString());
      changeIsLoadingChangeLetsGo(val: false);
      await commonToast(msg: CommonString.exceptionError);
      await FirebaseCrashlytics.instance.recordError(e, s);
    }
  }

  Future<void> letsGoAddFlowFromEventDetailState(
      {@required EventDetailState eventDetailState,
      @required EventDetailStateNotifier eventDetailStateNotifier,
      @required bool letsGoReminder}) async {
    changeIsLoadingChangeLetsGo(val: true);
    try {
      _letsGoAddFromEventDetailState(eventDetailState: eventDetailState);

      // カウントをあげる（ここのページのものにしか反映されない、他のページはリロードの必要あり）
      eventDetailStateNotifier.incrementLetsGoCount();

      // 設定でリマインダーがONになっていたら通知を登録
      if (letsGoReminder) {
        await onNotificationFromEventDetailState(eventDetailState);
      }
    } on Exception catch (e, s) {
      logger.d(e.toString());
      await commonToast(msg: CommonString.exceptionError);
      await FirebaseCrashlytics.instance.recordError(e, s);
    } finally {
      await Future<Duration>.delayed(const Duration(seconds: 1));
      changeIsLoadingChangeLetsGo(val: false);
    }
  }

  Future<void> letsGoDeleteFlowFromEventDetailState(
      {@required EventDetailState eventDetailState,
      @required EventDetailStateNotifier eventDetailStateNotifier,
      @required bool letsGoReminder}) async {
    changeIsLoadingChangeLetsGo(val: true);
    try {
      await _letsGoDelete(
          userId: eventDetailState.author.id, eventId: eventDetailState.id);

      // カウントを下げる（ここのページのものにしか反映されない、他のページはリロードの必要あり）
      eventDetailStateNotifier.decrementLetsGoCount();

      // 設定でリマインダーがONになっていた場合、通知削除の必要あり。
      if (letsGoReminder) {
        await onDeleteNotification(eventDetailState.id);
      }

      await Future<Duration>.delayed(const Duration(seconds: 1));

      changeIsLoadingChangeLetsGo(val: false);

      //  refreshは処理の最後にする様変更
      await refresh();
    } on Exception catch (e, s) {
      logger.d(e.toString());
      changeIsLoadingChangeLetsGo(val: false);
      await commonToast(msg: CommonString.exceptionError);
      await FirebaseCrashlytics.instance.recordError(e, s);
    }
  }

  Future<void> _letsGoAdd(
      {@required String postUserId, @required String eventId}) async {
    await _app.letsGoAdd(
        postUserId: postUserId, eventId: eventId, myUserId: _myUserId);

    await refresh();
    await _letsGoAddPref(eventId);
  }

  Future<void> _letsGoAddFromEventDto({@required EventDto eventDto}) async {
    await _letsGoAdd(postUserId: eventDto.author.id, eventId: eventDto.id);
  }

  Future<void> _letsGoAddFromEventDetailState(
      {@required EventDetailState eventDetailState}) async {
    await _letsGoAdd(
        postUserId: eventDetailState.author.id, eventId: eventDetailState.id);
  }

  Future<void> _letsGoAddPref(String eventId) async {
    final pref = await SharedPreferences.getInstance();
    final prefKey = _myUserId + _letsGoEventIDsPref;
    var list = <String>[];
    if (state.letsGoEventIDs != null && state.letsGoEventIDs.isNotEmpty) {
      list.addAll(state.letsGoEventIDs);
    }
    if (list == null || list.isEmpty) {
      list = [eventId];
    } else {
      list.add(eventId);
    }

    // preferenceに反映
    if (!await pref.setStringList(prefKey, list)) {
      await commonToast(msg: CommonString.exceptionError);
    }

    // stateに反映
    state = state.copyWith(letsGoEventIDs: list);
  }

  Future<void> _letsGoDelete(
      {@required String userId, @required String eventId}) async {
    await _app.letsGoDelete(
        postUserId: userId, eventId: eventId, myUserId: _myUserId);

    await _letsGoDeletePref(eventId);
  }

  Future<void> _letsGoDeletePref(String eventId) async {
    final pref = await SharedPreferences.getInstance();
    final prefKey = _myUserId + _letsGoEventIDsPref;
    var list = <String>[];
    if (state.letsGoEventIDs != null && state.letsGoEventIDs.isNotEmpty) {
      list.addAll(state.letsGoEventIDs);
    }
    if (list == null || list.isEmpty) {
      await commonToast(msg: CommonString.exceptionError);
      return;
    } else {
      list.remove(eventId);
    }

    if (!await pref.setStringList(prefKey, list)) {
      await commonToast(msg: CommonString.exceptionError);
    }

    // stateに反映
    state = state.copyWith(letsGoEventIDs: list);
  }

  Future<void> deleteAllLetsGoPrefAndNotification() async {
    final pref = await SharedPreferences.getInstance();
    final prefKey = _myUserId + _letsGoEventIDsPref;
    final letsGoPrefList = pref.getStringList(prefKey);

    // 通知されないよう削除
    if (letsGoPrefList != null && letsGoPrefList.isNotEmpty) {
      for (var eventId in letsGoPrefList) {
        await onDeleteNotification(eventId);
      }
    }

    // preferenceからも全て削除
    if (!await pref.remove(prefKey)) {
      await commonToast(msg: CommonString.exceptionError);
    }

    // stateに反映
    state = state.copyWith(letsGoEventIDs: null);
  }

  // 通知の表示
  Future _onNotification(
      {@required DateTime startDate,
      @required String id,
      @required String title}) async {
    final noticeDateTime = startDate.subtract(const Duration(days: 1));

    if (noticeDateTime.isAfter(DateTime.now())) {
      await LetsGoNotification.flutterLocalNotificationsPlugin.schedule(
        id.hashCode,
        '明日開催のイベント',
        title,
        noticeDateTime,
        LetsGoNotification.platformChannelSpecifics,
        androidAllowWhileIdle: true,
      );
    }
  }

  Future<void> onNotificationFromEventDto(EventDto eventDto) async {
    await _onNotification(
        startDate: eventDto.startDate, id: eventDto.id, title: eventDto.title);
  }

  Future<void> onNotificationFromEventDetailState(
      EventDetailState eventDetailState) async {
    await _onNotification(
        startDate: eventDetailState.startDate,
        id: eventDetailState.id,
        title: eventDetailState.title);
  }

  // 通知の削除
  Future onDeleteNotification(String eventId) async {
    await LetsGoNotification.flutterLocalNotificationsPlugin
        .cancel(eventId.hashCode);
  }
}
