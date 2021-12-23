// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'my_event_confirm_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$MyEventConfirmStateTearOff {
  const _$MyEventConfirmStateTearOff();

// ignore: unused_element
  _MyEventConfirmState call({bool isLoading = false}) {
    return _MyEventConfirmState(
      isLoading: isLoading,
    );
  }
}

// ignore: unused_element
const $MyEventConfirmState = _$MyEventConfirmStateTearOff();

mixin _$MyEventConfirmState {
  bool get isLoading;

  $MyEventConfirmStateCopyWith<MyEventConfirmState> get copyWith;
}

abstract class $MyEventConfirmStateCopyWith<$Res> {
  factory $MyEventConfirmStateCopyWith(
          MyEventConfirmState value, $Res Function(MyEventConfirmState) then) =
      _$MyEventConfirmStateCopyWithImpl<$Res>;
  $Res call({bool isLoading});
}

class _$MyEventConfirmStateCopyWithImpl<$Res>
    implements $MyEventConfirmStateCopyWith<$Res> {
  _$MyEventConfirmStateCopyWithImpl(this._value, this._then);

  final MyEventConfirmState _value;
  // ignore: unused_field
  final $Res Function(MyEventConfirmState) _then;

  @override
  $Res call({
    Object isLoading = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: isLoading == freezed ? _value.isLoading : isLoading as bool,
    ));
  }
}

abstract class _$MyEventConfirmStateCopyWith<$Res>
    implements $MyEventConfirmStateCopyWith<$Res> {
  factory _$MyEventConfirmStateCopyWith(_MyEventConfirmState value,
          $Res Function(_MyEventConfirmState) then) =
      __$MyEventConfirmStateCopyWithImpl<$Res>;
  @override
  $Res call({bool isLoading});
}

class __$MyEventConfirmStateCopyWithImpl<$Res>
    extends _$MyEventConfirmStateCopyWithImpl<$Res>
    implements _$MyEventConfirmStateCopyWith<$Res> {
  __$MyEventConfirmStateCopyWithImpl(
      _MyEventConfirmState _value, $Res Function(_MyEventConfirmState) _then)
      : super(_value, (v) => _then(v as _MyEventConfirmState));

  @override
  _MyEventConfirmState get _value => super._value as _MyEventConfirmState;

  @override
  $Res call({
    Object isLoading = freezed,
  }) {
    return _then(_MyEventConfirmState(
      isLoading: isLoading == freezed ? _value.isLoading : isLoading as bool,
    ));
  }
}

class _$_MyEventConfirmState
    with DiagnosticableTreeMixin
    implements _MyEventConfirmState {
  const _$_MyEventConfirmState({this.isLoading = false})
      : assert(isLoading != null);

  @JsonKey(defaultValue: false)
  @override
  final bool isLoading;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MyEventConfirmState(isLoading: $isLoading)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'MyEventConfirmState'))
      ..add(DiagnosticsProperty('isLoading', isLoading));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _MyEventConfirmState &&
            (identical(other.isLoading, isLoading) ||
                const DeepCollectionEquality()
                    .equals(other.isLoading, isLoading)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(isLoading);

  @override
  _$MyEventConfirmStateCopyWith<_MyEventConfirmState> get copyWith =>
      __$MyEventConfirmStateCopyWithImpl<_MyEventConfirmState>(
          this, _$identity);
}

abstract class _MyEventConfirmState implements MyEventConfirmState {
  const factory _MyEventConfirmState({bool isLoading}) = _$_MyEventConfirmState;

  @override
  bool get isLoading;
  @override
  _$MyEventConfirmStateCopyWith<_MyEventConfirmState> get copyWith;
}
