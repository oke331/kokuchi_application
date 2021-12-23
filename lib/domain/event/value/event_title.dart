import 'package:flutter/material.dart';
import 'package:kokuchi_event/common/exception.dart';

@immutable
class EventTitle {
  final String value;

  EventTitle(this.value) {
    if (value == null || value.isEmpty) {
      throw NullEmptyException(code: ExceptionCode.eventTitle);
    }

    if (value.characters.length > 30) {
      throw LengthException(code: ExceptionCode.eventTitle, max: 30);
    }
  }

  @override
  bool operator ==(Object other) =>
      (identical(other, this) || (other is EventTitle) && other.value == value);

  @override
  int get hashCode => runtimeType.hashCode ^ value.hashCode;
}
