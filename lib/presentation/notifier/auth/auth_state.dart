import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kokuchi_event/application/auth_app_service.dart';
import 'package:kokuchi_event/domain/event/event_repository_base.dart';
import 'package:kokuchi_event/domain/user/user_repository_base.dart';
import 'package:kokuchi_event/presentation/notifier/user/user/user_state.dart';
import 'package:state_notifier/state_notifier.dart';

part 'auth_state.freezed.dart';

@freezed
abstract class AuthState with _$AuthState {
  const factory AuthState({
    String id,
    @Default(false) bool init,
    @Default(false) bool isAvailableApple,
    @Default(false) bool isCancelLoading,
    @Default(false) bool isLoading,
    auth.User firebaseUser,
  }) = _AuthState;
}

class AuthStateNotifier extends StateNotifier<AuthState> with LocatorMixin {
  AuthStateNotifier({@required AuthAppService app})
      : _app = app,
        super(const AuthState());

  final AuthAppService _app;

//  StreamSubscription authStream;

  @override
  void initState() {
    _isAvailableApple();
    _initCurrentAuth();
  }

  Future<void> _initCurrentAuth() async {
    try {
      final authDto = await _app.initCurrentAuth();
      if (authDto == null) {
        noIdState();
      } else {
        state =
            state.copyWith(id: authDto.id, firebaseUser: authDto.firebaseUser);
      }
    } on Exception catch (e) {
      noIdState();
    } finally {
      state = state.copyWith(init: true);
    }
  }

  Future<void> _isAvailableApple() async {
    final isAvailableApple = await _app.isAvailableApple();
    state = state.copyWith(isAvailableApple: isAvailableApple);
  }

  @override
  void dispose() {
    super.dispose();

//    authStream.cancel();
  }

  Future<void> googleLogin() async {
    if (state.id != null && state.id.isNotEmpty) {
      noIdState();
    }
    final authDto = await _app.googleLogin();
    state = state.copyWith(id: authDto.id, firebaseUser: authDto.firebaseUser);
  }

  Future<void> appleLogin() async {
    if (state.id != null && state.id.isNotEmpty) {
      noIdState();
    }
    final authDto = await _app.appleLogin();
    state = state.copyWith(id: authDto.id, firebaseUser: authDto.firebaseUser);
  }

  Future<void> logout() async {
    await _app.logout();
    noIdState();
  }

  Future<void> cancelMember(
      {@required UserState userState,
      @required UserRepositoryBase userRepository,
      @required EventRepositoryBase eventRepository}) async {
    if (state.isCancelLoading) return;
    state = state.copyWith(isCancelLoading: true);
    await _app.cancelMember(
        userRepository: userRepository,
        eventRepository: eventRepository,
        userState: userState);

    noIdState();
  }

  void cancelLoadingChange({bool val}) {
    state = state.copyWith(isCancelLoading: val);
  }

  void noIdState() {
    state = state.copyWith(id: null, firebaseUser: null);
  }

  void loadingChange({bool val}) {
    state = state.copyWith(isLoading: val);
  }
}
