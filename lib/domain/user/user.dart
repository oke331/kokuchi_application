import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:kokuchi_event/domain/user/user_field.dart';
import 'package:kokuchi_event/domain/user/value/user_icon_url.dart';
import 'package:kokuchi_event/domain/user/value/user_id.dart';
import 'package:kokuchi_event/domain/user/value/user_name.dart';
import 'package:kokuchi_event/domain/user/value/user_prefecture.dart';
import 'package:kokuchi_event/domain/user/value/user_prefecture_status.dart';
import 'package:kokuchi_event/domain/user/value/user_status.dart';
import 'package:kokuchi_event/domain/user/value/user_text.dart';
import 'package:kokuchi_event/presentation/notifier/user/user/user_state.dart';

class User {
  User({
    @required UserId id,
    @required UserName name,
    UserText text,
    UserIconUrl iconUrl,
    UserPrefecture prefecture,
    UserPrefectureStatus prefectureStatus,
//    List<UserFollowCategory> followCategories,
    UserStatus status,
    DateTime createdAt,
    DateTime updatedAt,
  })  : this.id = id,
        _name = name,
        _text = text,
        _iconUrl = iconUrl,
        _prefecture = prefecture,
        _prefectureStatus = prefectureStatus,
//        _followCategories = followCategories,
        _status = status,
        _createdAt = createdAt,
        _updatedAt = updatedAt;

  UserId id;
  UserName _name;
  UserText _text;
  UserIconUrl _iconUrl;
  UserPrefecture _prefecture;
  UserPrefectureStatus _prefectureStatus;
  UserStatus _status;
//  List<UserFollowCategory> _followCategories;
  DateTime _createdAt;
  DateTime _updatedAt;

  UserName get name => _name;
  UserText get text => _text;
  UserIconUrl get iconUrl => _iconUrl;
  UserPrefecture get preference => _prefecture;
  UserPrefectureStatus get prefectureStatus => _prefectureStatus;
//  List<UserFollowCategory> get followCategories => _followCategories;
  UserStatus get status => _status;
  DateTime get createdAt => _createdAt;
  DateTime get updateAt => _updatedAt;

  // FirestoreのMapからインスタンス化
  User.fromMap(
      {@required String documentId, @required Map<String, dynamic> map}) {
    id = UserId(documentId);
    _name = map[UserField.name] != null
        ? UserName(map[UserField.name].toString())
        : null;
    _text = map[UserField.text] != null
        ? UserText(map[UserField.text].toString())
        : null;
    _iconUrl = map[UserField.iconUrl] != null
        ? UserIconUrl(map[UserField.iconUrl].toString())
        : null;
    _prefecture = map[UserField.prefecture] != null
        ? UserPrefecture(map[UserField.prefecture].toString())
        : null;
    _prefectureStatus = map[UserField.prefectureStatus] != null
        ? UserPrefectureStatus(map[UserField.prefectureStatus] as bool)
        : null;
    _status = map[UserField.status] != null
        ? UserStatus(map[UserField.status] as String)
        : null;

    final originFollowCategories = map[UserField.followCategories] != null
        ? map[UserField.followCategories] as List<dynamic>
        : null;

//    _followCategories = originFollowCategories
//        ?.map((dynamic e) => UserFollowCategory(e.toString()))
//        ?.toList();

//    final originReports = map[UserField.reportCount] != null
//        ? map[UserField.reportCount] as int
//        : null;

    // DartのDateに変換
    final originCreatedAt = map[UserField.createdAt] != null
        ? map[UserField.createdAt] as Timestamp
        : null;

    if (originCreatedAt is Timestamp) {
      _createdAt = originCreatedAt.toDate();
    }

    // DartのDateに変換
    final originUpdatedAt = map[UserField.updatedAt] != null
        ? map[UserField.updatedAt] as Timestamp
        : null;

    if (originUpdatedAt is Timestamp) {
      _updatedAt = originUpdatedAt.toDate();
    }
  }

  // Firestore用のMapに変換
  Map<String, dynamic> toMapAndAddCreateTimeStamp() {
    return <String, dynamic>{
      UserField.id: id.value,
      UserField.name: _name.value,
      UserField.iconUrl: _iconUrl.value,
      UserField.prefecture: _prefecture.value,
      UserField.prefectureStatus: _prefectureStatus.value,
      UserField.status: _status.value,
      UserField.text: _text.value,
//      if (_followCategories != null)
//        UserField.followCategories:
//            _followCategories.map((e) => e?.value).toList(),
      UserField.createdAt: FieldValue.serverTimestamp(),
      UserField.updatedAt: FieldValue.serverTimestamp(),
      UserField.reportCount: 0,
    };
  }

  Map<String, dynamic> toMapAndAddUpdateTimeStamp() {
    return <String, dynamic>{
      UserField.id: id.value,
      UserField.name: _name.value,
      UserField.iconUrl: _iconUrl.value,
      UserField.prefecture: _prefecture.value,
      UserField.prefectureStatus: _prefectureStatus.value,
//      UserField.status: _status.value,
      UserField.text: _text.value,
//      if (_followCategories != null)
//        UserField.followCategories:
//            _followCategories.map((e) => e?.value).toList(),
      UserField.updatedAt: FieldValue.serverTimestamp(),
    };
  }

  Map<String, dynamic> toMapAndAddDeleteTimeStamp() {
    return <String, dynamic>{
      UserField.id: id.value,
      UserField.name: _name.value,
      UserField.iconUrl: _iconUrl.value,
      UserField.prefecture: _prefecture.value,
      UserField.prefectureStatus: _prefectureStatus.value,
      UserField.status: _status.value,
      UserField.text: _text.value,
//      if (_followCategories != null)
//        UserField.followCategories:
//            _followCategories.map((e) => e?.value).toList(),
      UserField.updatedAt: FieldValue.serverTimestamp(),
    };
  }

  // アカウント退会の時使用
  User.fromUserState(UserState userState) {
    id = UserId(userState.id);
    _name = UserName('退会済みユーザー');
    _iconUrl = UserIconUrl(null);
    _prefecture = UserPrefecture('東京都');
    _prefectureStatus = UserPrefectureStatus(false);
    _status = UserStatus('delete');
    _text = UserText('');
  }

  void changeName(UserName newName) {
    _name = newName;
  }

  void changeText(UserText newText) {
    _text = newText;
  }

  void changeiconUrl(UserIconUrl newIconUrl) {
    _iconUrl = newIconUrl;
  }

  void changePreference(UserPrefecture newPrefecture) {
    _prefecture = newPrefecture;
  }

  void changePrefectureStatus(UserPrefectureStatus newPrefectureStatus) {
    _prefectureStatus = newPrefectureStatus;
  }

//  void changeFollowCategories(List<UserFollowCategory> newFollowCategories) {
//    _followCategories = newFollowCategories;
//  }

  void changeStatus(UserStatus status) {
    _status = status;
  }
}
