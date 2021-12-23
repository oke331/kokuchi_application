// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'setting_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$SettingStateTearOff {
  const _$SettingStateTearOff();

// ignore: unused_element
  _SettingState call(
      {bool letsGoReminder = true,
      String developerRequestText,
      String developerRequestMail,
      bool developerRequestLoading = false,
      PermissionStatus settingNoticeState}) {
    return _SettingState(
      letsGoReminder: letsGoReminder,
      developerRequestText: developerRequestText,
      developerRequestMail: developerRequestMail,
      developerRequestLoading: developerRequestLoading,
      settingNoticeState: settingNoticeState,
    );
  }
}

// ignore: unused_element
const $SettingState = _$SettingStateTearOff();

mixin _$SettingState {
  bool get letsGoReminder;
  String get developerRequestText;
  String get developerRequestMail;
  bool get developerRequestLoading;
  PermissionStatus get settingNoticeState;

  $SettingStateCopyWith<SettingState> get copyWith;
}

abstract class $SettingStateCopyWith<$Res> {
  factory $SettingStateCopyWith(
          SettingState value, $Res Function(SettingState) then) =
      _$SettingStateCopyWithImpl<$Res>;
  $Res call(
      {bool letsGoReminder,
      String developerRequestText,
      String developerRequestMail,
      bool developerRequestLoading,
      PermissionStatus settingNoticeState});
}

class _$SettingStateCopyWithImpl<$Res> implements $SettingStateCopyWith<$Res> {
  _$SettingStateCopyWithImpl(this._value, this._then);

  final SettingState _value;
  // ignore: unused_field
  final $Res Function(SettingState) _then;

  @override
  $Res call({
    Object letsGoReminder = freezed,
    Object developerRequestText = freezed,
    Object developerRequestMail = freezed,
    Object developerRequestLoading = freezed,
    Object settingNoticeState = freezed,
  }) {
    return _then(_value.copyWith(
      letsGoReminder: letsGoReminder == freezed
          ? _value.letsGoReminder
          : letsGoReminder as bool,
      developerRequestText: developerRequestText == freezed
          ? _value.developerRequestText
          : developerRequestText as String,
      developerRequestMail: developerRequestMail == freezed
          ? _value.developerRequestMail
          : developerRequestMail as String,
      developerRequestLoading: developerRequestLoading == freezed
          ? _value.developerRequestLoading
          : developerRequestLoading as bool,
      settingNoticeState: settingNoticeState == freezed
          ? _value.settingNoticeState
          : settingNoticeState as PermissionStatus,
    ));
  }
}

abstract class _$SettingStateCopyWith<$Res>
    implements $SettingStateCopyWith<$Res> {
  factory _$SettingStateCopyWith(
          _SettingState value, $Res Function(_SettingState) then) =
      __$SettingStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {bool letsGoReminder,
      String developerRequestText,
      String developerRequestMail,
      bool developerRequestLoading,
      PermissionStatus settingNoticeState});
}

class __$SettingStateCopyWithImpl<$Res> extends _$SettingStateCopyWithImpl<$Res>
    implements _$SettingStateCopyWith<$Res> {
  __$SettingStateCopyWithImpl(
      _SettingState _value, $Res Function(_SettingState) _then)
      : super(_value, (v) => _then(v as _SettingState));

  @override
  _SettingState get _value => super._value as _SettingState;

  @override
  $Res call({
    Object letsGoReminder = freezed,
    Object developerRequestText = freezed,
    Object developerRequestMail = freezed,
    Object developerRequestLoading = freezed,
    Object settingNoticeState = freezed,
  }) {
    return _then(_SettingState(
      letsGoReminder: letsGoReminder == freezed
          ? _value.letsGoReminder
          : letsGoReminder as bool,
      developerRequestText: developerRequestText == freezed
          ? _value.developerRequestText
          : developerRequestText as String,
      developerRequestMail: developerRequestMail == freezed
          ? _value.developerRequestMail
          : developerRequestMail as String,
      developerRequestLoading: developerRequestLoading == freezed
          ? _value.developerRequestLoading
          : developerRequestLoading as bool,
      settingNoticeState: settingNoticeState == freezed
          ? _value.settingNoticeState
          : settingNoticeState as PermissionStatus,
    ));
  }
}

class _$_SettingState with DiagnosticableTreeMixin implements _SettingState {
  const _$_SettingState(
      {this.letsGoReminder = true,
      this.developerRequestText,
      this.developerRequestMail,
      this.developerRequestLoading = false,
      this.settingNoticeState})
      : assert(letsGoReminder != null),
        assert(developerRequestLoading != null);

  @JsonKey(defaultValue: true)
  @override
  final bool letsGoReminder;
  @override
  final String developerRequestText;
  @override
  final String developerRequestMail;
  @JsonKey(defaultValue: false)
  @override
  final bool developerRequestLoading;
  @override
  final PermissionStatus settingNoticeState;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SettingState(letsGoReminder: $letsGoReminder, developerRequestText: $developerRequestText, developerRequestMail: $developerRequestMail, developerRequestLoading: $developerRequestLoading, settingNoticeState: $settingNoticeState)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SettingState'))
      ..add(DiagnosticsProperty('letsGoReminder', letsGoReminder))
      ..add(DiagnosticsProperty('developerRequestText', developerRequestText))
      ..add(DiagnosticsProperty('developerRequestMail', developerRequestMail))
      ..add(DiagnosticsProperty(
          'developerRequestLoading', developerRequestLoading))
      ..add(DiagnosticsProperty('settingNoticeState', settingNoticeState));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _SettingState &&
            (identical(other.letsGoReminder, letsGoReminder) ||
                const DeepCollectionEquality()
                    .equals(other.letsGoReminder, letsGoReminder)) &&
            (identical(other.developerRequestText, developerRequestText) ||
                const DeepCollectionEquality().equals(
                    other.developerRequestText, developerRequestText)) &&
            (identical(other.developerRequestMail, developerRequestMail) ||
                const DeepCollectionEquality().equals(
                    other.developerRequestMail, developerRequestMail)) &&
            (identical(
                    other.developerRequestLoading, developerRequestLoading) ||
                const DeepCollectionEquality().equals(
                    other.developerRequestLoading, developerRequestLoading)) &&
            (identical(other.settingNoticeState, settingNoticeState) ||
                const DeepCollectionEquality()
                    .equals(other.settingNoticeState, settingNoticeState)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(letsGoReminder) ^
      const DeepCollectionEquality().hash(developerRequestText) ^
      const DeepCollectionEquality().hash(developerRequestMail) ^
      const DeepCollectionEquality().hash(developerRequestLoading) ^
      const DeepCollectionEquality().hash(settingNoticeState);

  @override
  _$SettingStateCopyWith<_SettingState> get copyWith =>
      __$SettingStateCopyWithImpl<_SettingState>(this, _$identity);
}

abstract class _SettingState implements SettingState {
  const factory _SettingState(
      {bool letsGoReminder,
      String developerRequestText,
      String developerRequestMail,
      bool developerRequestLoading,
      PermissionStatus settingNoticeState}) = _$_SettingState;

  @override
  bool get letsGoReminder;
  @override
  String get developerRequestText;
  @override
  String get developerRequestMail;
  @override
  bool get developerRequestLoading;
  @override
  PermissionStatus get settingNoticeState;
  @override
  _$SettingStateCopyWith<_SettingState> get copyWith;
}
