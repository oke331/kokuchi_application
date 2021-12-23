// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'lets_go_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$LetsGoStateTearOff {
  const _$LetsGoStateTearOff();

// ignore: unused_element
  _LetsGoState call(
      {List<EventDto> letsGosEventDto,
      List<String> letsGoEventIDs,
      bool isLoadingChangeLetsGo = false,
      bool isLoading = false,
      bool init = false,
      DateTime startAfter}) {
    return _LetsGoState(
      letsGosEventDto: letsGosEventDto,
      letsGoEventIDs: letsGoEventIDs,
      isLoadingChangeLetsGo: isLoadingChangeLetsGo,
      isLoading: isLoading,
      init: init,
      startAfter: startAfter,
    );
  }
}

// ignore: unused_element
const $LetsGoState = _$LetsGoStateTearOff();

mixin _$LetsGoState {
  List<EventDto> get letsGosEventDto;
  List<String> get letsGoEventIDs;
  bool get isLoadingChangeLetsGo;
  bool get isLoading;
  bool get init;
  DateTime get startAfter;

  $LetsGoStateCopyWith<LetsGoState> get copyWith;
}

abstract class $LetsGoStateCopyWith<$Res> {
  factory $LetsGoStateCopyWith(
          LetsGoState value, $Res Function(LetsGoState) then) =
      _$LetsGoStateCopyWithImpl<$Res>;
  $Res call(
      {List<EventDto> letsGosEventDto,
      List<String> letsGoEventIDs,
      bool isLoadingChangeLetsGo,
      bool isLoading,
      bool init,
      DateTime startAfter});
}

class _$LetsGoStateCopyWithImpl<$Res> implements $LetsGoStateCopyWith<$Res> {
  _$LetsGoStateCopyWithImpl(this._value, this._then);

  final LetsGoState _value;
  // ignore: unused_field
  final $Res Function(LetsGoState) _then;

  @override
  $Res call({
    Object letsGosEventDto = freezed,
    Object letsGoEventIDs = freezed,
    Object isLoadingChangeLetsGo = freezed,
    Object isLoading = freezed,
    Object init = freezed,
    Object startAfter = freezed,
  }) {
    return _then(_value.copyWith(
      letsGosEventDto: letsGosEventDto == freezed
          ? _value.letsGosEventDto
          : letsGosEventDto as List<EventDto>,
      letsGoEventIDs: letsGoEventIDs == freezed
          ? _value.letsGoEventIDs
          : letsGoEventIDs as List<String>,
      isLoadingChangeLetsGo: isLoadingChangeLetsGo == freezed
          ? _value.isLoadingChangeLetsGo
          : isLoadingChangeLetsGo as bool,
      isLoading: isLoading == freezed ? _value.isLoading : isLoading as bool,
      init: init == freezed ? _value.init : init as bool,
      startAfter:
          startAfter == freezed ? _value.startAfter : startAfter as DateTime,
    ));
  }
}

abstract class _$LetsGoStateCopyWith<$Res>
    implements $LetsGoStateCopyWith<$Res> {
  factory _$LetsGoStateCopyWith(
          _LetsGoState value, $Res Function(_LetsGoState) then) =
      __$LetsGoStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {List<EventDto> letsGosEventDto,
      List<String> letsGoEventIDs,
      bool isLoadingChangeLetsGo,
      bool isLoading,
      bool init,
      DateTime startAfter});
}

class __$LetsGoStateCopyWithImpl<$Res> extends _$LetsGoStateCopyWithImpl<$Res>
    implements _$LetsGoStateCopyWith<$Res> {
  __$LetsGoStateCopyWithImpl(
      _LetsGoState _value, $Res Function(_LetsGoState) _then)
      : super(_value, (v) => _then(v as _LetsGoState));

  @override
  _LetsGoState get _value => super._value as _LetsGoState;

  @override
  $Res call({
    Object letsGosEventDto = freezed,
    Object letsGoEventIDs = freezed,
    Object isLoadingChangeLetsGo = freezed,
    Object isLoading = freezed,
    Object init = freezed,
    Object startAfter = freezed,
  }) {
    return _then(_LetsGoState(
      letsGosEventDto: letsGosEventDto == freezed
          ? _value.letsGosEventDto
          : letsGosEventDto as List<EventDto>,
      letsGoEventIDs: letsGoEventIDs == freezed
          ? _value.letsGoEventIDs
          : letsGoEventIDs as List<String>,
      isLoadingChangeLetsGo: isLoadingChangeLetsGo == freezed
          ? _value.isLoadingChangeLetsGo
          : isLoadingChangeLetsGo as bool,
      isLoading: isLoading == freezed ? _value.isLoading : isLoading as bool,
      init: init == freezed ? _value.init : init as bool,
      startAfter:
          startAfter == freezed ? _value.startAfter : startAfter as DateTime,
    ));
  }
}

class _$_LetsGoState with DiagnosticableTreeMixin implements _LetsGoState {
  const _$_LetsGoState(
      {this.letsGosEventDto,
      this.letsGoEventIDs,
      this.isLoadingChangeLetsGo = false,
      this.isLoading = false,
      this.init = false,
      this.startAfter})
      : assert(isLoadingChangeLetsGo != null),
        assert(isLoading != null),
        assert(init != null);

  @override
  final List<EventDto> letsGosEventDto;
  @override
  final List<String> letsGoEventIDs;
  @JsonKey(defaultValue: false)
  @override
  final bool isLoadingChangeLetsGo;
  @JsonKey(defaultValue: false)
  @override
  final bool isLoading;
  @JsonKey(defaultValue: false)
  @override
  final bool init;
  @override
  final DateTime startAfter;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'LetsGoState(letsGosEventDto: $letsGosEventDto, letsGoEventIDs: $letsGoEventIDs, isLoadingChangeLetsGo: $isLoadingChangeLetsGo, isLoading: $isLoading, init: $init, startAfter: $startAfter)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'LetsGoState'))
      ..add(DiagnosticsProperty('letsGosEventDto', letsGosEventDto))
      ..add(DiagnosticsProperty('letsGoEventIDs', letsGoEventIDs))
      ..add(DiagnosticsProperty('isLoadingChangeLetsGo', isLoadingChangeLetsGo))
      ..add(DiagnosticsProperty('isLoading', isLoading))
      ..add(DiagnosticsProperty('init', init))
      ..add(DiagnosticsProperty('startAfter', startAfter));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _LetsGoState &&
            (identical(other.letsGosEventDto, letsGosEventDto) ||
                const DeepCollectionEquality()
                    .equals(other.letsGosEventDto, letsGosEventDto)) &&
            (identical(other.letsGoEventIDs, letsGoEventIDs) ||
                const DeepCollectionEquality()
                    .equals(other.letsGoEventIDs, letsGoEventIDs)) &&
            (identical(other.isLoadingChangeLetsGo, isLoadingChangeLetsGo) ||
                const DeepCollectionEquality().equals(
                    other.isLoadingChangeLetsGo, isLoadingChangeLetsGo)) &&
            (identical(other.isLoading, isLoading) ||
                const DeepCollectionEquality()
                    .equals(other.isLoading, isLoading)) &&
            (identical(other.init, init) ||
                const DeepCollectionEquality().equals(other.init, init)) &&
            (identical(other.startAfter, startAfter) ||
                const DeepCollectionEquality()
                    .equals(other.startAfter, startAfter)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(letsGosEventDto) ^
      const DeepCollectionEquality().hash(letsGoEventIDs) ^
      const DeepCollectionEquality().hash(isLoadingChangeLetsGo) ^
      const DeepCollectionEquality().hash(isLoading) ^
      const DeepCollectionEquality().hash(init) ^
      const DeepCollectionEquality().hash(startAfter);

  @override
  _$LetsGoStateCopyWith<_LetsGoState> get copyWith =>
      __$LetsGoStateCopyWithImpl<_LetsGoState>(this, _$identity);
}

abstract class _LetsGoState implements LetsGoState {
  const factory _LetsGoState(
      {List<EventDto> letsGosEventDto,
      List<String> letsGoEventIDs,
      bool isLoadingChangeLetsGo,
      bool isLoading,
      bool init,
      DateTime startAfter}) = _$_LetsGoState;

  @override
  List<EventDto> get letsGosEventDto;
  @override
  List<String> get letsGoEventIDs;
  @override
  bool get isLoadingChangeLetsGo;
  @override
  bool get isLoading;
  @override
  bool get init;
  @override
  DateTime get startAfter;
  @override
  _$LetsGoStateCopyWith<_LetsGoState> get copyWith;
}
