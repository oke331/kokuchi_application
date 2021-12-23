import 'package:flutter/cupertino.dart';
import 'package:kokuchi_event/common/exception.dart';
import 'package:meta/meta.dart';

@immutable
class EventEmail {
  final String value;

  EventEmail(this.value) {
    if (value != null &&
        value.isNotEmpty &&
        !RegExp(r"^[a-zA-Z0-9.!#$%&'*+\/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$")
            .hasMatch(value)) {
      throw ContainException(code: ExceptionCode.eventEmail);
    }

    if (value != null && value.characters.length > 1000) {
      throw LengthException(code: ExceptionCode.eventEmail, max: 1000);
    }
  }

  @override
  bool operator ==(Object other) =>
      identical(other, this) || (other is EventEmail && other.value == value);

  @override
  int get hashCode => runtimeType.hashCode ^ value.hashCode;
}
