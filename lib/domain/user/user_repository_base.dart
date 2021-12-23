import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:kokuchi_event/domain/user/user.dart';
import 'package:kokuchi_event/domain/user/user_field.dart';
import 'package:kokuchi_event/domain/user/value/user_id.dart';

export 'package:kokuchi_event/domain/user/user.dart';

abstract class UserRepositoryBase {
  Future<User> findById(UserId id);
  Future<List<User>> getUserListByMap(Map<UserField, dynamic> searchMap);
  Future<void> save(User user);
  Future<void> saveTutorial(User user);
  Future<void> saveCancelMember(User user);
  Future<void> remove(UserId id);
  Future<String> uploadImage(UserId id, File file);
  Future<void> deleteImage(String imageUrl);
  Future<BlockUserFetch> fetchBlockUsers({@required UserId myId});
  Future<BlockUserFetch> fetchIsBlockedUsers({@required UserId myId});
  Future<void> addBlockUser({@required UserId myId, @required UserId otherId});
  Future<void> deleteBlockUser(
      {@required UserId userId, @required UserId otherId});
}

class BlockUserFetch {
  BlockUserFetch({this.users, this.startAfter});

  final List<User> users;
  final DateTime startAfter;
}
