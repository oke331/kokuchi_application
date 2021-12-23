import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class JapaneseCupertinoLocalizations implements CupertinoLocalizations {
  final _materialDelegate = GlobalMaterialLocalizations.delegate;

  MaterialLocalizations materialLocalizations;

  static const LocalizationsDelegate<CupertinoLocalizations> delegate =
      _JapaneseDelegate();

  static Future<CupertinoLocalizations> load(Locale locale) async {
    var localizations = JapaneseCupertinoLocalizations();
    await localizations._init();
    return SynchronousFuture<CupertinoLocalizations>(localizations);
  }

  Future _init() async {
    materialLocalizations = await _materialDelegate.load(const Locale('ja'));
  }

  @override
  String get alertDialogLabel => materialLocalizations.alertDialogLabel;

  @override
  String get anteMeridiemAbbreviation =>
      materialLocalizations.anteMeridiemAbbreviation;

  @override
  String get copyButtonLabel => materialLocalizations.copyButtonLabel;

  @override
  String get cutButtonLabel => materialLocalizations.cutButtonLabel;

  @override
  DatePickerDateOrder get datePickerDateOrder => DatePickerDateOrder.mdy;

  @override
  DatePickerDateTimeOrder get datePickerDateTimeOrder =>
      DatePickerDateTimeOrder.date_time_dayPeriod;

  @override
  String datePickerDayOfMonth(int dayIndex) => dayIndex.toString();

  @override
  String datePickerHour(int hour) => hour.toString().padLeft(2, "0");

  @override
  String datePickerHourSemanticsLabel(int hour) => "$hour時";

  @override
  String datePickerMediumDate(DateTime date) =>
      materialLocalizations.formatMediumDate(date);

  @override
  String datePickerMinute(int minute) => minute.toString().padLeft(2, '0');

  @override
  String datePickerMinuteSemanticsLabel(int minute) => "$minute分";

  @override
  String datePickerMonth(int monthIndex) => "$monthIndex";

  @override
  String datePickerYear(int yearIndex) => yearIndex.toString();

  @override
  String get pasteButtonLabel => materialLocalizations.pasteButtonLabel;

  @override
  String get postMeridiemAbbreviation =>
      materialLocalizations.postMeridiemAbbreviation;

  @override
  String get selectAllButtonLabel => materialLocalizations.selectAllButtonLabel;

  @override
  String timerPickerHour(int hour) => hour.toString().padLeft(2, "0");

  @override
  String timerPickerHourLabel(int hour) =>
      "${hour.toString().padLeft(2, '0')}時";

  @override
  String timerPickerMinute(int minute) => minute.toString().padLeft(2, "0");

  @override
  String timerPickerMinuteLabel(int minute) =>
      "${minute.toString().padLeft(2, '0')}分";

  @override
  String timerPickerSecond(int second) => second.toString().padLeft(2, "0");

  @override
  String timerPickerSecondLabel(int second) =>
      "${second.toString().padLeft(2, '0')}秒";

  @override
  String get modalBarrierDismissLabel => '解除';

  @override
  String tabSemanticsLabel({int tabIndex, int tabCount}) {
    return 'タブ$tabCountの内$tabIndex';
  }

  @override
  String get todayLabel => '今日';
}

class _JapaneseDelegate extends LocalizationsDelegate<CupertinoLocalizations> {
  const _JapaneseDelegate();

  @override
  bool isSupported(Locale locale) {
    return locale.languageCode == 'ja';
  }

  @override
  Future<CupertinoLocalizations> load(Locale locale) {
    return JapaneseCupertinoLocalizations.load(locale);
  }

  @override
  bool shouldReload(LocalizationsDelegate<CupertinoLocalizations> old) {
    return false;
  }
}
