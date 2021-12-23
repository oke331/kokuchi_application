import 'package:flutter/cupertino.dart';
import 'package:kokuchi_event/common/exception.dart';

@immutable
class EventVenue {
  final String value;

  EventVenue(this.value) {
    if (value != null && value.isNotEmpty && value.characters.length > 100) {
      throw LengthException(code: ExceptionCode.eventVenue, max: 100);
    }
  }

  @override
  bool operator ==(Object other) => (identical(other, value) ||
      (other is EventVenue) && other.value == value);

  @override
  int get hashCode => runtimeType.hashCode ^ value.hashCode;
}
