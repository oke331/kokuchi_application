import 'package:flutter/cupertino.dart';
import 'package:kokuchi_event/application/dto/event/event_dto.dart';
import 'package:kokuchi_event/application/dto/user_dto.dart';
import 'package:kokuchi_event/presentation/notifier/block_user/block_user_state.dart';
import 'package:kokuchi_event/presentation/widget/common/toast.dart';
import 'package:provider/provider.dart';
import 'package:queries/collections.dart';

class FilterBlockUser {
  static List<EventDto> filterBlockUserFromEventDtos(
      BuildContext context, List<EventDto> eventDtos) {
    final result = <EventDto>[];
    if (eventDtos == null || eventDtos.isEmpty) return result;
    result.addAll(eventDtos);

    // ブロックしたイベントを除去する
    final filterList = _filterUserIdList(context);
    if (filterList == null || filterList.isEmpty) return result;

    result.removeWhere((element) => filterList.contains(element.author.id));
    return result;
  }

  static List<String> _filterUserIdList(BuildContext context) {
    var addAllList = <String>[];

    final blockUsers =
        context.select((BlockUserState value) => value.blockUsersDto);
    if (blockUsers != null && blockUsers.isNotEmpty) {
      final blockUsersId = blockUsers.map((e) => e.id);
      addAllList.addAll(blockUsersId);
    }

    final isBlockedUserDtos =
        context.select((BlockUserState value) => value.isBlockedUsersDto);
    if (isBlockedUserDtos != null && isBlockedUserDtos.isNotEmpty) {
      final isBlockedUserDtosId = isBlockedUserDtos.map((e) => e.id);
      addAllList.addAll(isBlockedUserDtosId);
    }

    if (addAllList.isEmpty) {
      return addAllList;
    }

    return Collection(addAllList).distinct().toList();
  }

  static bool checkNGBlockBeforeEventDetailShow(
      {@required List<UserDto> blockUser,
      @required List<UserDto> isBlockedUser,
      @required String userId,
      bool showToast = true}) {
    var result = false;
    if (blockUser != null && blockUser.isNotEmpty) {
      if (blockUser.map((e) => e.id).contains(userId)) {
        result = true;
        if (showToast) commonToast(msg: 'ブロックしたユーザーのイベントです。');
      }
    }

    if (isBlockedUser != null && isBlockedUser.isNotEmpty) {
      if (isBlockedUser.map((e) => e.id).contains(userId)) {
        result = true;
        if (showToast) commonToast(msg: 'ユーザーからブロックされています。');
      }
    }
    return result;
  }

  static bool checkContains(
      {@required List<UserDto> userDto, @required String userId}) {
    if (userDto == null || userDto.isEmpty) return false;
    return userDto.map((e) => e.id).contains(userId);
  }
}
