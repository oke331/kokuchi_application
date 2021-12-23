import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kokuchi_event/application/dto/user_dto.dart';
import 'package:kokuchi_event/application/user_app_service.dart';
import 'package:kokuchi_event/common/exception.dart';
import 'package:kokuchi_event/common/string.dart';
import 'package:kokuchi_event/main.dart';
import 'package:kokuchi_event/presentation/notifier/auth/auth_state.dart';
import 'package:kokuchi_event/presentation/widget/common/toast.dart';
import 'package:state_notifier/state_notifier.dart';

part 'block_user_state.freezed.dart';

@freezed
abstract class BlockUserState with _$BlockUserState {
  const factory BlockUserState({
    @Default(false) bool isLoading,
    @Default(false) bool isLoadingScroll,
    @Default(false) bool init,
    List<UserDto> blockUsersDto,
    List<UserDto> isBlockedUsersDto,
  }) = _BlockUserState;
}

class BlockUserStateNotifier extends StateNotifier<BlockUserState>
    with LocatorMixin {
  BlockUserStateNotifier({@required UserAppService app})
      : _app = app,
        super(const BlockUserState()) {}

  final UserAppService _app;
  String _myUserId;

  @override
  Future<void> update(Locator watch) async {
    super.update(watch);

    _myUserId = watch<AuthState>().id;
    if (_myUserId != null && _myUserId.isNotEmpty && !state.init) {
      if (state.isLoading) return;
      state = state.copyWith(isLoading: true);
      try {
        await fetchBlockUsers();
        await _fetchIsBlockedUsers();
      } on GenericException catch (e, s) {
        logger.d(e.toString());
        await commonToast(msg: e.message);
        await FirebaseCrashlytics.instance.recordError(e, s);
      } on Exception catch (e, s) {
        await commonToast(msg: CommonString.exceptionError);
        await FirebaseCrashlytics.instance.recordError(e, s);
      } finally {
        state = state.copyWith(init: true, isLoading: false);
      }
    }

    // ログアウトしている状態の時はinitをfalseにする
    if ((_myUserId == null || _myUserId.isEmpty) && state.init) {
      state = state.copyWith(init: false, blockUsersDto: null);
    }
  }

  Future<void> addBlockUser({@required String otherId}) async {
    final blockUsers = state.blockUsersDto;
    if (blockUsers != null && blockUsers.isNotEmpty) {
      final blockUsersId = blockUsers.map((e) => e.id);
      if (blockUsersId.contains(otherId)) {
        await commonToast(msg: '既にブロックしているユーザーです。\n解除する場合は設定画面からお願いします！');
        return;
      }
    }

    if (state.isLoading) return false;
    state = state.copyWith(isLoading: true);
    try {
      await _app.addBlockUser(myId: _myUserId, otherId: otherId);
      final otherUserDto = await _app.findById(id: otherId);
      var resultUsers = <UserDto>[];
      resultUsers.add(otherUserDto);
      if (state.blockUsersDto != null && state.blockUsersDto.isNotEmpty) {
        resultUsers.addAll(state.blockUsersDto);
      }
      state = state.copyWith(blockUsersDto: resultUsers);
      await commonToast(msg: 'ブロックしました。\n解除する際は設定から行ってください。');
    } on GenericException catch (e, s) {
      logger.d(e.toString());
      await commonToast(msg: e.message);
      await FirebaseCrashlytics.instance.recordError(e, s);
    } on Exception catch (e, s) {
      await commonToast(msg: CommonString.exceptionError);
      await FirebaseCrashlytics.instance.recordError(e, s);
    } finally {
      state = state.copyWith(isLoading: false);
    }
  }

  Future<void> deleteBlockUser({@required String otherId}) async {
    if (state.isLoading) return;
    state = state.copyWith(isLoading: true);
    try {
      await _app.deleteBlockUser(myId: _myUserId, otherId: otherId);
      var changeBlockUsersDto = <UserDto>[];
      changeBlockUsersDto.addAll(state.blockUsersDto);
      changeBlockUsersDto.removeWhere((element) => element.id == otherId);
      state = state.copyWith(blockUsersDto: changeBlockUsersDto);
      await commonToast(msg: 'ブロックを解除しました。');
    } on GenericException catch (e, s) {
      logger.d(e.toString());
      await commonToast(msg: e.message);
      await FirebaseCrashlytics.instance.recordError(e, s);
    } on Exception catch (e, s) {
      await commonToast(msg: CommonString.exceptionError);
      await FirebaseCrashlytics.instance.recordError(e, s);
    } finally {
      state = state.copyWith(isLoading: false);
    }
  }

  Future<void> fetchBlockUsers() async {
    final blockUsersDtoFetch = await _app.fetchBlockUsers(myId: _myUserId);

    // 取得した数が1以上の場合
    if (blockUsersDtoFetch != null && blockUsersDtoFetch.isNotEmpty) {
      state = state.copyWith(blockUsersDto: blockUsersDtoFetch);
    } else {
      state = state.copyWith(blockUsersDto: null);
    }
  }

  Future<void> _fetchIsBlockedUsers() async {
    final isBlockedUsersDtoFetch =
        await _app.fetchIsBlockedUsers(myId: _myUserId);

    // 取得した数が1以上の場合
    if (isBlockedUsersDtoFetch != null && isBlockedUsersDtoFetch.isNotEmpty) {
      state = state.copyWith(isBlockedUsersDto: isBlockedUsersDtoFetch);
    } else {
      state = state.copyWith(isBlockedUsersDto: null);
    }
  }

  void changeLoadingScrollI({@required bool val}) {
    state = state.copyWith(isLoadingScroll: val);
  }
}
