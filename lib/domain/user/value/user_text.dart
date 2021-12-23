import 'package:flutter/cupertino.dart';
import 'package:kokuchi_event/common/exception.dart';

@immutable
class UserText {
  final String value;

  UserText(this.value) {
    if (value != null && value.isNotEmpty && value.characters.length > 100) {
      throw LengthException(code: ExceptionCode.userText, max: 100);
    }
  }

  @override
  bool operator ==(Object other) =>
      (identical(other, this) || other is UserText && other.value == value);

  @override
  int get hashCode => runtimeType.hashCode ^ value.hashCode;
}
