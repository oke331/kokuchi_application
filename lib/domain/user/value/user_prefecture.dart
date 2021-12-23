import 'package:flutter/cupertino.dart';
import 'package:kokuchi_event/common/exception.dart';
import 'package:kokuchi_event/common/prefecture_data.dart';

@immutable
class UserPrefecture {
  final String value;

  UserPrefecture(this.value) {
    if (!prefectureData.contains(value)) {
      throw ContainException(code: ExceptionCode.userPrefecture);
    }
  }

  @override
  bool operator ==(Object other) => (identical(other, value) ||
      (other is UserPrefecture) && other.value == value);

  @override
  int get hashCode => runtimeType.hashCode ^ value.hashCode;
}
