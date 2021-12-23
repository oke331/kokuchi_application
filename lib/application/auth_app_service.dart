import 'package:flutter/cupertino.dart';
import 'package:kokuchi_event/application/dto/auth_dto.dart';
import 'package:kokuchi_event/domain/event/event_repository_base.dart';
import 'package:kokuchi_event/domain/login/auth_repository_base.dart';
import 'package:kokuchi_event/domain/user/user_repository_base.dart';
import 'package:kokuchi_event/domain/user/value/user_id.dart';
import 'package:kokuchi_event/presentation/notifier/user/user/user_state.dart';

@immutable
class AuthAppService {
  const AuthAppService({@required AuthRepositoryBase repository})
      : _repository = repository;

  final AuthRepositoryBase _repository;

  Future<AuthDto> initCurrentAuth() async {
    final auth = await _repository.initCurrentAuth();
    return AuthDto(auth);
  }

  Future<AuthDto> googleLogin() async {
    final auth = await _repository.googleLogin();
    return AuthDto(auth);
  }

  Future<AuthDto> appleLogin() async {
    final auth = await _repository.appleLogin();
    return AuthDto(auth);
  }

  Future<bool> isAvailableApple() async {
    return _repository.isAvailableApple();
  }

  Future<void> logout() async {
    await _repository.logout();
  }

  Future<void> cancelMember(
      {@required UserState userState,
      @required UserRepositoryBase userRepository,
      @required EventRepositoryBase eventRepository}) async {
    // event関連の情報を全て置き換え
    await eventRepository.cancelMember(UserId(userState.id));

    // ユーザー情報のステータスをdeleteに書き換え
    await userRepository.saveCancelMember(User.fromUserState(userState));

    // ログアウトして初期状態に。
    await logout();
  }
}
