import 'package:flutter/material.dart';
import 'package:kokuchi_event/common/exception.dart';

@immutable
class EventDate {
  final DateTime start;
  final DateTime end;

  EventDate(this.start, this.end) {
    if (start == null) {
      throw NullEmptyException(code: ExceptionCode.eventTitle);
    }
    if (end == null) {
      throw NullEmptyException(code: ExceptionCode.eventTitle);
    }

    if (!start.isBefore(end)) {
      throw DateException();
    }
  }

  @override
  bool operator ==(Object other) => (identical(other, this) ||
      (other is EventDate) && other.start == start && other.end == end);

  @override
  int get hashCode => runtimeType.hashCode ^ start.hashCode;
}
