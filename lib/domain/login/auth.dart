import 'package:flutter/cupertino.dart';
import 'package:kokuchi_event/common/exception.dart';

@immutable
class Auth {
  Auth({@required this.id}) {
    if (id == null || id.isEmpty) {
      throw NullEmptyException(code: ExceptionCode.auth);
    }
  }

  final String id;

  @override
  bool operator ==(Object other) =>
      (identical(other, this) || other is Auth && other.id == id);

  @override
  int get hashCode => runtimeType.hashCode ^ id.hashCode;
}
