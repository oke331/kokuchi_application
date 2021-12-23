// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'user_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$UserStateTearOff {
  const _$UserStateTearOff();

// ignore: unused_element
  _UserState call(
      {bool init = false,
      bool isLoading = false,
      String id,
      String name,
      String text,
      String iconUrl,
      bool trashBeforeIconUrl = false,
      File iconFile,
      String prefecture,
      bool prefectureStatus = true,
      String status}) {
    return _UserState(
      init: init,
      isLoading: isLoading,
      id: id,
      name: name,
      text: text,
      iconUrl: iconUrl,
      trashBeforeIconUrl: trashBeforeIconUrl,
      iconFile: iconFile,
      prefecture: prefecture,
      prefectureStatus: prefectureStatus,
      status: status,
    );
  }
}

// ignore: unused_element
const $UserState = _$UserStateTearOff();

mixin _$UserState {
  bool get init;
  bool get isLoading;
  String get id;
  String get name;
  String get text;
  String get iconUrl;
  bool get trashBeforeIconUrl;
  File get iconFile;
  String get prefecture;
  bool get prefectureStatus;
  String get status;

  $UserStateCopyWith<UserState> get copyWith;
}

abstract class $UserStateCopyWith<$Res> {
  factory $UserStateCopyWith(UserState value, $Res Function(UserState) then) =
      _$UserStateCopyWithImpl<$Res>;
  $Res call(
      {bool init,
      bool isLoading,
      String id,
      String name,
      String text,
      String iconUrl,
      bool trashBeforeIconUrl,
      File iconFile,
      String prefecture,
      bool prefectureStatus,
      String status});
}

class _$UserStateCopyWithImpl<$Res> implements $UserStateCopyWith<$Res> {
  _$UserStateCopyWithImpl(this._value, this._then);

  final UserState _value;
  // ignore: unused_field
  final $Res Function(UserState) _then;

  @override
  $Res call({
    Object init = freezed,
    Object isLoading = freezed,
    Object id = freezed,
    Object name = freezed,
    Object text = freezed,
    Object iconUrl = freezed,
    Object trashBeforeIconUrl = freezed,
    Object iconFile = freezed,
    Object prefecture = freezed,
    Object prefectureStatus = freezed,
    Object status = freezed,
  }) {
    return _then(_value.copyWith(
      init: init == freezed ? _value.init : init as bool,
      isLoading: isLoading == freezed ? _value.isLoading : isLoading as bool,
      id: id == freezed ? _value.id : id as String,
      name: name == freezed ? _value.name : name as String,
      text: text == freezed ? _value.text : text as String,
      iconUrl: iconUrl == freezed ? _value.iconUrl : iconUrl as String,
      trashBeforeIconUrl: trashBeforeIconUrl == freezed
          ? _value.trashBeforeIconUrl
          : trashBeforeIconUrl as bool,
      iconFile: iconFile == freezed ? _value.iconFile : iconFile as File,
      prefecture:
          prefecture == freezed ? _value.prefecture : prefecture as String,
      prefectureStatus: prefectureStatus == freezed
          ? _value.prefectureStatus
          : prefectureStatus as bool,
      status: status == freezed ? _value.status : status as String,
    ));
  }
}

abstract class _$UserStateCopyWith<$Res> implements $UserStateCopyWith<$Res> {
  factory _$UserStateCopyWith(
          _UserState value, $Res Function(_UserState) then) =
      __$UserStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {bool init,
      bool isLoading,
      String id,
      String name,
      String text,
      String iconUrl,
      bool trashBeforeIconUrl,
      File iconFile,
      String prefecture,
      bool prefectureStatus,
      String status});
}

class __$UserStateCopyWithImpl<$Res> extends _$UserStateCopyWithImpl<$Res>
    implements _$UserStateCopyWith<$Res> {
  __$UserStateCopyWithImpl(_UserState _value, $Res Function(_UserState) _then)
      : super(_value, (v) => _then(v as _UserState));

  @override
  _UserState get _value => super._value as _UserState;

  @override
  $Res call({
    Object init = freezed,
    Object isLoading = freezed,
    Object id = freezed,
    Object name = freezed,
    Object text = freezed,
    Object iconUrl = freezed,
    Object trashBeforeIconUrl = freezed,
    Object iconFile = freezed,
    Object prefecture = freezed,
    Object prefectureStatus = freezed,
    Object status = freezed,
  }) {
    return _then(_UserState(
      init: init == freezed ? _value.init : init as bool,
      isLoading: isLoading == freezed ? _value.isLoading : isLoading as bool,
      id: id == freezed ? _value.id : id as String,
      name: name == freezed ? _value.name : name as String,
      text: text == freezed ? _value.text : text as String,
      iconUrl: iconUrl == freezed ? _value.iconUrl : iconUrl as String,
      trashBeforeIconUrl: trashBeforeIconUrl == freezed
          ? _value.trashBeforeIconUrl
          : trashBeforeIconUrl as bool,
      iconFile: iconFile == freezed ? _value.iconFile : iconFile as File,
      prefecture:
          prefecture == freezed ? _value.prefecture : prefecture as String,
      prefectureStatus: prefectureStatus == freezed
          ? _value.prefectureStatus
          : prefectureStatus as bool,
      status: status == freezed ? _value.status : status as String,
    ));
  }
}

class _$_UserState with DiagnosticableTreeMixin implements _UserState {
  const _$_UserState(
      {this.init = false,
      this.isLoading = false,
      this.id,
      this.name,
      this.text,
      this.iconUrl,
      this.trashBeforeIconUrl = false,
      this.iconFile,
      this.prefecture,
      this.prefectureStatus = true,
      this.status})
      : assert(init != null),
        assert(isLoading != null),
        assert(trashBeforeIconUrl != null),
        assert(prefectureStatus != null);

  @JsonKey(defaultValue: false)
  @override
  final bool init;
  @JsonKey(defaultValue: false)
  @override
  final bool isLoading;
  @override
  final String id;
  @override
  final String name;
  @override
  final String text;
  @override
  final String iconUrl;
  @JsonKey(defaultValue: false)
  @override
  final bool trashBeforeIconUrl;
  @override
  final File iconFile;
  @override
  final String prefecture;
  @JsonKey(defaultValue: true)
  @override
  final bool prefectureStatus;
  @override
  final String status;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'UserState(init: $init, isLoading: $isLoading, id: $id, name: $name, text: $text, iconUrl: $iconUrl, trashBeforeIconUrl: $trashBeforeIconUrl, iconFile: $iconFile, prefecture: $prefecture, prefectureStatus: $prefectureStatus, status: $status)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'UserState'))
      ..add(DiagnosticsProperty('init', init))
      ..add(DiagnosticsProperty('isLoading', isLoading))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('text', text))
      ..add(DiagnosticsProperty('iconUrl', iconUrl))
      ..add(DiagnosticsProperty('trashBeforeIconUrl', trashBeforeIconUrl))
      ..add(DiagnosticsProperty('iconFile', iconFile))
      ..add(DiagnosticsProperty('prefecture', prefecture))
      ..add(DiagnosticsProperty('prefectureStatus', prefectureStatus))
      ..add(DiagnosticsProperty('status', status));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _UserState &&
            (identical(other.init, init) ||
                const DeepCollectionEquality().equals(other.init, init)) &&
            (identical(other.isLoading, isLoading) ||
                const DeepCollectionEquality()
                    .equals(other.isLoading, isLoading)) &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.text, text) ||
                const DeepCollectionEquality().equals(other.text, text)) &&
            (identical(other.iconUrl, iconUrl) ||
                const DeepCollectionEquality()
                    .equals(other.iconUrl, iconUrl)) &&
            (identical(other.trashBeforeIconUrl, trashBeforeIconUrl) ||
                const DeepCollectionEquality()
                    .equals(other.trashBeforeIconUrl, trashBeforeIconUrl)) &&
            (identical(other.iconFile, iconFile) ||
                const DeepCollectionEquality()
                    .equals(other.iconFile, iconFile)) &&
            (identical(other.prefecture, prefecture) ||
                const DeepCollectionEquality()
                    .equals(other.prefecture, prefecture)) &&
            (identical(other.prefectureStatus, prefectureStatus) ||
                const DeepCollectionEquality()
                    .equals(other.prefectureStatus, prefectureStatus)) &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(init) ^
      const DeepCollectionEquality().hash(isLoading) ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(text) ^
      const DeepCollectionEquality().hash(iconUrl) ^
      const DeepCollectionEquality().hash(trashBeforeIconUrl) ^
      const DeepCollectionEquality().hash(iconFile) ^
      const DeepCollectionEquality().hash(prefecture) ^
      const DeepCollectionEquality().hash(prefectureStatus) ^
      const DeepCollectionEquality().hash(status);

  @override
  _$UserStateCopyWith<_UserState> get copyWith =>
      __$UserStateCopyWithImpl<_UserState>(this, _$identity);
}

abstract class _UserState implements UserState {
  const factory _UserState(
      {bool init,
      bool isLoading,
      String id,
      String name,
      String text,
      String iconUrl,
      bool trashBeforeIconUrl,
      File iconFile,
      String prefecture,
      bool prefectureStatus,
      String status}) = _$_UserState;

  @override
  bool get init;
  @override
  bool get isLoading;
  @override
  String get id;
  @override
  String get name;
  @override
  String get text;
  @override
  String get iconUrl;
  @override
  bool get trashBeforeIconUrl;
  @override
  File get iconFile;
  @override
  String get prefecture;
  @override
  bool get prefectureStatus;
  @override
  String get status;
  @override
  _$UserStateCopyWith<_UserState> get copyWith;
}
