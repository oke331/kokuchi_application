// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'my_page_edit_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$MyPageEditStateTearOff {
  const _$MyPageEditStateTearOff();

// ignore: unused_element
  _MyPageEditState call(
      {bool isLoading = false,
      String id,
      String name,
      String text,
      String iconUrl,
      File iconFile,
      String prefecture,
      bool prefectureStatus,
      String status,
      bool trashBeforeIconUrl = false}) {
    return _MyPageEditState(
      isLoading: isLoading,
      id: id,
      name: name,
      text: text,
      iconUrl: iconUrl,
      iconFile: iconFile,
      prefecture: prefecture,
      prefectureStatus: prefectureStatus,
      status: status,
      trashBeforeIconUrl: trashBeforeIconUrl,
    );
  }
}

// ignore: unused_element
const $MyPageEditState = _$MyPageEditStateTearOff();

mixin _$MyPageEditState {
  bool get isLoading;
  String get id;
  String get name;
  String get text;
  String get iconUrl;
  File get iconFile;
  String get prefecture;
  bool get prefectureStatus;
  String get status;
  bool get trashBeforeIconUrl;

  $MyPageEditStateCopyWith<MyPageEditState> get copyWith;
}

abstract class $MyPageEditStateCopyWith<$Res> {
  factory $MyPageEditStateCopyWith(
          MyPageEditState value, $Res Function(MyPageEditState) then) =
      _$MyPageEditStateCopyWithImpl<$Res>;
  $Res call(
      {bool isLoading,
      String id,
      String name,
      String text,
      String iconUrl,
      File iconFile,
      String prefecture,
      bool prefectureStatus,
      String status,
      bool trashBeforeIconUrl});
}

class _$MyPageEditStateCopyWithImpl<$Res>
    implements $MyPageEditStateCopyWith<$Res> {
  _$MyPageEditStateCopyWithImpl(this._value, this._then);

  final MyPageEditState _value;
  // ignore: unused_field
  final $Res Function(MyPageEditState) _then;

  @override
  $Res call({
    Object isLoading = freezed,
    Object id = freezed,
    Object name = freezed,
    Object text = freezed,
    Object iconUrl = freezed,
    Object iconFile = freezed,
    Object prefecture = freezed,
    Object prefectureStatus = freezed,
    Object status = freezed,
    Object trashBeforeIconUrl = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: isLoading == freezed ? _value.isLoading : isLoading as bool,
      id: id == freezed ? _value.id : id as String,
      name: name == freezed ? _value.name : name as String,
      text: text == freezed ? _value.text : text as String,
      iconUrl: iconUrl == freezed ? _value.iconUrl : iconUrl as String,
      iconFile: iconFile == freezed ? _value.iconFile : iconFile as File,
      prefecture:
          prefecture == freezed ? _value.prefecture : prefecture as String,
      prefectureStatus: prefectureStatus == freezed
          ? _value.prefectureStatus
          : prefectureStatus as bool,
      status: status == freezed ? _value.status : status as String,
      trashBeforeIconUrl: trashBeforeIconUrl == freezed
          ? _value.trashBeforeIconUrl
          : trashBeforeIconUrl as bool,
    ));
  }
}

abstract class _$MyPageEditStateCopyWith<$Res>
    implements $MyPageEditStateCopyWith<$Res> {
  factory _$MyPageEditStateCopyWith(
          _MyPageEditState value, $Res Function(_MyPageEditState) then) =
      __$MyPageEditStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {bool isLoading,
      String id,
      String name,
      String text,
      String iconUrl,
      File iconFile,
      String prefecture,
      bool prefectureStatus,
      String status,
      bool trashBeforeIconUrl});
}

class __$MyPageEditStateCopyWithImpl<$Res>
    extends _$MyPageEditStateCopyWithImpl<$Res>
    implements _$MyPageEditStateCopyWith<$Res> {
  __$MyPageEditStateCopyWithImpl(
      _MyPageEditState _value, $Res Function(_MyPageEditState) _then)
      : super(_value, (v) => _then(v as _MyPageEditState));

  @override
  _MyPageEditState get _value => super._value as _MyPageEditState;

  @override
  $Res call({
    Object isLoading = freezed,
    Object id = freezed,
    Object name = freezed,
    Object text = freezed,
    Object iconUrl = freezed,
    Object iconFile = freezed,
    Object prefecture = freezed,
    Object prefectureStatus = freezed,
    Object status = freezed,
    Object trashBeforeIconUrl = freezed,
  }) {
    return _then(_MyPageEditState(
      isLoading: isLoading == freezed ? _value.isLoading : isLoading as bool,
      id: id == freezed ? _value.id : id as String,
      name: name == freezed ? _value.name : name as String,
      text: text == freezed ? _value.text : text as String,
      iconUrl: iconUrl == freezed ? _value.iconUrl : iconUrl as String,
      iconFile: iconFile == freezed ? _value.iconFile : iconFile as File,
      prefecture:
          prefecture == freezed ? _value.prefecture : prefecture as String,
      prefectureStatus: prefectureStatus == freezed
          ? _value.prefectureStatus
          : prefectureStatus as bool,
      status: status == freezed ? _value.status : status as String,
      trashBeforeIconUrl: trashBeforeIconUrl == freezed
          ? _value.trashBeforeIconUrl
          : trashBeforeIconUrl as bool,
    ));
  }
}

class _$_MyPageEditState
    with DiagnosticableTreeMixin
    implements _MyPageEditState {
  const _$_MyPageEditState(
      {this.isLoading = false,
      this.id,
      this.name,
      this.text,
      this.iconUrl,
      this.iconFile,
      this.prefecture,
      this.prefectureStatus,
      this.status,
      this.trashBeforeIconUrl = false})
      : assert(isLoading != null),
        assert(trashBeforeIconUrl != null);

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
  @override
  final File iconFile;
  @override
  final String prefecture;
  @override
  final bool prefectureStatus;
  @override
  final String status;
  @JsonKey(defaultValue: false)
  @override
  final bool trashBeforeIconUrl;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MyPageEditState(isLoading: $isLoading, id: $id, name: $name, text: $text, iconUrl: $iconUrl, iconFile: $iconFile, prefecture: $prefecture, prefectureStatus: $prefectureStatus, status: $status, trashBeforeIconUrl: $trashBeforeIconUrl)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'MyPageEditState'))
      ..add(DiagnosticsProperty('isLoading', isLoading))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('text', text))
      ..add(DiagnosticsProperty('iconUrl', iconUrl))
      ..add(DiagnosticsProperty('iconFile', iconFile))
      ..add(DiagnosticsProperty('prefecture', prefecture))
      ..add(DiagnosticsProperty('prefectureStatus', prefectureStatus))
      ..add(DiagnosticsProperty('status', status))
      ..add(DiagnosticsProperty('trashBeforeIconUrl', trashBeforeIconUrl));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _MyPageEditState &&
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
                const DeepCollectionEquality().equals(other.status, status)) &&
            (identical(other.trashBeforeIconUrl, trashBeforeIconUrl) ||
                const DeepCollectionEquality()
                    .equals(other.trashBeforeIconUrl, trashBeforeIconUrl)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(isLoading) ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(text) ^
      const DeepCollectionEquality().hash(iconUrl) ^
      const DeepCollectionEquality().hash(iconFile) ^
      const DeepCollectionEquality().hash(prefecture) ^
      const DeepCollectionEquality().hash(prefectureStatus) ^
      const DeepCollectionEquality().hash(status) ^
      const DeepCollectionEquality().hash(trashBeforeIconUrl);

  @override
  _$MyPageEditStateCopyWith<_MyPageEditState> get copyWith =>
      __$MyPageEditStateCopyWithImpl<_MyPageEditState>(this, _$identity);
}

abstract class _MyPageEditState implements MyPageEditState {
  const factory _MyPageEditState(
      {bool isLoading,
      String id,
      String name,
      String text,
      String iconUrl,
      File iconFile,
      String prefecture,
      bool prefectureStatus,
      String status,
      bool trashBeforeIconUrl}) = _$_MyPageEditState;

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
  File get iconFile;
  @override
  String get prefecture;
  @override
  bool get prefectureStatus;
  @override
  String get status;
  @override
  bool get trashBeforeIconUrl;
  @override
  _$MyPageEditStateCopyWith<_MyPageEditState> get copyWith;
}
