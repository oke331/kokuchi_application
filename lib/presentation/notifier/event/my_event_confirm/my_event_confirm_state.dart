import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:state_notifier/state_notifier.dart';

part 'my_event_confirm_state.freezed.dart';

@freezed
abstract class MyEventConfirmState with _$MyEventConfirmState {
  const factory MyEventConfirmState({@Default(false) bool isLoading}) =
      _MyEventConfirmState;
}

class MyEventConfirmStateNotifier extends StateNotifier<MyEventConfirmState> {
  MyEventConfirmStateNotifier() : super(const MyEventConfirmState()) {}
  void changeLoading({bool val}) {
    state = state.copyWith(isLoading: val);
  }
}
