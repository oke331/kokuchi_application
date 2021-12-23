// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'new_event_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$NewEventStateTearOff {
  const _$NewEventStateTearOff();

// ignore: unused_element
  _NewEventState call(
      {List<EventDto> events,
      bool init = false,
      bool isLoading = false,
      bool isClear = false,
      DateTime startAfterCreatedAt}) {
    return _NewEventState(
      events: events,
      init: init,
      isLoading: isLoading,
      isClear: isClear,
      startAfterCreatedAt: startAfterCreatedAt,
    );
  }
}

// ignore: unused_element
const $NewEventState = _$NewEventStateTearOff();

mixin _$NewEventState {
  List<EventDto> get events;
  bool get init;
  bool get isLoading;
  bool get isClear;
  DateTime get startAfterCreatedAt;

  $NewEventStateCopyWith<NewEventState> get copyWith;
}

abstract class $NewEventStateCopyWith<$Res> {
  factory $NewEventStateCopyWith(
          NewEventState value, $Res Function(NewEventState) then) =
      _$NewEventStateCopyWithImpl<$Res>;
  $Res call(
      {List<EventDto> events,
      bool init,
      bool isLoading,
      bool isClear,
      DateTime startAfterCreatedAt});
}

class _$NewEventStateCopyWithImpl<$Res>
    implements $NewEventStateCopyWith<$Res> {
  _$NewEventStateCopyWithImpl(this._value, this._then);

  final NewEventState _value;
  // ignore: unused_field
  final $Res Function(NewEventState) _then;

  @override
  $Res call({
    Object events = freezed,
    Object init = freezed,
    Object isLoading = freezed,
    Object isClear = freezed,
    Object startAfterCreatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      events: events == freezed ? _value.events : events as List<EventDto>,
      init: init == freezed ? _value.init : init as bool,
      isLoading: isLoading == freezed ? _value.isLoading : isLoading as bool,
      isClear: isClear == freezed ? _value.isClear : isClear as bool,
      startAfterCreatedAt: startAfterCreatedAt == freezed
          ? _value.startAfterCreatedAt
          : startAfterCreatedAt as DateTime,
    ));
  }
}

abstract class _$NewEventStateCopyWith<$Res>
    implements $NewEventStateCopyWith<$Res> {
  factory _$NewEventStateCopyWith(
          _NewEventState value, $Res Function(_NewEventState) then) =
      __$NewEventStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {List<EventDto> events,
      bool init,
      bool isLoading,
      bool isClear,
      DateTime startAfterCreatedAt});
}

class __$NewEventStateCopyWithImpl<$Res>
    extends _$NewEventStateCopyWithImpl<$Res>
    implements _$NewEventStateCopyWith<$Res> {
  __$NewEventStateCopyWithImpl(
      _NewEventState _value, $Res Function(_NewEventState) _then)
      : super(_value, (v) => _then(v as _NewEventState));

  @override
  _NewEventState get _value => super._value as _NewEventState;

  @override
  $Res call({
    Object events = freezed,
    Object init = freezed,
    Object isLoading = freezed,
    Object isClear = freezed,
    Object startAfterCreatedAt = freezed,
  }) {
    return _then(_NewEventState(
      events: events == freezed ? _value.events : events as List<EventDto>,
      init: init == freezed ? _value.init : init as bool,
      isLoading: isLoading == freezed ? _value.isLoading : isLoading as bool,
      isClear: isClear == freezed ? _value.isClear : isClear as bool,
      startAfterCreatedAt: startAfterCreatedAt == freezed
          ? _value.startAfterCreatedAt
          : startAfterCreatedAt as DateTime,
    ));
  }
}

class _$_NewEventState implements _NewEventState {
  const _$_NewEventState(
      {this.events,
      this.init = false,
      this.isLoading = false,
      this.isClear = false,
      this.startAfterCreatedAt})
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
  final DateTime startAfterCreatedAt;

  @override
  String toString() {
    return 'NewEventState(events: $events, init: $init, isLoading: $isLoading, isClear: $isClear, startAfterCreatedAt: $startAfterCreatedAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _NewEventState &&
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
            (identical(other.startAfterCreatedAt, startAfterCreatedAt) ||
                const DeepCollectionEquality()
                    .equals(other.startAfterCreatedAt, startAfterCreatedAt)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(events) ^
      const DeepCollectionEquality().hash(init) ^
      const DeepCollectionEquality().hash(isLoading) ^
      const DeepCollectionEquality().hash(isClear) ^
      const DeepCollectionEquality().hash(startAfterCreatedAt);

  @override
  _$NewEventStateCopyWith<_NewEventState> get copyWith =>
      __$NewEventStateCopyWithImpl<_NewEventState>(this, _$identity);
}

abstract class _NewEventState implements NewEventState {
  const factory _NewEventState(
      {List<EventDto> events,
      bool init,
      bool isLoading,
      bool isClear,
      DateTime startAfterCreatedAt}) = _$_NewEventState;

  @override
  List<EventDto> get events;
  @override
  bool get init;
  @override
  bool get isLoading;
  @override
  bool get isClear;
  @override
  DateTime get startAfterCreatedAt;
  @override
  _$NewEventStateCopyWith<_NewEventState> get copyWith;
}
