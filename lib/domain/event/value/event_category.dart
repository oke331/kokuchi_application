import 'package:flutter/cupertino.dart';
import 'package:kokuchi_event/common/category_data.dart';
import 'package:kokuchi_event/common/exception.dart';

@immutable
class EventCategory {
  final String value;

  EventCategory(this.value) {
    if (!categoryData.contains(value)) {
      throw ContainException(code: ExceptionCode.eventCategory);
    }
  }

  @override
  bool operator ==(Object other) => (identical(other, value) ||
      (other is EventCategory) && other.value == value);

  @override
  int get hashCode => runtimeType.hashCode ^ value.hashCode;
}
