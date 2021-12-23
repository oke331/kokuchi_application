import 'package:flutter/cupertino.dart';
import 'package:kokuchi_event/common/category_data.dart';
import 'package:kokuchi_event/common/exception.dart';

@immutable
class UserFollowCategory {
  final String value;

  UserFollowCategory(this.value) {
    if (!categoryData.contains(value)) {
      throw ContainException(code: ExceptionCode.userFollowCategory);
    }
  }

  @override
  bool operator ==(Object other) => (identical(other, value) ||
      (other is UserFollowCategory) && other.value == value);

  @override
  int get hashCode => runtimeType.hashCode ^ value.hashCode;
}
