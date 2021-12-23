import 'package:kokuchi_event/domain/user/user.dart';

class UserDto {
  UserDto(User source)
      : id = source.id.value,
        name = source.name.value,
        text = source.text?.value,
        iconUrl = source.iconUrl?.value,
        prefecture = source.preference.value,
        prefectureStatus = source.prefectureStatus.value,
//        followCategories =
//            source.followCategories?.map((e) => e.value)?.toList(),
        status = source.status.value,
        createdAt = source.createdAt,
        updatedAt = source.updateAt;

  final String id;
  final String name;
  final String iconUrl;
  final String text;
  final String prefecture;
  final bool prefectureStatus;
//  final List<String> followCategories;
  final String status;
  final DateTime createdAt;
  final DateTime updatedAt;
}
