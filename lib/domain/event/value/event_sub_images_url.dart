import 'package:flutter/cupertino.dart';
import 'package:kokuchi_event/common/exception.dart';

import 'event_sub_image_url.dart';

@immutable
class EventSubImagesUrl {
  EventSubImagesUrl(this.value) {
    if (value != null && value.length > 3) {
      throw ListLengthException(code: ExceptionCode.eventSubImage, max: 3);
    }
  }

  final List<EventSubImageUrl> value;

  @override
  bool operator ==(Object other) => (identical(other, value) ||
      (other is EventSubImagesUrl) && other.value == value);

  @override
  int get hashCode => runtimeType.hashCode ^ value.hashCode;
}
