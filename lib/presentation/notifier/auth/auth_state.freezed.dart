// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'auth_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$AuthStateTearOff {
  const _$AuthStateTearOff();

// ignore: unused_element
  _AuthState call(
      {String id,
      bool init = false,
      bool isAvailableApple = false,
      bool isCancelLoading = false,
      bool isLoading = false,
      auth.User firebaseUser}) {
    return _AuthState(
      id: id,
      init: init,
      isAvailableApple: isAvailableApple,
      isCancelLoading: isCancelLoading,
      isLoading: isLoading,
      firebaseUser: firebaseUser,
    );
  }
}

// ignore: unused_element
const $AuthState = _$AuthStateTearOff();

mixin _$AuthState {
  String get id;
  bool get init;
  bool get isAvailableApple;
  bool get isCancelLoading;
  bool get isLoading;
  auth.User get firebaseUser;

  $AuthStateCopyWith<AuthState> get copyWith;
}

abstract class $AuthStateCopyWith<$Res> {
  factory $AuthStateCopyWith(AuthState value, $Res Function(AuthState) then) =
      _$AuthStateCopyWithImpl<$Res>;
  $Res call(
      {String id,
      bool init,
      bool isAvailableApple,
      bool isCancelLoading,
      bool isLoading,
      auth.User firebaseUser});
}

class _$AuthStateCopyWithImpl<$Res> implements $AuthStateCopyWith<$Res> {
  _$AuthStateCopyWithImpl(this._value, this._then);

  final AuthState _value;
  // ignore: unused_field
  final $Res Function(AuthState) _then;

  @override
  $Res call({
    Object id = freezed,
    Object init = freezed,
    Object isAvailableApple = freezed,
    Object isCancelLoading = freezed,
    Object isLoading = freezed,
    Object firebaseUser = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as String,
      init: init == freezed ? _value.init : init as bool,
      isAvailableApple: isAvailableApple == freezed
          ? _value.isAvailableApple
          : isAvailableApple as bool,
      isCancelLoading: isCancelLoading == freezed
          ? _value.isCancelLoading
          : isCancelLoading as bool,
      isLoading: isLoading == freezed ? _value.isLoading : isLoading as bool,
      firebaseUser: firebaseUser == freezed
          ? _value.firebaseUser
          : firebaseUser as auth.User,
    ));
  }
}

abstract class _$AuthStateCopyWith<$Res> implements $AuthStateCopyWith<$Res> {
  factory _$AuthStateCopyWith(
          _AuthState value, $Res Function(_AuthState) then) =
      __$AuthStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      bool init,
      bool isAvailableApple,
      bool isCancelLoading,
      bool isLoading,
      auth.User firebaseUser});
}

class __$AuthStateCopyWithImpl<$Res> extends _$AuthStateCopyWithImpl<$Res>
    implements _$AuthStateCopyWith<$Res> {
  __$AuthStateCopyWithImpl(_AuthState _value, $Res Function(_AuthState) _then)
      : super(_value, (v) => _then(v as _AuthState));

  @override
  _AuthState get _value => super._value as _AuthState;

  @override
  $Res call({
    Object id = freezed,
    Object init = freezed,
    Object isAvailableApple = freezed,
    Object isCancelLoading = freezed,
    Object isLoading = freezed,
    Object firebaseUser = freezed,
  }) {
    return _then(_AuthState(
      id: id == freezed ? _value.id : id as String,
      init: init == freezed ? _value.init : init as bool,
      isAvailableApple: isAvailableApple == freezed
          ? _value.isAvailableApple
          : isAvailableApple as bool,
      isCancelLoading: isCancelLoading == freezed
          ? _value.isCancelLoading
          : isCancelLoading as bool,
      isLoading: isLoading == freezed ? _value.isLoading : isLoading as bool,
      firebaseUser: firebaseUser == freezed
          ? _value.firebaseUser
          : firebaseUser as auth.User,
    ));
  }
}

class _$_AuthState with DiagnosticableTreeMixin implements _AuthState {
  const _$_AuthState(
      {this.id,
      this.init = false,
      this.isAvailableApple = false,
      this.isCancelLoading = false,
      this.isLoading = false,
      this.firebaseUser})
      : assert(init != null),
        assert(isAvailableApple != null),
        assert(isCancelLoading != null),
        assert(isLoading != null);

  @override
  final String id;
  @JsonKey(defaultValue: false)
  @override
  final bool init;
  @JsonKey(defaultValue: false)
  @override
  final bool isAvailableApple;
  @JsonKey(defaultValue: false)
  @override
  final bool isCancelLoading;
  @JsonKey(defaultValue: false)
  @override
  final bool isLoading;
  @override
  final auth.User firebaseUser;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AuthState(id: $id, init: $init, isAvailableApple: $isAvailableApple, isCancelLoading: $isCancelLoading, isLoading: $isLoading, firebaseUser: $firebaseUser)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AuthState'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('init', init))
      ..add(DiagnosticsProperty('isAvailableApple', isAvailableApple))
      ..add(DiagnosticsProperty('isCancelLoading', isCancelLoading))
      ..add(DiagnosticsProperty('isLoading', isLoading))
      ..add(DiagnosticsProperty('firebaseUser', firebaseUser));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _AuthState &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.init, init) ||
                const DeepCollectionEquality().equals(other.init, init)) &&
            (identical(other.isAvailableApple, isAvailableApple) ||
                const DeepCollectionEquality()
                    .equals(other.isAvailableApple, isAvailableApple)) &&
            (identical(other.isCancelLoading, isCancelLoading) ||
                const DeepCollectionEquality()
                    .equals(other.isCancelLoading, isCancelLoading)) &&
            (identical(other.isLoading, isLoading) ||
                const DeepCollectionEquality()
                    .equals(other.isLoading, isLoading)) &&
            (identical(other.firebaseUser, firebaseUser) ||
                const DeepCollectionEquality()
                    .equals(other.firebaseUser, firebaseUser)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(init) ^
      const DeepCollectionEquality().hash(isAvailableApple) ^
      const DeepCollectionEquality().hash(isCancelLoading) ^
      const DeepCollectionEquality().hash(isLoading) ^
      const DeepCollectionEquality().hash(firebaseUser);

  @override
  _$AuthStateCopyWith<_AuthState> get copyWith =>
      __$AuthStateCopyWithImpl<_AuthState>(this, _$identity);
}

abstract class _AuthState implements AuthState {
  const factory _AuthState(
      {String id,
      bool init,
      bool isAvailableApple,
      bool isCancelLoading,
      bool isLoading,
      auth.User firebaseUser}) = _$_AuthState;

  @override
  String get id;
  @override
  bool get init;
  @override
  bool get isAvailableApple;
  @override
  bool get isCancelLoading;
  @override
  bool get isLoading;
  @override
  auth.User get firebaseUser;
  @override
  _$AuthStateCopyWith<_AuthState> get copyWith;
}
