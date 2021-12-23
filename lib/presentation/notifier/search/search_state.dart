import 'package:characters/characters.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kokuchi_event/presentation/widget/common/toast.dart';
import 'package:state_notifier/state_notifier.dart';

part 'search_state.freezed.dart';

@freezed
abstract class SearchState with _$SearchState {
  const factory SearchState({
    @Default(SearchOnlineCondition.both) String onlineCheck,
    DateTime startDate,
    DateTime endDate,
    String venue,
    @Default('選択なし') String category,
    String searchWord,
  }) = _SearchState;
}

class SearchOnlineCondition {
  static const online = 'オンラインのみ';
  static const offline = 'オフラインのみ';
  static const both = '両方';
}

class SearchStateNotifier extends StateNotifier<SearchState> {
  SearchStateNotifier() : super(const SearchState()) {}

  void changeOnlineCheck(String val) {
    if (val == null || val.isEmpty) return;
    state = state.copyWith(onlineCheck: val);
  }

  Future<void> changeSearchWord(String val) async {
    if (val.characters.length > 50) {
      await commonToast(msg: '50文字以内で入力してください');
      return;
    }
    state = state.copyWith(searchWord: val);
  }

  void changeStartDate(DateTime val) {
    state = state.copyWith(startDate: val);
  }

  void changeEndDate(DateTime val) {
    state = state.copyWith(endDate: val);
  }

  void changeVenue(String val) {
    state = state.copyWith(venue: val);
  }

  void changeCategory(String val) {
    if (val == null || val.isEmpty) return;
    state = state.copyWith(category: val);
  }
}
