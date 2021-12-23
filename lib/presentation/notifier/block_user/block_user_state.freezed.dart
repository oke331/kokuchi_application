// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'block_user_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$BlockUserStateTearOff {
  const _$BlockUserStateTearOff();

// ignore: unused_element
  _BlockUserState call(
      {bool isLoading = false,
      bool isLoadingScroll = false,
      bool init = false,
      List<UserDto> blockUsersDto,
      List<UserDto> isBlockedUsersDto}) {
    return _BlockUserState(
      isLoading: isLoading,
      isLoadingScroll: isLoadingScroll,
      init: init,
      blockUsersDto: blockUsersDto,
      isBlockedUsersDto: isBlockedUsersDto,
    );
  }
}

// ignore: unused_element
const $BlockUserState = _$BlockUserStateTearOff();

mixin _$BlockUserState {
  bool get isLoading;
  bool get isLoadingScroll;
  bool get init;
  List<UserDto> get blockUsersDto;
  List<UserDto> get isBlockedUsersDto;

  $BlockUserStateCopyWith<BlockUserState> get copyWith;
}

abstract class $BlockUserStateCopyWith<$Res> {
  factory $BlockUserStateCopyWith(
          BlockUserState value, $Res Function(BlockUserState) then) =
      _$BlockUserStateCopyWithImpl<$Res>;
  $Res call(
      {bool isLoading,
      bool isLoadingScroll,
      bool init,
      List<UserDto> blockUsersDto,
      List<UserDto> isBlockedUsersDto});
}

class _$BlockUserStateCopyWithImpl<$Res>
    implements $BlockUserStateCopyWith<$Res> {
  _$BlockUserStateCopyWithImpl(this._value, this._then);

  final BlockUserState _value;
  // ignore: unused_field
  final $Res Function(BlockUserState) _then;

  @override
  $Res call({
    Object isLoading = freezed,
    Object isLoadingScroll = freezed,
    Object init = freezed,
    Object blockUsersDto = freezed,
    Object isBlockedUsersDto = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: isLoading == freezed ? _value.isLoading : isLoading as bool,
      isLoadingScroll: isLoadingScroll == freezed
          ? _value.isLoadingScroll
          : isLoadingScroll as bool,
      init: init == freezed ? _value.init : init as bool,
      blockUsersDto: blockUsersDto == freezed
          ? _value.blockUsersDto
          : blockUsersDto as List<UserDto>,
      isBlockedUsersDto: isBlockedUsersDto == freezed
          ? _value.isBlockedUsersDto
          : isBlockedUsersDto as List<UserDto>,
    ));
  }
}

abstract class _$BlockUserStateCopyWith<$Res>
    implements $BlockUserStateCopyWith<$Res> {
  factory _$BlockUserStateCopyWith(
          _BlockUserState value, $Res Function(_BlockUserState) then) =
      __$BlockUserStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {bool isLoading,
      bool isLoadingScroll,
      bool init,
      List<UserDto> blockUsersDto,
      List<UserDto> isBlockedUsersDto});
}

class __$BlockUserStateCopyWithImpl<$Res>
    extends _$BlockUserStateCopyWithImpl<$Res>
    implements _$BlockUserStateCopyWith<$Res> {
  __$BlockUserStateCopyWithImpl(
      _BlockUserState _value, $Res Function(_BlockUserState) _then)
      : super(_value, (v) => _then(v as _BlockUserState));

  @override
  _BlockUserState get _value => super._value as _BlockUserState;

  @override
  $Res call({
    Object isLoading = freezed,
    Object isLoadingScroll = freezed,
    Object init = freezed,
    Object blockUsersDto = freezed,
    Object isBlockedUsersDto = freezed,
  }) {
    return _then(_BlockUserState(
      isLoading: isLoading == freezed ? _value.isLoading : isLoading as bool,
      isLoadingScroll: isLoadingScroll == freezed
          ? _value.isLoadingScroll
          : isLoadingScroll as bool,
      init: init == freezed ? _value.init : init as bool,
      blockUsersDto: blockUsersDto == freezed
          ? _value.blockUsersDto
          : blockUsersDto as List<UserDto>,
      isBlockedUsersDto: isBlockedUsersDto == freezed
          ? _value.isBlockedUsersDto
          : isBlockedUsersDto as List<UserDto>,
    ));
  }
}

class _$_BlockUserState
    with DiagnosticableTreeMixin
    implements _BlockUserState {
  const _$_BlockUserState(
      {this.isLoading = false,
      this.isLoadingScroll = false,
      this.init = false,
      this.blockUsersDto,
      this.isBlockedUsersDto})
      : assert(isLoading != null),
        assert(isLoadingScroll != null),
        assert(init != null);

  @JsonKey(defaultValue: false)
  @override
  final bool isLoading;
  @JsonKey(defaultValue: false)
  @override
  final bool isLoadingScroll;
  @JsonKey(defaultValue: false)
  @override
  final bool init;
  @override
  final List<UserDto> blockUsersDto;
  @override
  final List<UserDto> isBlockedUsersDto;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'BlockUserState(isLoading: $isLoading, isLoadingScroll: $isLoadingScroll, init: $init, blockUsersDto: $blockUsersDto, isBlockedUsersDto: $isBlockedUsersDto)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'BlockUserState'))
      ..add(DiagnosticsProperty('isLoading', isLoading))
      ..add(DiagnosticsProperty('isLoadingScroll', isLoadingScroll))
      ..add(DiagnosticsProperty('init', init))
      ..add(DiagnosticsProperty('blockUsersDto', blockUsersDto))
      ..add(DiagnosticsProperty('isBlockedUsersDto', isBlockedUsersDto));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _BlockUserState &&
            (identical(other.isLoading, isLoading) ||
                const DeepCollectionEquality()
                    .equals(other.isLoading, isLoading)) &&
            (identical(other.isLoadingScroll, isLoadingScroll) ||
                const DeepCollectionEquality()
                    .equals(other.isLoadingScroll, isLoadingScroll)) &&
            (identical(other.init, init) ||
                const DeepCollectionEquality().equals(other.init, init)) &&
            (identical(other.blockUsersDto, blockUsersDto) ||
                const DeepCollectionEquality()
                    .equals(other.blockUsersDto, blockUsersDto)) &&
            (identical(other.isBlockedUsersDto, isBlockedUsersDto) ||
                const DeepCollectionEquality()
                    .equals(other.isBlockedUsersDto, isBlockedUsersDto)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(isLoading) ^
      const DeepCollectionEquality().hash(isLoadingScroll) ^
      const DeepCollectionEquality().hash(init) ^
      const DeepCollectionEquality().hash(blockUsersDto) ^
      const DeepCollectionEquality().hash(isBlockedUsersDto);

  @override
  _$BlockUserStateCopyWith<_BlockUserState> get copyWith =>
      __$BlockUserStateCopyWithImpl<_BlockUserState>(this, _$identity);
}

abstract class _BlockUserState implements BlockUserState {
  const factory _BlockUserState(
      {bool isLoading,
      bool isLoadingScroll,
      bool init,
      List<UserDto> blockUsersDto,
      List<UserDto> isBlockedUsersDto}) = _$_BlockUserState;

  @override
  bool get isLoading;
  @override
  bool get isLoadingScroll;
  @override
  bool get init;
  @override
  List<UserDto> get blockUsersDto;
  @override
  List<UserDto> get isBlockedUsersDto;
  @override
  _$BlockUserStateCopyWith<_BlockUserState> get copyWith;
}
