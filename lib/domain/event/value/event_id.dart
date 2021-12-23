import 'package:meta/meta.dart';

@immutable
class EventId {
  final String value;

  EventId(this.value) {
//    if (value == null || value.isEmpty) {
//      throw NullEmptyException(code: ExceptionCode.eventId);
//    }
  }

  @override
  bool operator ==(Object other) =>
      identical(other, this) || (other is EventId && other.value == value);

  @override
  int get hashCode => runtimeType.hashCode ^ value.hashCode;
}
