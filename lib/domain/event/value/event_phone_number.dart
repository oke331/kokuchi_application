import 'package:characters/characters.dart';
import 'package:kokuchi_event/common/exception.dart';
import 'package:meta/meta.dart';

@immutable
class EventPhoneNumber {
  final String value;

  EventPhoneNumber(this.value) {
    if (value != null &&
        value.isNotEmpty &&
        !RegExp(r'^[0-9]+$').hasMatch(value)) {
      throw NumberException(code: ExceptionCode.eventPhoneNumber);
    }

    if (value != null && value.isNotEmpty && value.characters.length > 15) {
      throw LengthException(code: ExceptionCode.eventPhoneNumber, max: 15);
    }
  }

  @override
  bool operator ==(Object other) =>
      identical(other, this) ||
      (other is EventPhoneNumber && other.value == value);

  @override
  int get hashCode => runtimeType.hashCode ^ value.hashCode;
}
