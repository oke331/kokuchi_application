import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kokuchi_event/application/dto/event/event_dto.dart';
import 'package:kokuchi_event/application/event_recommend_app_service.dart';
import 'package:kokuchi_event/common/exception.dart';
import 'package:kokuchi_event/common/string.dart';
import 'package:kokuchi_event/main.dart';
import 'package:kokuchi_event/presentation/notifier/event/home_network/home_network_state.dart';
import 'package:kokuchi_event/presentation/notifier/user/user/user_state.dart';
import 'package:kokuchi_event/presentation/widget/common/toast.dart';
import 'package:state_notifier/state_notifier.dart';

part 'home_prefecture_state.freezed.dart';

@freezed
abstract class HomePrefectureState with _$HomePrefectureState {
  const factory HomePrefectureState({
    List<EventDto> eventDtos,
    @Default(false) bool isLoading,
    @Default(false) bool init,
  }) = _HomePrefectureState;
}

class HomePrefectureStateNotifier extends StateNotifier<HomePrefectureState>
    with LocatorMixin {
  HomePrefectureStateNotifier({@required EventRecommendAppService app})
      : _app = app,
        super(const HomePrefectureState()) {}

  final EventRecommendAppService _app;
  String _prefecture;
  bool _beforeNetwork;

  @override
  Future<void> update(Locator watch) async {
    final network = watch<HomeNetworkState>().network;
    final changedPrefecture = watch<UserState>().prefecture;
    try {
      // ネットワークが有効の時のみ走る
      if (network != null && network) {
        // 地域に変更があった時に読み取る
        if (changedPrefecture != null &&
            changedPrefecture.isNotEmpty &&
            _prefecture != changedPrefecture) {
          _prefecture = watch<UserState>().prefecture;
          await getEventsByPrefecture(callUpdate: true);
        } else if (network != _beforeNetwork) {
          // ネットワークが有効になったら読み取る
          await getEventsByPrefecture(callUpdate: true);
        }
      }
    } on GenericException catch (e, s) {
      await commonToast(msg: e.message);
      await FirebaseCrashlytics.instance.recordError(e, s);
    } on Exception catch (e, s) {
      logger.d(e.toString());
      await commonToast(msg: CommonString.exceptionError);
      await FirebaseCrashlytics.instance.recordError(e, s);
    } finally {
      _beforeNetwork = network;
      if (!state.init) state = state.copyWith(init: true);
    }
  }

  Future<void> getEventsByPrefecture({bool callUpdate = false}) async {
    // updateからきた時は既にネットワークチェックは行っている
    if (!callUpdate) {
      // インターネット接続があるか
      final homeNetworkState = read<HomeNetworkState>();
      if (!homeNetworkState.init ||
          homeNetworkState.network == null ||
          !homeNetworkState.network) return;
    }

    try {
      state = state.copyWith(isLoading: true);
      final eventDtos =
          await _app.getEventsByPrefecture(prefecture: _prefecture);
      state = state.copyWith(eventDtos: eventDtos);
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
}
