import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kokuchi_event/application/dto/event/event_dto.dart';
import 'package:kokuchi_event/application/event_app_service.dart';
import 'package:kokuchi_event/common/exception.dart';
import 'package:kokuchi_event/common/string.dart';
import 'package:kokuchi_event/main.dart';
import 'package:kokuchi_event/presentation/widget/common/toast.dart';
import 'package:state_notifier/state_notifier.dart';

part 'user_event_show_state.freezed.dart';

@freezed
abstract class UserEventShowState with _$UserEventShowState {
  const factory UserEventShowState({
    List<EventDto> events,
    @Default(false) bool init,
    @Default(false) bool isLoading,
    @Default(false) bool isClear,
    DateTime startAfterUpdatedAt,
  }) = _UserEventShowState;
}

class UserEventShowStateNotifier extends StateNotifier<UserEventShowState>
    with LocatorMixin {
  UserEventShowStateNotifier(
      {@required EventAppService app, @required String userId})
      : _app = app,
        _userId = userId,
        super(const UserEventShowState());

  final EventAppService _app;
  final String _userId;
  DateTime _lastFetchUpdatedAt = DateTime(1000);
  int _noFetchCount = 0;

  @override
  Future<void> initState() async {
    await fetchAndAddUserEvents();
    state = state.copyWith(init: true);
  }

  Future<void> fetchAndAddUserEvents() async {
    // 連続で走るのを防止。取得中は他のが走らないようにする。
    if (state.isLoading) return;

    // 2回同じ処理が走るのを防止
    if (!checkDuplicateFetch()) return;

    state = state.copyWith(isLoading: true);
    try {
      final eventDtos = await _app.findByUserId(_userId,
          startAfter: state.startAfterUpdatedAt);

      if (state.events != null) {
        eventDtos.insertAll(0, state.events);
      }

      if (eventDtos != null && eventDtos.isNotEmpty) {
        _lastFetchUpdatedAt = eventDtos?.last?.updatedAt;
        state = state.copyWith(
            events: eventDtos, startAfterUpdatedAt: eventDtos?.last?.updatedAt);
      } else {
        state = state.copyWith(events: eventDtos);
      }
    } on Exception catch (e, s) {
      logger.d(e.toString());
      await commonToast(msg: CommonString.exceptionError);
      await FirebaseCrashlytics.instance.recordError(e, s);
    } finally {
      state = state.copyWith(isLoading: false);
    }
  }

  bool checkDuplicateFetch() {
    if (_lastFetchUpdatedAt == state.startAfterUpdatedAt) {
      if (_noFetchCount == 0) {
        _noFetchCount++;
        return true;
      } else {
        _noFetchCount = 0;
        return false;
      }
    } else {
      return true;
    }
  }

  Future<void> refreshUserEvents() async {
    state = state.copyWith(isLoading: true);
    try {
      final eventDtos = await _app.findByUserId(_userId);
      if (eventDtos != null && eventDtos.isNotEmpty) {
        _lastFetchUpdatedAt = eventDtos?.last?.updatedAt;
      } else {
        _lastFetchUpdatedAt = null;
      }

      state = state.copyWith(
          events: eventDtos, startAfterUpdatedAt: _lastFetchUpdatedAt);
    } on GenericException catch (e, s) {
      await commonToast(msg: e.message);
      await FirebaseCrashlytics.instance.recordError(e, s);
    } on Exception catch (e, s) {
      logger.d(e.toString());
      await commonToast(msg: CommonString.exceptionError);
      await FirebaseCrashlytics.instance.recordError(e, s);
    } finally {
      state = state.copyWith(isLoading: false);
    }
  }

  Future<void> refreshEvent(EventDto eventDto) async {
    try {
      final event = await _app.findByUserIdAndEventId(_userId, eventDto.id);
      final currentState = state;
      if (currentState is _UserEventShowState) {
        final clone = currentState.events.map<EventDto>((e) {
          if (e == eventDto) {
            return event;
          }
          return e;
        }).toList();
        state = state.copyWith(events: clone);
      }
    } on GenericException catch (e, s) {
      await commonToast(msg: e.message);
      await FirebaseCrashlytics.instance.recordError(e, s);
    } on Exception catch (e, s) {
      await commonToast(msg: CommonString.exceptionError);
      await FirebaseCrashlytics.instance.recordError(e, s);
    }
  }

//  void incrementLetsGoCount(EventDto eventDto) {
//    // 見た目上更新する　LetsGoStateNotifierから呼ぶ
//    final currentState = state;
//    if (currentState is _UserEventShowState) {
//      final clone = currentState.events.map<EventDto>((e) {
//        if (e == eventDto) {
//          eventDto.letsGoCount++;
//          return eventDto;
//        }
//        return e;
//      }).toList();
//      state = state.copyWith(events: clone);
//    }
//  }
//
//  void decrementLetsGoCount(EventDto eventDto) {
//    // 見た目上更新する　LetsGoStateNotifierから呼ぶ
//    final currentState = state;
//    if (currentState is _UserEventShowState) {
//      final clone = currentState.events.map<EventDto>((e) {
//        if (e == eventDto) {
//          if (eventDto.letsGoCount > 0) {
//            eventDto.letsGoCount--;
//            return eventDto;
//          }
//        }
//        return e;
//      }).toList();
//      state = state.copyWith(events: clone);
//    }
//  }
}
