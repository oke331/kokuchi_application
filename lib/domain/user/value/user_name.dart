import 'package:flutter/material.dart';
import 'package:kokuchi_event/common/exception.dart';

@immutable
class UserName {
  final String value;

  UserName(this.value) {
    if (value == null || value.isEmpty) {
      throw NullEmptyException(code: ExceptionCode.userName);
    }

    if (value.characters.length > 20) {
      throw LengthException(code: ExceptionCode.userName, max: 20);
    }
  }

  @override
  bool operator ==(Object other) =>
      (identical(other, this) || (other is UserName) && other.value == value);

  @override
  int get hashCode => runtimeType.hashCode ^ value.hashCode;
}
