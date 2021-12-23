// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'search_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$SearchStateTearOff {
  const _$SearchStateTearOff();

// ignore: unused_element
  _SearchState call(
      {String onlineCheck = SearchOnlineCondition.both,
      DateTime startDate,
      DateTime endDate,
      String venue,
      String category = '選択なし',
      String searchWord}) {
    return _SearchState(
      onlineCheck: onlineCheck,
      startDate: startDate,
      endDate: endDate,
      venue: venue,
      category: category,
      searchWord: searchWord,
    );
  }
}

// ignore: unused_element
const $SearchState = _$SearchStateTearOff();

mixin _$SearchState {
  String get onlineCheck;
  DateTime get startDate;
  DateTime get endDate;
  String get venue;
  String get category;
  String get searchWord;

  $SearchStateCopyWith<SearchState> get copyWith;
}

abstract class $SearchStateCopyWith<$Res> {
  factory $SearchStateCopyWith(
          SearchState value, $Res Function(SearchState) then) =
      _$SearchStateCopyWithImpl<$Res>;
  $Res call(
      {String onlineCheck,
      DateTime startDate,
      DateTime endDate,
      String venue,
      String category,
      String searchWord});
}

class _$SearchStateCopyWithImpl<$Res> implements $SearchStateCopyWith<$Res> {
  _$SearchStateCopyWithImpl(this._value, this._then);

  final SearchState _value;
  // ignore: unused_field
  final $Res Function(SearchState) _then;

  @override
  $Res call({
    Object onlineCheck = freezed,
    Object startDate = freezed,
    Object endDate = freezed,
    Object venue = freezed,
    Object category = freezed,
    Object searchWord = freezed,
  }) {
    return _then(_value.copyWith(
      onlineCheck:
          onlineCheck == freezed ? _value.onlineCheck : onlineCheck as String,
      startDate:
          startDate == freezed ? _value.startDate : startDate as DateTime,
      endDate: endDate == freezed ? _value.endDate : endDate as DateTime,
      venue: venue == freezed ? _value.venue : venue as String,
      category: category == freezed ? _value.category : category as String,
      searchWord:
          searchWord == freezed ? _value.searchWord : searchWord as String,
    ));
  }
}

abstract class _$SearchStateCopyWith<$Res>
    implements $SearchStateCopyWith<$Res> {
  factory _$SearchStateCopyWith(
          _SearchState value, $Res Function(_SearchState) then) =
      __$SearchStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {String onlineCheck,
      DateTime startDate,
      DateTime endDate,
      String venue,
      String category,
      String searchWord});
}

class __$SearchStateCopyWithImpl<$Res> extends _$SearchStateCopyWithImpl<$Res>
    implements _$SearchStateCopyWith<$Res> {
  __$SearchStateCopyWithImpl(
      _SearchState _value, $Res Function(_SearchState) _then)
      : super(_value, (v) => _then(v as _SearchState));

  @override
  _SearchState get _value => super._value as _SearchState;

  @override
  $Res call({
    Object onlineCheck = freezed,
    Object startDate = freezed,
    Object endDate = freezed,
    Object venue = freezed,
    Object category = freezed,
    Object searchWord = freezed,
  }) {
    return _then(_SearchState(
      onlineCheck:
          onlineCheck == freezed ? _value.onlineCheck : onlineCheck as String,
      startDate:
          startDate == freezed ? _value.startDate : startDate as DateTime,
      endDate: endDate == freezed ? _value.endDate : endDate as DateTime,
      venue: venue == freezed ? _value.venue : venue as String,
      category: category == freezed ? _value.category : category as String,
      searchWord:
          searchWord == freezed ? _value.searchWord : searchWord as String,
    ));
  }
}

class _$_SearchState with DiagnosticableTreeMixin implements _SearchState {
  const _$_SearchState(
      {this.onlineCheck = SearchOnlineCondition.both,
      this.startDate,
      this.endDate,
      this.venue,
      this.category = '選択なし',
      this.searchWord})
      : assert(onlineCheck != null),
        assert(category != null);

  @JsonKey(defaultValue: SearchOnlineCondition.both)
  @override
  final String onlineCheck;
  @override
  final DateTime startDate;
  @override
  final DateTime endDate;
  @override
  final String venue;
  @JsonKey(defaultValue: '選択なし')
  @override
  final String category;
  @override
  final String searchWord;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SearchState(onlineCheck: $onlineCheck, startDate: $startDate, endDate: $endDate, venue: $venue, category: $category, searchWord: $searchWord)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SearchState'))
      ..add(DiagnosticsProperty('onlineCheck', onlineCheck))
      ..add(DiagnosticsProperty('startDate', startDate))
      ..add(DiagnosticsProperty('endDate', endDate))
      ..add(DiagnosticsProperty('venue', venue))
      ..add(DiagnosticsProperty('category', category))
      ..add(DiagnosticsProperty('searchWord', searchWord));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _SearchState &&
            (identical(other.onlineCheck, onlineCheck) ||
                const DeepCollectionEquality()
                    .equals(other.onlineCheck, onlineCheck)) &&
            (identical(other.startDate, startDate) ||
                const DeepCollectionEquality()
                    .equals(other.startDate, startDate)) &&
            (identical(other.endDate, endDate) ||
                const DeepCollectionEquality()
                    .equals(other.endDate, endDate)) &&
            (identical(other.venue, venue) ||
                const DeepCollectionEquality().equals(other.venue, venue)) &&
            (identical(other.category, category) ||
                const DeepCollectionEquality()
                    .equals(other.category, category)) &&
            (identical(other.searchWord, searchWord) ||
                const DeepCollectionEquality()
                    .equals(other.searchWord, searchWord)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(onlineCheck) ^
      const DeepCollectionEquality().hash(startDate) ^
      const DeepCollectionEquality().hash(endDate) ^
      const DeepCollectionEquality().hash(venue) ^
      const DeepCollectionEquality().hash(category) ^
      const DeepCollectionEquality().hash(searchWord);

  @override
  _$SearchStateCopyWith<_SearchState> get copyWith =>
      __$SearchStateCopyWithImpl<_SearchState>(this, _$identity);
}

abstract class _SearchState implements SearchState {
  const factory _SearchState(
      {String onlineCheck,
      DateTime startDate,
      DateTime endDate,
      String venue,
      String category,
      String searchWord}) = _$_SearchState;

  @override
  String get onlineCheck;
  @override
  DateTime get startDate;
  @override
  DateTime get endDate;
  @override
  String get venue;
  @override
  String get category;
  @override
  String get searchWord;
  @override
  _$SearchStateCopyWith<_SearchState> get copyWith;
}
