import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kokuchi_event/presentation/share/network_check.dart';
import 'package:state_notifier/state_notifier.dart';

part 'home_network_state.freezed.dart';

@freezed
abstract class HomeNetworkState with _$HomeNetworkState {
  const factory HomeNetworkState({
    @Default(false) bool init,
    bool network,
  }) = _HomeNetworkState;
}

class HomeNetworkStateNotifier extends StateNotifier<HomeNetworkState>
    with LocatorMixin {
  HomeNetworkStateNotifier() : super(const HomeNetworkState()) {}

  @override
  Future<void> initState() async {
    await _check();
  }

  Future<void> networkStateCheck() async {
    await _check();
  }

  Future<void> _check() async {
    if (await NetworkCheck.isConnect()) {
      state = state.copyWith(
        init: true,
        network: true,
      );
    } else {
      state = state.copyWith(
        init: true,
        network: false,
      );
    }
  }
}
