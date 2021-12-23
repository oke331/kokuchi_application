// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'user_event_show_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$UserEventShowStateTearOff {
  const _$UserEventShowStateTearOff();

// ignore: unused_element
  _UserEventShowState call(
      {List<EventDto> events,
      bool init = false,
      bool isLoading = false,
      bool isClear = false,
      DateTime startAfterUpdatedAt}) {
    return _UserEventShowState(
      events: events,
      init: init,
      isLoading: isLoading,
      isClear: isClear,
      startAfterUpdatedAt: startAfterUpdatedAt,
    );
  }
}

// ignore: unused_element
const $UserEventShowState = _$UserEventShowStateTearOff();

mixin _$UserEventShowState {
  List<EventDto> get events;
  bool get init;
  bool get isLoading;
  bool get isClear;
  DateTime get startAfterUpdatedAt;

  $UserEventShowStateCopyWith<UserEventShowState> get copyWith;
}

abstract class $UserEventShowStateCopyWith<$Res> {
  factory $UserEventShowStateCopyWith(
          UserEventShowState value, $Res Function(UserEventShowState) then) =
      _$UserEventShowStateCopyWithImpl<$Res>;
  $Res call(
      {List<EventDto> events,
      bool init,
      bool isLoading,
      bool isClear,
      DateTime startAfterUpdatedAt});
}

class _$UserEventShowStateCopyWithImpl<$Res>
    implements $UserEventShowStateCopyWith<$Res> {
  _$UserEventShowStateCopyWithImpl(this._value, this._then);

  final UserEventShowState _value;
  // ignore: unused_field
  final $Res Function(UserEventShowState) _then;

  @override
  $Res call({
    Object events = freezed,
    Object init = freezed,
    Object isLoading = freezed,
    Object isClear = freezed,
    Object startAfterUpdatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      events: events == freezed ? _value.events : events as List<EventDto>,
      init: init == freezed ? _value.init : init as bool,
      isLoading: isLoading == freezed ? _value.isLoading : isLoading as bool,
      isClear: isClear == freezed ? _value.isClear : isClear as bool,
      startAfterUpdatedAt: startAfterUpdatedAt == freezed
          ? _value.startAfterUpdatedAt
          : startAfterUpdatedAt as DateTime,
    ));
  }
}

abstract class _$UserEventShowStateCopyWith<$Res>
    implements $UserEventShowStateCopyWith<$Res> {
  factory _$UserEventShowStateCopyWith(
          _UserEventShowState value, $Res Function(_UserEventShowState) then) =
      __$UserEventShowStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {List<EventDto> events,
      bool init,
      bool isLoading,
      bool isClear,
      DateTime startAfterUpdatedAt});
}

class __$UserEventShowStateCopyWithImpl<$Res>
    extends _$UserEventShowStateCopyWithImpl<$Res>
    implements _$UserEventShowStateCopyWith<$Res> {
  __$UserEventShowStateCopyWithImpl(
      _UserEventShowState _value, $Res Function(_UserEventShowState) _then)
      : super(_value, (v) => _then(v as _UserEventShowState));

  @override
  _UserEventShowState get _value => super._value as _UserEventShowState;

  @override
  $Res call({
    Object events = freezed,
    Object init = freezed,
    Object isLoading = freezed,
    Object isClear = freezed,
    Object startAfterUpdatedAt = freezed,
  }) {
    return _then(_UserEventShowState(
      events: events == freezed ? _value.events : events as List<EventDto>,
      init: init == freezed ? _value.init : init as bool,
      isLoading: isLoading == freezed ? _value.isLoading : isLoading as bool,
      isClear: isClear == freezed ? _value.isClear : isClear as bool,
      startAfterUpdatedAt: startAfterUpdatedAt == freezed
          ? _value.startAfterUpdatedAt
          : startAfterUpdatedAt as DateTime,
    ));
  }
}

class _$_UserEventShowState
    with DiagnosticableTreeMixin
    implements _UserEventShowState {
  const _$_UserEventShowState(
      {this.events,
      this.init = false,
      this.isLoading = false,
      this.isClear = false,
      this.startAfterUpdatedAt})
      : assert(init != null),
        assert(isLoading != null),
        assert(isClear != null);

  @override
  final List<EventDto> events;
  @JsonKey(defaultValue: false)
  @override
  final bool init;
  @JsonKey(defaultValue: false)
  @override
  final bool isLoading;
  @JsonKey(defaultValue: false)
  @override
  final bool isClear;
  @override
  final DateTime startAfterUpdatedAt;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'UserEventShowState(events: $events, init: $init, isLoading: $isLoading, isClear: $isClear, startAfterUpdatedAt: $startAfterUpdatedAt)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'UserEventShowState'))
      ..add(DiagnosticsProperty('events', events))
      ..add(DiagnosticsProperty('init', init))
      ..add(DiagnosticsProperty('isLoading', isLoading))
      ..add(DiagnosticsProperty('isClear', isClear))
      ..add(DiagnosticsProperty('startAfterUpdatedAt', startAfterUpdatedAt));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _UserEventShowState &&
            (identical(other.events, events) ||
                const DeepCollectionEquality().equals(other.events, events)) &&
            (identical(other.init, init) ||
                const DeepCollectionEquality().equals(other.init, init)) &&
            (identical(other.isLoading, isLoading) ||
                const DeepCollectionEquality()
                    .equals(other.isLoading, isLoading)) &&
            (identical(other.isClear, isClear) ||
                const DeepCollectionEquality()
                    .equals(other.isClear, isClear)) &&
            (identical(other.startAfterUpdatedAt, startAfterUpdatedAt) ||
                const DeepCollectionEquality()
                    .equals(other.startAfterUpdatedAt, startAfterUpdatedAt)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(events) ^
      const DeepCollectionEquality().hash(init) ^
      const DeepCollectionEquality().hash(isLoading) ^
      const DeepCollectionEquality().hash(isClear) ^
      const DeepCollectionEquality().hash(startAfterUpdatedAt);

  @override
  _$UserEventShowStateCopyWith<_UserEventShowState> get copyWith =>
      __$UserEventShowStateCopyWithImpl<_UserEventShowState>(this, _$identity);
}

abstract class _UserEventShowState implements UserEventShowState {
  const factory _UserEventShowState(
      {List<EventDto> events,
      bool init,
      bool isLoading,
      bool isClear,
      DateTime startAfterUpdatedAt}) = _$_UserEventShowState;

  @override
  List<EventDto> get events;
  @override
  bool get init;
  @override
  bool get isLoading;
  @override
  bool get isClear;
  @override
  DateTime get startAfterUpdatedAt;
  @override
  _$UserEventShowStateCopyWith<_UserEventShowState> get copyWith;
}
