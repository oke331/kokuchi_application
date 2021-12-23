// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'search_result_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$SearchResultStateTearOff {
  const _$SearchResultStateTearOff();

// ignore: unused_element
  _SearchResultState call(
      {bool isLoading = false,
      bool init = false,
      String onlineCheck,
      List<EventDto> eventDtos,
      DateTime startDate,
      DateTime endDate,
      String category,
      String searchWord,
      int pageIndex = 0}) {
    return _SearchResultState(
      isLoading: isLoading,
      init: init,
      onlineCheck: onlineCheck,
      eventDtos: eventDtos,
      startDate: startDate,
      endDate: endDate,
      category: category,
      searchWord: searchWord,
      pageIndex: pageIndex,
    );
  }
}

// ignore: unused_element
const $SearchResultState = _$SearchResultStateTearOff();

mixin _$SearchResultState {
  bool get isLoading;
  bool get init;
  String get onlineCheck;
  List<EventDto> get eventDtos;
  DateTime get startDate;
  DateTime get endDate;
  String get category;
  String get searchWord;
  int get pageIndex;

  $SearchResultStateCopyWith<SearchResultState> get copyWith;
}

abstract class $SearchResultStateCopyWith<$Res> {
  factory $SearchResultStateCopyWith(
          SearchResultState value, $Res Function(SearchResultState) then) =
      _$SearchResultStateCopyWithImpl<$Res>;
  $Res call(
      {bool isLoading,
      bool init,
      String onlineCheck,
      List<EventDto> eventDtos,
      DateTime startDate,
      DateTime endDate,
      String category,
      String searchWord,
      int pageIndex});
}

class _$SearchResultStateCopyWithImpl<$Res>
    implements $SearchResultStateCopyWith<$Res> {
  _$SearchResultStateCopyWithImpl(this._value, this._then);

  final SearchResultState _value;
  // ignore: unused_field
  final $Res Function(SearchResultState) _then;

  @override
  $Res call({
    Object isLoading = freezed,
    Object init = freezed,
    Object onlineCheck = freezed,
    Object eventDtos = freezed,
    Object startDate = freezed,
    Object endDate = freezed,
    Object category = freezed,
    Object searchWord = freezed,
    Object pageIndex = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: isLoading == freezed ? _value.isLoading : isLoading as bool,
      init: init == freezed ? _value.init : init as bool,
      onlineCheck:
          onlineCheck == freezed ? _value.onlineCheck : onlineCheck as String,
      eventDtos:
          eventDtos == freezed ? _value.eventDtos : eventDtos as List<EventDto>,
      startDate:
          startDate == freezed ? _value.startDate : startDate as DateTime,
      endDate: endDate == freezed ? _value.endDate : endDate as DateTime,
      category: category == freezed ? _value.category : category as String,
      searchWord:
          searchWord == freezed ? _value.searchWord : searchWord as String,
      pageIndex: pageIndex == freezed ? _value.pageIndex : pageIndex as int,
    ));
  }
}

abstract class _$SearchResultStateCopyWith<$Res>
    implements $SearchResultStateCopyWith<$Res> {
  factory _$SearchResultStateCopyWith(
          _SearchResultState value, $Res Function(_SearchResultState) then) =
      __$SearchResultStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {bool isLoading,
      bool init,
      String onlineCheck,
      List<EventDto> eventDtos,
      DateTime startDate,
      DateTime endDate,
      String category,
      String searchWord,
      int pageIndex});
}

class __$SearchResultStateCopyWithImpl<$Res>
    extends _$SearchResultStateCopyWithImpl<$Res>
    implements _$SearchResultStateCopyWith<$Res> {
  __$SearchResultStateCopyWithImpl(
      _SearchResultState _value, $Res Function(_SearchResultState) _then)
      : super(_value, (v) => _then(v as _SearchResultState));

  @override
  _SearchResultState get _value => super._value as _SearchResultState;

  @override
  $Res call({
    Object isLoading = freezed,
    Object init = freezed,
    Object onlineCheck = freezed,
    Object eventDtos = freezed,
    Object startDate = freezed,
    Object endDate = freezed,
    Object category = freezed,
    Object searchWord = freezed,
    Object pageIndex = freezed,
  }) {
    return _then(_SearchResultState(
      isLoading: isLoading == freezed ? _value.isLoading : isLoading as bool,
      init: init == freezed ? _value.init : init as bool,
      onlineCheck:
          onlineCheck == freezed ? _value.onlineCheck : onlineCheck as String,
      eventDtos:
          eventDtos == freezed ? _value.eventDtos : eventDtos as List<EventDto>,
      startDate:
          startDate == freezed ? _value.startDate : startDate as DateTime,
      endDate: endDate == freezed ? _value.endDate : endDate as DateTime,
      category: category == freezed ? _value.category : category as String,
      searchWord:
          searchWord == freezed ? _value.searchWord : searchWord as String,
      pageIndex: pageIndex == freezed ? _value.pageIndex : pageIndex as int,
    ));
  }
}

class _$_SearchResultState
    with DiagnosticableTreeMixin
    implements _SearchResultState {
  const _$_SearchResultState(
      {this.isLoading = false,
      this.init = false,
      this.onlineCheck,
      this.eventDtos,
      this.startDate,
      this.endDate,
      this.category,
      this.searchWord,
      this.pageIndex = 0})
      : assert(isLoading != null),
        assert(init != null),
        assert(pageIndex != null);

  @JsonKey(defaultValue: false)
  @override
  final bool isLoading;
  @JsonKey(defaultValue: false)
  @override
  final bool init;
  @override
  final String onlineCheck;
  @override
  final List<EventDto> eventDtos;
  @override
  final DateTime startDate;
  @override
  final DateTime endDate;
  @override
  final String category;
  @override
  final String searchWord;
  @JsonKey(defaultValue: 0)
  @override
  final int pageIndex;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SearchResultState(isLoading: $isLoading, init: $init, onlineCheck: $onlineCheck, eventDtos: $eventDtos, startDate: $startDate, endDate: $endDate, category: $category, searchWord: $searchWord, pageIndex: $pageIndex)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SearchResultState'))
      ..add(DiagnosticsProperty('isLoading', isLoading))
      ..add(DiagnosticsProperty('init', init))
      ..add(DiagnosticsProperty('onlineCheck', onlineCheck))
      ..add(DiagnosticsProperty('eventDtos', eventDtos))
      ..add(DiagnosticsProperty('startDate', startDate))
      ..add(DiagnosticsProperty('endDate', endDate))
      ..add(DiagnosticsProperty('category', category))
      ..add(DiagnosticsProperty('searchWord', searchWord))
      ..add(DiagnosticsProperty('pageIndex', pageIndex));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _SearchResultState &&
            (identical(other.isLoading, isLoading) ||
                const DeepCollectionEquality()
                    .equals(other.isLoading, isLoading)) &&
            (identical(other.init, init) ||
                const DeepCollectionEquality().equals(other.init, init)) &&
            (identical(other.onlineCheck, onlineCheck) ||
                const DeepCollectionEquality()
                    .equals(other.onlineCheck, onlineCheck)) &&
            (identical(other.eventDtos, eventDtos) ||
                const DeepCollectionEquality()
                    .equals(other.eventDtos, eventDtos)) &&
            (identical(other.startDate, startDate) ||
                const DeepCollectionEquality()
                    .equals(other.startDate, startDate)) &&
            (identical(other.endDate, endDate) ||
                const DeepCollectionEquality()
                    .equals(other.endDate, endDate)) &&
            (identical(other.category, category) ||
                const DeepCollectionEquality()
                    .equals(other.category, category)) &&
            (identical(other.searchWord, searchWord) ||
                const DeepCollectionEquality()
                    .equals(other.searchWord, searchWord)) &&
            (identical(other.pageIndex, pageIndex) ||
                const DeepCollectionEquality()
                    .equals(other.pageIndex, pageIndex)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(isLoading) ^
      const DeepCollectionEquality().hash(init) ^
      const DeepCollectionEquality().hash(onlineCheck) ^
      const DeepCollectionEquality().hash(eventDtos) ^
      const DeepCollectionEquality().hash(startDate) ^
      const DeepCollectionEquality().hash(endDate) ^
      const DeepCollectionEquality().hash(category) ^
      const DeepCollectionEquality().hash(searchWord) ^
      const DeepCollectionEquality().hash(pageIndex);

  @override
  _$SearchResultStateCopyWith<_SearchResultState> get copyWith =>
      __$SearchResultStateCopyWithImpl<_SearchResultState>(this, _$identity);
}

abstract class _SearchResultState implements SearchResultState {
  const factory _SearchResultState(
      {bool isLoading,
      bool init,
      String onlineCheck,
      List<EventDto> eventDtos,
      DateTime startDate,
      DateTime endDate,
      String category,
      String searchWord,
      int pageIndex}) = _$_SearchResultState;

  @override
  bool get isLoading;
  @override
  bool get init;
  @override
  String get onlineCheck;
  @override
  List<EventDto> get eventDtos;
  @override
  DateTime get startDate;
  @override
  DateTime get endDate;
  @override
  String get category;
  @override
  String get searchWord;
  @override
  int get pageIndex;
  @override
  _$SearchResultStateCopyWith<_SearchResultState> get copyWith;
}
