import 'package:flutter/cupertino.dart';
import 'package:kokuchi_event/common/exception.dart';

@immutable
class EventText {
  final String value;

  EventText(this.value) {
    if (value != null && value.isNotEmpty && value.characters.length > 500) {
      throw LengthException(code: ExceptionCode.eventText, max: 500);
    }
  }

  @override
  bool operator ==(Object other) =>
      (identical(other, this) || other is EventText && other.value == value);

  @override
  int get hashCode => runtimeType.hashCode ^ value.hashCode;
}
