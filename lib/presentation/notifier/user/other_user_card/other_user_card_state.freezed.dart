// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'other_user_card_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$OtherUserCardStateTearOff {
  const _$OtherUserCardStateTearOff();

// ignore: unused_element
  _OtherUserCardState call({UserDto userDto, bool isLoading = false}) {
    return _OtherUserCardState(
      userDto: userDto,
      isLoading: isLoading,
    );
  }
}

// ignore: unused_element
const $OtherUserCardState = _$OtherUserCardStateTearOff();

mixin _$OtherUserCardState {
  UserDto get userDto;
  bool get isLoading;

  $OtherUserCardStateCopyWith<OtherUserCardState> get copyWith;
}

abstract class $OtherUserCardStateCopyWith<$Res> {
  factory $OtherUserCardStateCopyWith(
          OtherUserCardState value, $Res Function(OtherUserCardState) then) =
      _$OtherUserCardStateCopyWithImpl<$Res>;
  $Res call({UserDto userDto, bool isLoading});
}

class _$OtherUserCardStateCopyWithImpl<$Res>
    implements $OtherUserCardStateCopyWith<$Res> {
  _$OtherUserCardStateCopyWithImpl(this._value, this._then);

  final OtherUserCardState _value;
  // ignore: unused_field
  final $Res Function(OtherUserCardState) _then;

  @override
  $Res call({
    Object userDto = freezed,
    Object isLoading = freezed,
  }) {
    return _then(_value.copyWith(
      userDto: userDto == freezed ? _value.userDto : userDto as UserDto,
      isLoading: isLoading == freezed ? _value.isLoading : isLoading as bool,
    ));
  }
}

abstract class _$OtherUserCardStateCopyWith<$Res>
    implements $OtherUserCardStateCopyWith<$Res> {
  factory _$OtherUserCardStateCopyWith(
          _OtherUserCardState value, $Res Function(_OtherUserCardState) then) =
      __$OtherUserCardStateCopyWithImpl<$Res>;
  @override
  $Res call({UserDto userDto, bool isLoading});
}

class __$OtherUserCardStateCopyWithImpl<$Res>
    extends _$OtherUserCardStateCopyWithImpl<$Res>
    implements _$OtherUserCardStateCopyWith<$Res> {
  __$OtherUserCardStateCopyWithImpl(
      _OtherUserCardState _value, $Res Function(_OtherUserCardState) _then)
      : super(_value, (v) => _then(v as _OtherUserCardState));

  @override
  _OtherUserCardState get _value => super._value as _OtherUserCardState;

  @override
  $Res call({
    Object userDto = freezed,
    Object isLoading = freezed,
  }) {
    return _then(_OtherUserCardState(
      userDto: userDto == freezed ? _value.userDto : userDto as UserDto,
      isLoading: isLoading == freezed ? _value.isLoading : isLoading as bool,
    ));
  }
}

class _$_OtherUserCardState
    with DiagnosticableTreeMixin
    implements _OtherUserCardState {
  const _$_OtherUserCardState({this.userDto, this.isLoading = false})
      : assert(isLoading != null);

  @override
  final UserDto userDto;
  @JsonKey(defaultValue: false)
  @override
  final bool isLoading;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'OtherUserCardState(userDto: $userDto, isLoading: $isLoading)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'OtherUserCardState'))
      ..add(DiagnosticsProperty('userDto', userDto))
      ..add(DiagnosticsProperty('isLoading', isLoading));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _OtherUserCardState &&
            (identical(other.userDto, userDto) ||
                const DeepCollectionEquality()
                    .equals(other.userDto, userDto)) &&
            (identical(other.isLoading, isLoading) ||
                const DeepCollectionEquality()
                    .equals(other.isLoading, isLoading)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(userDto) ^
      const DeepCollectionEquality().hash(isLoading);

  @override
  _$OtherUserCardStateCopyWith<_OtherUserCardState> get copyWith =>
      __$OtherUserCardStateCopyWithImpl<_OtherUserCardState>(this, _$identity);
}

abstract class _OtherUserCardState implements OtherUserCardState {
  const factory _OtherUserCardState({UserDto userDto, bool isLoading}) =
      _$_OtherUserCardState;

  @override
  UserDto get userDto;
  @override
  bool get isLoading;
  @override
  _$OtherUserCardStateCopyWith<_OtherUserCardState> get copyWith;
}
