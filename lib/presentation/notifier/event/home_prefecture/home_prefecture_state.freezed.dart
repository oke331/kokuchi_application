// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'home_prefecture_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$HomePrefectureStateTearOff {
  const _$HomePrefectureStateTearOff();

// ignore: unused_element
  _HomePrefectureState call(
      {List<EventDto> eventDtos, bool isLoading = false, bool init = false}) {
    return _HomePrefectureState(
      eventDtos: eventDtos,
      isLoading: isLoading,
      init: init,
    );
  }
}

// ignore: unused_element
const $HomePrefectureState = _$HomePrefectureStateTearOff();

mixin _$HomePrefectureState {
  List<EventDto> get eventDtos;
  bool get isLoading;
  bool get init;

  $HomePrefectureStateCopyWith<HomePrefectureState> get copyWith;
}

abstract class $HomePrefectureStateCopyWith<$Res> {
  factory $HomePrefectureStateCopyWith(
          HomePrefectureState value, $Res Function(HomePrefectureState) then) =
      _$HomePrefectureStateCopyWithImpl<$Res>;
  $Res call({List<EventDto> eventDtos, bool isLoading, bool init});
}

class _$HomePrefectureStateCopyWithImpl<$Res>
    implements $HomePrefectureStateCopyWith<$Res> {
  _$HomePrefectureStateCopyWithImpl(this._value, this._then);

  final HomePrefectureState _value;
  // ignore: unused_field
  final $Res Function(HomePrefectureState) _then;

  @override
  $Res call({
    Object eventDtos = freezed,
    Object isLoading = freezed,
    Object init = freezed,
  }) {
    return _then(_value.copyWith(
      eventDtos:
          eventDtos == freezed ? _value.eventDtos : eventDtos as List<EventDto>,
      isLoading: isLoading == freezed ? _value.isLoading : isLoading as bool,
      init: init == freezed ? _value.init : init as bool,
    ));
  }
}

abstract class _$HomePrefectureStateCopyWith<$Res>
    implements $HomePrefectureStateCopyWith<$Res> {
  factory _$HomePrefectureStateCopyWith(_HomePrefectureState value,
          $Res Function(_HomePrefectureState) then) =
      __$HomePrefectureStateCopyWithImpl<$Res>;
  @override
  $Res call({List<EventDto> eventDtos, bool isLoading, bool init});
}

class __$HomePrefectureStateCopyWithImpl<$Res>
    extends _$HomePrefectureStateCopyWithImpl<$Res>
    implements _$HomePrefectureStateCopyWith<$Res> {
  __$HomePrefectureStateCopyWithImpl(
      _HomePrefectureState _value, $Res Function(_HomePrefectureState) _then)
      : super(_value, (v) => _then(v as _HomePrefectureState));

  @override
  _HomePrefectureState get _value => super._value as _HomePrefectureState;

  @override
  $Res call({
    Object eventDtos = freezed,
    Object isLoading = freezed,
    Object init = freezed,
  }) {
    return _then(_HomePrefectureState(
      eventDtos:
          eventDtos == freezed ? _value.eventDtos : eventDtos as List<EventDto>,
      isLoading: isLoading == freezed ? _value.isLoading : isLoading as bool,
      init: init == freezed ? _value.init : init as bool,
    ));
  }
}

class _$_HomePrefectureState
    with DiagnosticableTreeMixin
    implements _HomePrefectureState {
  const _$_HomePrefectureState(
      {this.eventDtos, this.isLoading = false, this.init = false})
      : assert(isLoading != null),
        assert(init != null);

  @override
  final List<EventDto> eventDtos;
  @JsonKey(defaultValue: false)
  @override
  final bool isLoading;
  @JsonKey(defaultValue: false)
  @override
  final bool init;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'HomePrefectureState(eventDtos: $eventDtos, isLoading: $isLoading, init: $init)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'HomePrefectureState'))
      ..add(DiagnosticsProperty('eventDtos', eventDtos))
      ..add(DiagnosticsProperty('isLoading', isLoading))
      ..add(DiagnosticsProperty('init', init));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _HomePrefectureState &&
            (identical(other.eventDtos, eventDtos) ||
                const DeepCollectionEquality()
                    .equals(other.eventDtos, eventDtos)) &&
            (identical(other.isLoading, isLoading) ||
                const DeepCollectionEquality()
                    .equals(other.isLoading, isLoading)) &&
            (identical(other.init, init) ||
                const DeepCollectionEquality().equals(other.init, init)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(eventDtos) ^
      const DeepCollectionEquality().hash(isLoading) ^
      const DeepCollectionEquality().hash(init);

  @override
  _$HomePrefectureStateCopyWith<_HomePrefectureState> get copyWith =>
      __$HomePrefectureStateCopyWithImpl<_HomePrefectureState>(
          this, _$identity);
}

abstract class _HomePrefectureState implements HomePrefectureState {
  const factory _HomePrefectureState(
      {List<EventDto> eventDtos,
      bool isLoading,
      bool init}) = _$_HomePrefectureState;

  @override
  List<EventDto> get eventDtos;
  @override
  bool get isLoading;
  @override
  bool get init;
  @override
  _$HomePrefectureStateCopyWith<_HomePrefectureState> get copyWith;
}
