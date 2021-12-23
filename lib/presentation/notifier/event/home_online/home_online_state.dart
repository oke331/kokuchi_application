import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kokuchi_event/application/dto/event/event_dto.dart';
import 'package:kokuchi_event/application/event_recommend_app_service.dart';
import 'package:kokuchi_event/common/exception.dart';
import 'package:kokuchi_event/common/string.dart';
import 'package:kokuchi_event/main.dart';
import 'package:kokuchi_event/presentation/notifier/event/home_network/home_network_state.dart';
import 'package:kokuchi_event/presentation/widget/common/toast.dart';
import 'package:state_notifier/state_notifier.dart';

part 'home_online_state.freezed.dart';

@freezed
abstract class HomeOnlineState with _$HomeOnlineState {
  const factory HomeOnlineState({
    List<EventDto> eventDtos,
    @Default(false) bool isLoading,
    @Default(false) bool init,
  }) = _HomeOnlineState;
}

class HomeOnlineStateNotifier extends StateNotifier<HomeOnlineState>
    with LocatorMixin {
  HomeOnlineStateNotifier({@required EventRecommendAppService app})
      : _app = app,
        super(const HomeOnlineState()) {}

  final EventRecommendAppService _app;

  bool _beforeNetwork;

  @override
  Future<void> initState() async {
    try {
      await getEventsByOnline();
    } on GenericException catch (e, s) {
      await commonToast(msg: e.message);
      await FirebaseCrashlytics.instance.recordError(e, s);
    } on Exception catch (e, s) {
      logger.d(e.toString());
      await commonToast(msg: CommonString.exceptionError);
      await FirebaseCrashlytics.instance.recordError(e, s);
    } finally {
      state = state.copyWith(init: true);
    }
  }

  @override
  Future<void> update(Locator watch) async {
    final network = watch<HomeNetworkState>().network;
    try {
      // ネットワークが有効の時のみ走る
      // 初回はinitStateで走るため、スキップ（_beforeNetworkがnull）
      // networkが有効の時のみ走る
      // networkの状態が変わった時のみ走る
      if (_beforeNetwork != null &&
          network != null &&
          network &&
          network != _beforeNetwork) {
        // ネットワークが有効になったら読み取る
        await getEventsByOnline(callUpdate: true);
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
    }
  }

  Future<void> getEventsByOnline({bool callUpdate = false}) async {
    if (!callUpdate) {
      // インターネット接続があるか
      final homeNetworkState = read<HomeNetworkState>();
      if (!homeNetworkState.init ||
          homeNetworkState.network == null ||
          !homeNetworkState.network) return;
    }

    state = state.copyWith(isLoading: true);
    try {
      final eventDtos = await _app.getEventsByOnline();
      state = state.copyWith(eventDtos: eventDtos);
    } on GenericException catch (e, s) {
      await commonToast(msg: e.message);
      await FirebaseCrashlytics.instance.recordError(e, s);
    } on Exception catch (e, s) {
      await commonToast(msg: CommonString.exceptionError);
      await FirebaseCrashlytics.instance.recordError(e, s);
      logger.d(e.toString());
    } finally {
      state = state.copyWith(isLoading: false);
    }
  }
}
