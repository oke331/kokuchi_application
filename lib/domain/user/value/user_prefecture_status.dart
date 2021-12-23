import 'package:flutter/cupertino.dart';
import 'package:kokuchi_event/common/exception.dart';

@immutable
class UserPrefectureStatus {
  UserPrefectureStatus(this.value) {
    if (value == null) {
      throw NullEmptyException(code: ExceptionCode.userPrefectureStatus);
    }
  }

  final bool value;

  @override
  bool operator ==(Object other) => (identical(other, value) ||
      (other is UserPrefectureStatus) && other.value == value);

  @override
  int get hashCode => runtimeType.hashCode ^ value.hashCode;
}
