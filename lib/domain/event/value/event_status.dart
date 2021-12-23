import 'package:flutter/cupertino.dart';
import 'package:kokuchi_event/common/exception.dart';

@immutable
class EventStatus {
  EventStatus(this.value) {
    if (value == null || value.isEmpty) {
      throw NullEmptyException(code: ExceptionCode.eventStatus);
    }
  }

  final String value;

  @override
  bool operator ==(Object other) => (identical(other, value) ||
      (other is EventStatus) && other.value == value);

  @override
  int get hashCode => runtimeType.hashCode ^ value.hashCode;
}
