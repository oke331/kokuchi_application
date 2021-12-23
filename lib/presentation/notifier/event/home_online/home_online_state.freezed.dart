// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'home_online_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$HomeOnlineStateTearOff {
  const _$HomeOnlineStateTearOff();

// ignore: unused_element
  _HomeOnlineState call(
      {List<EventDto> eventDtos, bool isLoading = false, bool init = false}) {
    return _HomeOnlineState(
      eventDtos: eventDtos,
      isLoading: isLoading,
      init: init,
    );
  }
}

// ignore: unused_element
const $HomeOnlineState = _$HomeOnlineStateTearOff();

mixin _$HomeOnlineState {
  List<EventDto> get eventDtos;
  bool get isLoading;
  bool get init;

  $HomeOnlineStateCopyWith<HomeOnlineState> get copyWith;
}

abstract class $HomeOnlineStateCopyWith<$Res> {
  factory $HomeOnlineStateCopyWith(
          HomeOnlineState value, $Res Function(HomeOnlineState) then) =
      _$HomeOnlineStateCopyWithImpl<$Res>;
  $Res call({List<EventDto> eventDtos, bool isLoading, bool init});
}

class _$HomeOnlineStateCopyWithImpl<$Res>
    implements $HomeOnlineStateCopyWith<$Res> {
  _$HomeOnlineStateCopyWithImpl(this._value, this._then);

  final HomeOnlineState _value;
  // ignore: unused_field
  final $Res Function(HomeOnlineState) _then;

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

abstract class _$HomeOnlineStateCopyWith<$Res>
    implements $HomeOnlineStateCopyWith<$Res> {
  factory _$HomeOnlineStateCopyWith(
          _HomeOnlineState value, $Res Function(_HomeOnlineState) then) =
      __$HomeOnlineStateCopyWithImpl<$Res>;
  @override
  $Res call({List<EventDto> eventDtos, bool isLoading, bool init});
}

class __$HomeOnlineStateCopyWithImpl<$Res>
    extends _$HomeOnlineStateCopyWithImpl<$Res>
    implements _$HomeOnlineStateCopyWith<$Res> {
  __$HomeOnlineStateCopyWithImpl(
      _HomeOnlineState _value, $Res Function(_HomeOnlineState) _then)
      : super(_value, (v) => _then(v as _HomeOnlineState));

  @override
  _HomeOnlineState get _value => super._value as _HomeOnlineState;

  @override
  $Res call({
    Object eventDtos = freezed,
    Object isLoading = freezed,
    Object init = freezed,
  }) {
    return _then(_HomeOnlineState(
      eventDtos:
          eventDtos == freezed ? _value.eventDtos : eventDtos as List<EventDto>,
      isLoading: isLoading == freezed ? _value.isLoading : isLoading as bool,
      init: init == freezed ? _value.init : init as bool,
    ));
  }
}

class _$_HomeOnlineState
    with DiagnosticableTreeMixin
    implements _HomeOnlineState {
  const _$_HomeOnlineState(
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
    return 'HomeOnlineState(eventDtos: $eventDtos, isLoading: $isLoading, init: $init)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'HomeOnlineState'))
      ..add(DiagnosticsProperty('eventDtos', eventDtos))
      ..add(DiagnosticsProperty('isLoading', isLoading))
      ..add(DiagnosticsProperty('init', init));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _HomeOnlineState &&
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
  _$HomeOnlineStateCopyWith<_HomeOnlineState> get copyWith =>
      __$HomeOnlineStateCopyWithImpl<_HomeOnlineState>(this, _$identity);
}

abstract class _HomeOnlineState implements HomeOnlineState {
  const factory _HomeOnlineState(
      {List<EventDto> eventDtos,
      bool isLoading,
      bool init}) = _$_HomeOnlineState;

  @override
  List<EventDto> get eventDtos;
  @override
  bool get isLoading;
  @override
  bool get init;
  @override
  _$HomeOnlineStateCopyWith<_HomeOnlineState> get copyWith;
}
