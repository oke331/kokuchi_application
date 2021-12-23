import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kokuchi_event/application/dto/user_dto.dart';
import 'package:kokuchi_event/application/user_report_app_service.dart';
import 'package:kokuchi_event/presentation/notifier/user/user/user_state.dart';
import 'package:state_notifier/state_notifier.dart';

part 'other_user_card_state.freezed.dart';

@freezed
abstract class OtherUserCardState with _$OtherUserCardState {
  const factory OtherUserCardState(
      {UserDto userDto, @Default(false) bool isLoading}) = _OtherUserCardState;
}

class OtherUserCardStateNotfier extends StateNotifier<OtherUserCardState>
    with LocatorMixin {
  OtherUserCardStateNotfier(
      {@required UserReportAppService reportApp, @required UserDto userDto})
      : _reportApp = reportApp,
        super(const OtherUserCardState()) {
    state = state.copyWith(userDto: userDto);
  }

  final UserReportAppService _reportApp;

  Future<void> reportUser(String content) async {
    await _reportApp.reportUser(
        myId: read<UserState>().id,
        otherId: state.userDto.id,
        content: content);
  }

  void changeIsLoading({bool val}) {
    state = state.copyWith(isLoading: val);
  }
}
