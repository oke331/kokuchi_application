import 'package:flutter/cupertino.dart';
import 'package:kokuchi_event/common/exception.dart';

@immutable
class EventOnline {
  final bool value;

  EventOnline(this.value) {
    if (value == null) {
      throw NullEmptyException(code: ExceptionCode.eventOnline);
    }
  }

  @override
  bool operator ==(Object other) =>
      (identical(other, this) || other is EventOnline && other.value == value);

  @override
  int get hashCode => runtimeType.hashCode ^ value.hashCode;
}
