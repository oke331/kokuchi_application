// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'home_network_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$HomeNetworkStateTearOff {
  const _$HomeNetworkStateTearOff();

// ignore: unused_element
  _HomeNetworkState call({bool init = false, bool network}) {
    return _HomeNetworkState(
      init: init,
      network: network,
    );
  }
}

// ignore: unused_element
const $HomeNetworkState = _$HomeNetworkStateTearOff();

mixin _$HomeNetworkState {
  bool get init;
  bool get network;

  $HomeNetworkStateCopyWith<HomeNetworkState> get copyWith;
}

abstract class $HomeNetworkStateCopyWith<$Res> {
  factory $HomeNetworkStateCopyWith(
          HomeNetworkState value, $Res Function(HomeNetworkState) then) =
      _$HomeNetworkStateCopyWithImpl<$Res>;
  $Res call({bool init, bool network});
}

class _$HomeNetworkStateCopyWithImpl<$Res>
    implements $HomeNetworkStateCopyWith<$Res> {
  _$HomeNetworkStateCopyWithImpl(this._value, this._then);

  final HomeNetworkState _value;
  // ignore: unused_field
  final $Res Function(HomeNetworkState) _then;

  @override
  $Res call({
    Object init = freezed,
    Object network = freezed,
  }) {
    return _then(_value.copyWith(
      init: init == freezed ? _value.init : init as bool,
      network: network == freezed ? _value.network : network as bool,
    ));
  }
}

abstract class _$HomeNetworkStateCopyWith<$Res>
    implements $HomeNetworkStateCopyWith<$Res> {
  factory _$HomeNetworkStateCopyWith(
          _HomeNetworkState value, $Res Function(_HomeNetworkState) then) =
      __$HomeNetworkStateCopyWithImpl<$Res>;
  @override
  $Res call({bool init, bool network});
}

class __$HomeNetworkStateCopyWithImpl<$Res>
    extends _$HomeNetworkStateCopyWithImpl<$Res>
    implements _$HomeNetworkStateCopyWith<$Res> {
  __$HomeNetworkStateCopyWithImpl(
      _HomeNetworkState _value, $Res Function(_HomeNetworkState) _then)
      : super(_value, (v) => _then(v as _HomeNetworkState));

  @override
  _HomeNetworkState get _value => super._value as _HomeNetworkState;

  @override
  $Res call({
    Object init = freezed,
    Object network = freezed,
  }) {
    return _then(_HomeNetworkState(
      init: init == freezed ? _value.init : init as bool,
      network: network == freezed ? _value.network : network as bool,
    ));
  }
}

class _$_HomeNetworkState
    with DiagnosticableTreeMixin
    implements _HomeNetworkState {
  const _$_HomeNetworkState({this.init = false, this.network})
      : assert(init != null);

  @JsonKey(defaultValue: false)
  @override
  final bool init;
  @override
  final bool network;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'HomeNetworkState(init: $init, network: $network)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'HomeNetworkState'))
      ..add(DiagnosticsProperty('init', init))
      ..add(DiagnosticsProperty('network', network));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _HomeNetworkState &&
            (identical(other.init, init) ||
                const DeepCollectionEquality().equals(other.init, init)) &&
            (identical(other.network, network) ||
                const DeepCollectionEquality().equals(other.network, network)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(init) ^
      const DeepCollectionEquality().hash(network);

  @override
  _$HomeNetworkStateCopyWith<_HomeNetworkState> get copyWith =>
      __$HomeNetworkStateCopyWithImpl<_HomeNetworkState>(this, _$identity);
}

abstract class _HomeNetworkState implements HomeNetworkState {
  const factory _HomeNetworkState({bool init, bool network}) =
      _$_HomeNetworkState;

  @override
  bool get init;
  @override
  bool get network;
  @override
  _$HomeNetworkStateCopyWith<_HomeNetworkState> get copyWith;
}
