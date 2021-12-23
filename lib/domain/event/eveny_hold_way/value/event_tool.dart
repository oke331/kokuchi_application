import 'package:flutter/cupertino.dart';
import 'package:kokuchi_event/common/exception.dart';

@immutable
class EventTool {
  final String value;

  EventTool(this.value) {
    if (value != null && value.isNotEmpty && value.characters.length > 50) {
      throw LengthException(code: ExceptionCode.eventTool, max: 50);
    }
  }

  @override
  bool operator ==(Object other) =>
      (identical(other, value) || (other is EventTool) && other.value == value);

  @override
  int get hashCode => runtimeType.hashCode ^ value.hashCode;
}
