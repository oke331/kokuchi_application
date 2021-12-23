import 'package:kokuchi_event/common/exception.dart';
import 'package:meta/meta.dart';

@immutable
class EventReportContent {
  final String value;

  EventReportContent(this.value) {
    if (value == null || value.isEmpty) {
      throw NullEmptyException(code: ExceptionCode.userId);
    }
  }

  @override
  bool operator ==(Object other) =>
      identical(other, this) ||
      (other is EventReportContent && other.value == value);

  @override
  int get hashCode => runtimeType.hashCode ^ value.hashCode;
}
