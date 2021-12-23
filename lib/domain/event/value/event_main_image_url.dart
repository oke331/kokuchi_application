import 'package:flutter/cupertino.dart';
import 'package:kokuchi_event/common/exception.dart';

@immutable
class EventMainImageUrl {
  EventMainImageUrl(this.value) {
    if (value != null &&
        value.isNotEmpty &&
        !RegExp(r"^https?://[\w!\?/\+\-_~=;\.,\*&@#\$%\(\)'\[\]]+$")
            .hasMatch(value)) {
      throw StringException(code: ExceptionCode.eventMainImage);
    }
  }

  final String value;

  @override
  bool operator ==(Object other) => (identical(other, value) ||
      (other is EventMainImageUrl) && other.value == value);

  @override
  int get hashCode => runtimeType.hashCode ^ value.hashCode;
}
