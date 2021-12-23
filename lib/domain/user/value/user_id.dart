import 'package:kokuchi_event/common/exception.dart';
import 'package:meta/meta.dart';

@immutable
class UserId {
  final String value;

  UserId(this.value) {
    if (value == null || value.isEmpty) {
      throw NullEmptyException(code: ExceptionCode.userId);
    }
  }

  @override
  bool operator ==(Object other) =>
      identical(other, this) || (other is UserId && other.value == value);

  @override
  int get hashCode => runtimeType.hashCode ^ value.hashCode;
}
