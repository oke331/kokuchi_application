import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kokuchi_event/application/dto/event/event_dto.dart';
import 'package:kokuchi_event/application/event_app_service.dart';
import 'package:kokuchi_event/common/exception.dart';
import 'package:kokuchi_event/common/string.dart';
import 'package:kokuchi_event/main.dart';
import 'package:kokuchi_event/presentation/notifier/search/search_state.dart';
import 'package:kokuchi_event/presentation/widget/common/toast.dart';
import 'package:state_notifier/state_notifier.dart';

part 'search_result_state.freezed.dart';

@freezed
abstract class SearchResultState with _$SearchResultState {
  const factory SearchResultState({
    @Default(false) bool isLoading,
    @Default(false) bool init,
    String onlineCheck,
    List<EventDto> eventDtos,
    DateTime startDate,
    DateTime endDate,
    String category,
    String searchWord,
    @Default(0) int pageIndex,
  }) = _SearchResultState;
}

class SearchResultStateNotifier extends StateNotifier<SearchResultState>
    with LocatorMixin {
  SearchResultStateNotifier({@required EventAppService app})
      : _app = app,
        super(const SearchResultState()) {}

  final EventAppService _app;

  @override
  Future<void> initState() async {
    final searchState = read<SearchState>();

    var category = searchState.category;
    if (searchState.category == '選択なし') {
      category = null;
    }
    state = state.copyWith(
      onlineCheck: searchState.onlineCheck,
      startDate: searchState.startDate,
      endDate: searchState.endDate,
      category: category,
      searchWord: searchState.searchWord,
    );

    await fetch();
    state = state.copyWith(init: true);
  }

  Future<void> fetch({bool initState = false}) async {
    // 連続で走るのを防止。取得中は他のが走らないようにする。
    if (!initState) {
      if (state.isLoading) return;
    }

    state = state.copyWith(isLoading: true);

    try {
      final eventDtos = await _app.fetchByMap(
          pageIndex: state.pageIndex,
          searchWord: state.searchWord,
          online: _onlineOfflineCheck(),
          category: state.category,
          startDate: state.startDate,
          endDate: state.endDate);

      if (state.eventDtos != null) {
        eventDtos.insertAll(0, state.eventDtos);
      }

      if (eventDtos != null && eventDtos.isNotEmpty) {
        state = state.copyWith(
            eventDtos: eventDtos, pageIndex: state.pageIndex + 1);
      } else {
        state = state.copyWith(eventDtos: eventDtos);
      }
    } on GenericException catch (e, s) {
      await commonToast(msg: e.message);
      await FirebaseCrashlytics.instance.recordError(e, s);
    } on Exception catch (e, s) {
      logger.d(e.toString());
      await commonToast(msg: CommonString.exceptionError);
      await FirebaseCrashlytics.instance.recordError(e, s);
    } finally {
      if (!initState) {
        state = state.copyWith(isLoading: false);
      }
    }
  }

  Future<void> refreshEvents() async {
    state = state.copyWith(isLoading: true);
    try {
      final eventDtos = await _app.fetchByMap(
          pageIndex: state.pageIndex,
          searchWord: state.searchWord,
          online: _onlineOfflineCheck(),
          category: state.category,
          startDate: state.startDate,
          endDate: state.endDate);

      state = state.copyWith(eventDtos: eventDtos, pageIndex: 2);
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

  bool _onlineOfflineCheck() {
    switch (state.onlineCheck) {
      case SearchOnlineCondition.both:
        return null;
      case SearchOnlineCondition.online:
        return true;
      case SearchOnlineCondition.offline:
        return false;
      default:
        return null;
    }
  }

  Future<void> refreshEvent(EventDto eventDto) async {
    try {
      final event =
          await _app.findByUserIdAndEventId(eventDto.author.id, eventDto.id);
      final currentState = state;
      if (currentState is _SearchResultState) {
        final clone = currentState.eventDtos.map<EventDto>((e) {
          if (e == eventDto) {
            return event;
          }
          return e;
        }).toList();
        state = state.copyWith(eventDtos: clone);
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
