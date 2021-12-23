import 'package:flutter/cupertino.dart';
import 'package:kokuchi_event/domain/user/user_factory_base.dart';
import 'package:kokuchi_event/domain/user/value/user_icon_url.dart';
import 'package:kokuchi_event/domain/user/value/user_id.dart';
import 'package:kokuchi_event/domain/user/value/user_name.dart';
import 'package:kokuchi_event/domain/user/value/user_prefecture.dart';
import 'package:kokuchi_event/domain/user/value/user_prefecture_status.dart';
import 'package:kokuchi_event/domain/user/value/user_status.dart';
import 'package:kokuchi_event/domain/user/value/user_text.dart';

class UserFactory implements UserFactoryBase {
  const UserFactory();

  @override
  User create({
    @required UserId id,
    @required UserName name,
    @required UserText text,
    @required UserIconUrl iconUrl,
    @required UserPrefecture prefecture,
    @required UserPrefectureStatus prefectureStatus,
//    @required List<UserFollowCategory> followCategories,
    @required UserStatus status,
  }) {
    return User(
      id: id,
      name: name,
      text: text,
      iconUrl: iconUrl,
      prefecture: prefecture,
      prefectureStatus: prefectureStatus,
//      followCategories: followCategories,
      status: status,
    );
  }
}
