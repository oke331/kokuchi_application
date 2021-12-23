import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kokuchi_event/application/dto/event/event_dto.dart';
import 'package:kokuchi_event/application/event_new_app.dart';
import 'package:kokuchi_event/common/exception.dart';
import 'package:kokuchi_event/common/string.dart';
import 'package:kokuchi_event/main.dart';
import 'package:kokuchi_event/presentation/widget/common/toast.dart';
import 'package:state_notifier/state_notifier.dart';

part 'new_event_state.freezed.dart';

@freezed
abstract class NewEventState with _$NewEventState {
  const factory NewEventState({
    List<EventDto> events,
    @Default(false) bool init,
    @Default(false) bool isLoading,
    @Default(false) bool isClear,
    DateTime startAfterCreatedAt,
  }) = _NewEventState;
}

class NewEventStateNotifier extends StateNotifier<NewEventState>
    with LocatorMixin {
  NewEventStateNotifier({@required EventNewAppService app})
      : _app = app,
        super(const NewEventState());

  final EventNewAppService _app;
  DateTime _lastFetchCreatedAt = DateTime(1000);
  int _noFetchCount = 0;

  @override
  Future<void> initState() async {
    await fetchAndAddNewEvents();
    state = state.copyWith(init: true);
  }

  Future<void> fetchAndAddNewEvents() async {
    // 連続で走るのを防止。取得中は他のが走らないようにする。
    if (state.isLoading) return;

    // 2回同じ処理が走るのを防止
    if (!checkDuplicateFetch()) return;

    state = state.copyWith(isLoading: true);
    try {
      final eventDtos =
          await _app.fetchNewEvent(startAfter: state.startAfterCreatedAt);

      if (state.events != null) {
        eventDtos.insertAll(0, state.events);
      }

      if (eventDtos != null && eventDtos.isNotEmpty) {
        _lastFetchCreatedAt = eventDtos?.last?.createdAt;
        state = state.copyWith(
            events: eventDtos, startAfterCreatedAt: eventDtos?.last?.createdAt);
      } else {
        state = state.copyWith(events: eventDtos);
      }
    } on Exception catch (e, s) {
      logger.d(e, toString());
      await commonToast(msg: CommonString.exceptionError);
      await FirebaseCrashlytics.instance.recordError(e, s);
    } finally {
      state = state.copyWith(isLoading: false);
    }
  }

  bool checkDuplicateFetch() {
    if (_lastFetchCreatedAt == state.startAfterCreatedAt) {
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

  Future<void> refreshEvents() async {
    state = state.copyWith(isLoading: true);
    try {
      final eventDtos = await _app.fetchNewEvent();
      _lastFetchCreatedAt = eventDtos?.last?.createdAt;
      state = state.copyWith(
          events: eventDtos, startAfterCreatedAt: eventDtos?.last?.createdAt);
    } on GenericException catch (e, s) {
      await commonToast(msg: e.message);
      await FirebaseCrashlytics.instance.recordError(e, s);
    } on Exception catch (e, s) {
      await commonToast(msg: CommonString.exceptionError);
      await FirebaseCrashlytics.instance.recordError(e, s);
    } finally {
      state = state.copyWith(isLoading: false);
    }
  }

  Future<void> refreshEvent(EventDto eventDto) async {
    try {
      final event =
          await _app.findByUserIdAndEventId(eventDto.author.id, eventDto.id);
      final currentState = state;
      if (currentState is _NewEventState) {
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
}
