import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:state_notifier/state_notifier.dart';

part 'theme_state.freezed.dart';

@freezed
abstract class ThemeState with _$ThemeState {
  const factory ThemeState({ThemeData themeData}) = _ThemeState;
}

class ThemeStateNotifier extends StateNotifier<ThemeState> {
  ThemeStateNotifier({@required ThemeData value}) : super(const ThemeState()) {
    state = state.copyWith(themeData: value);
  }

  void changeTheme(ThemeData value) {
//    if(value)
  }
}

enum ThemeData {
  bright,
  dart,
}
