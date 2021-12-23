import 'package:flutter/cupertino.dart';
import 'package:kokuchi_event/common/exception.dart';

@immutable
class EventJoinUrl {
  final String value;

  EventJoinUrl(this.value) {
    if (value != null &&
        value.isNotEmpty &&
        !RegExp(r"^https?://[\w!\?/\+\-_~=;\.,\*&@#\$%\(\)'\[\]]+$")
            .hasMatch(value)) {
      throw StringException(code: ExceptionCode.eventJoinUrl);
    }
  }

  @override
  bool operator ==(Object other) => (identical(other, value) ||
      (other is EventJoinUrl) && other.value == value);

  @override
  int get hashCode => runtimeType.hashCode ^ value.hashCode;
}
