import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:kokuchi_event/domain/user/user.dart';
import 'package:kokuchi_event/domain/user/value/user_icon_url.dart';
import 'package:kokuchi_event/domain/user/value/user_id.dart';
import 'package:kokuchi_event/domain/user/value/user_name.dart';
import 'package:kokuchi_event/domain/user/value/user_prefecture.dart';
import 'package:kokuchi_event/domain/user/value/user_prefecture_status.dart';
import 'package:kokuchi_event/domain/user/value/user_status.dart';
import 'package:kokuchi_event/domain/user/value/user_text.dart';

export 'package:kokuchi_event/domain/user/user.dart';

abstract class UserFactoryBase {
  User create({
    @required UserId id,
    @required UserName name,
    @required UserText text,
    @required UserIconUrl iconUrl,
    @required UserPrefecture prefecture,
    @required UserPrefectureStatus prefectureStatus,
//    @required List<UserFollowCategory> followCategories,
    @required UserStatus status,
  });
}
