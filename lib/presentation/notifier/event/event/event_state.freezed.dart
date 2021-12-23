// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'event_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$EventStateTearOff {
  const _$EventStateTearOff();

// ignore: unused_element
  _EventState call({bool isLoading = false}) {
    return _EventState(
      isLoading: isLoading,
    );
  }
}

// ignore: unused_element
const $EventState = _$EventStateTearOff();

mixin _$EventState {
  bool get isLoading;

  $EventStateCopyWith<EventState> get copyWith;
}

abstract class $EventStateCopyWith<$Res> {
  factory $EventStateCopyWith(
          EventState value, $Res Function(EventState) then) =
      _$EventStateCopyWithImpl<$Res>;
  $Res call({bool isLoading});
}

class _$EventStateCopyWithImpl<$Res> implements $EventStateCopyWith<$Res> {
  _$EventStateCopyWithImpl(this._value, this._then);

  final EventState _value;
  // ignore: unused_field
  final $Res Function(EventState) _then;

  @override
  $Res call({
    Object isLoading = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: isLoading == freezed ? _value.isLoading : isLoading as bool,
    ));
  }
}

abstract class _$EventStateCopyWith<$Res> implements $EventStateCopyWith<$Res> {
  factory _$EventStateCopyWith(
          _EventState value, $Res Function(_EventState) then) =
      __$EventStateCopyWithImpl<$Res>;
  @override
  $Res call({bool isLoading});
}

class __$EventStateCopyWithImpl<$Res> extends _$EventStateCopyWithImpl<$Res>
    implements _$EventStateCopyWith<$Res> {
  __$EventStateCopyWithImpl(
      _EventState _value, $Res Function(_EventState) _then)
      : super(_value, (v) => _then(v as _EventState));

  @override
  _EventState get _value => super._value as _EventState;

  @override
  $Res call({
    Object isLoading = freezed,
  }) {
    return _then(_EventState(
      isLoading: isLoading == freezed ? _value.isLoading : isLoading as bool,
    ));
  }
}

class _$_EventState with DiagnosticableTreeMixin implements _EventState {
  const _$_EventState({this.isLoading = false}) : assert(isLoading != null);

  @JsonKey(defaultValue: false)
  @override
  final bool isLoading;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'EventState(isLoading: $isLoading)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'EventState'))
      ..add(DiagnosticsProperty('isLoading', isLoading));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _EventState &&
            (identical(other.isLoading, isLoading) ||
                const DeepCollectionEquality()
                    .equals(other.isLoading, isLoading)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(isLoading);

  @override
  _$EventStateCopyWith<_EventState> get copyWith =>
      __$EventStateCopyWithImpl<_EventState>(this, _$identity);
}

abstract class _EventState implements EventState {
  const factory _EventState({bool isLoading}) = _$_EventState;

  @override
  bool get isLoading;
  @override
  _$EventStateCopyWith<_EventState> get copyWith;
}
