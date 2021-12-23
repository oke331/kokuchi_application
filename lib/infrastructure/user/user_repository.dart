import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:kokuchi_event/common/exception.dart';
import 'package:kokuchi_event/common/user_status_situation.dart';
import 'package:kokuchi_event/domain/user/block_user_field.dart';
import 'package:kokuchi_event/domain/user/user_field.dart';
import 'package:kokuchi_event/domain/user/user_repository_base.dart';
import 'package:kokuchi_event/domain/user/value/user_follow_category.dart';
import 'package:kokuchi_event/domain/user/value/user_id.dart';

class UserRepository extends UserRepositoryBase {
  final _usersCollection = Firestore.instance.collection('users');
  final _blockUserCollection = 'blockUsers';
  final _isBlockedUserCollection = 'isBlockedUsers';

  @override
  Future<User> findById(UserId id) async {
    final user = await _usersCollection.document(id.value).get();
    if (!user.exists || user.data() == null || user.data().isEmpty) {
      throw NotFoundException(code: ExceptionCode.user, target: 'ID');
    }

    return User.fromMap(documentId: user.id, map: user.data());
  }

  @override
  Future<void> save(User user) async {
    await _usersCollection
        .document(user.id.value)
        .set(user.toMapAndAddUpdateTimeStamp(), SetOptions(merge: true));
  }

  @override
  Future<void> saveTutorial(User user) async {
    await _usersCollection
        .document(user.id.value)
        .setData(user.toMapAndAddCreateTimeStamp(), SetOptions(merge: true));
  }

  @override
  Future<void> saveCancelMember(User user) async {
    await _usersCollection
        .document(user.id.value)
        .setData(user.toMapAndAddDeleteTimeStamp(), SetOptions(merge: true));
  }

  @override
  Future<void> categoryChange(
      {@required String id,
      @required List<UserFollowCategory> categories}) async {
    await _usersCollection.document(id).update(<String, dynamic>{
      UserField.followCategories: categories.map((e) => e.value).toList()
    });
  }

  @override
  Future<void> remove(UserId id) async {
    await _usersCollection.document(id.value).delete();
  }

  @override
  Future<List<User>> getUserListByMap(Map<UserField, dynamic> searchMap) {
    try {
//      final users = _usersCollection.where()
    } on Exception catch (e, s) {}
  }

  @override
  Future<String> uploadImage(UserId id, File file) async {
    final timestamp = DateTime.now().millisecondsSinceEpoch;
    const subDirectoryName = 'icons';
    final ref = FirebaseStorage()
        .ref()
        .child('users')
        .child(id.value)
        .child(subDirectoryName)
        .child('$timestamp');
    final uploadTask = ref.putFile(file);
    final snapshot = await uploadTask.onComplete;
    if (snapshot.error == null) {
      final dynamic url = await snapshot.ref.getDownloadURL();
      return url.toString();
    } else {
      throw FileUploadException();
    }
  }

  @override
  Future<void> deleteImage(String imageUrl) async {
    final result = await FirebaseStorage.instance.getReferenceFromUrl(imageUrl);
    if (result != null) {
      await result.delete();
    }
  }

  @override
  Future<void> addBlockUser(
      {@required UserId myId, @required UserId otherId}) async {
    final otherRef = _usersCollection.document(otherId.value);
    final myRef = _usersCollection.document(myId.value);
    final createdAt = FieldValue.serverTimestamp();

    var batch = Firestore.instance.batch();

    // 自分のコレクションにブロックしたユーザーを追加
    batch.setData(
        _usersCollection
            .document(myId.value)
            .collection(_blockUserCollection)
            .document(otherId.value),
        <String, dynamic>{
          BlockUserField.userRef: otherRef,
          BlockUserField.createdAt: createdAt,
        });

    // 相手のコレクションに自分を追加
    batch.setData(
        _usersCollection
            .document(otherId.value)
            .collection(_isBlockedUserCollection)
            .document(myId.value),
        <String, dynamic>{
          BlockUserField.userRef: myRef,
          BlockUserField.createdAt: createdAt,
        });

    await batch.commit();
  }

  @override
  Future<void> deleteBlockUser(
      {@required UserId userId, @required UserId otherId}) async {
    final batch = Firestore.instance.batch();

    // 自分のコレクションから相手を削除
    batch.delete(_usersCollection
        .document(userId.value)
        .collection(_blockUserCollection)
        .document(otherId.value));

    // 相手のコレクションから自分を削除
    batch.delete(_usersCollection
        .document(otherId.value)
        .collection(_isBlockedUserCollection)
        .document(userId.value));

    await batch.commit();
  }

  @override
  Future<BlockUserFetch> fetchBlockUsers({
    @required UserId myId,
  }) async {
    var query = _usersCollection
        .document(myId.value)
        .collection(_blockUserCollection)
        .orderBy(BlockUserField.createdAt, descending: true);
    final blockUsers = await query.getDocuments();
    if (blockUsers != null && blockUsers.documents.isEmpty) {
      return null;
    }

    var orgUsers = await Future.wait(
        blockUsers.documents.map((e) async => _blockUserSideJoin(e)).toList());

    var users = List<User>.from(orgUsers);
    // statusがrejectのものを外す
    users.removeWhere((element) =>
        element.status.value == UserStatusSituation.reject ||
        element.status.value == UserStatusSituation.delete);

    final startAfterTimestamp = blockUsers.documents?.last
        ?.data()[BlockUserField.createdAt] as Timestamp;

    final startAfterDate = startAfterTimestamp?.toDate();

    return BlockUserFetch(users: users, startAfter: startAfterDate);
  }

  @override
  Future<BlockUserFetch> fetchIsBlockedUsers({UserId myId}) async {
    var query = _usersCollection
        .document(myId.value)
        .collection(_isBlockedUserCollection)
        .orderBy(BlockUserField.createdAt, descending: true);
    final blockUsers = await query.getDocuments();
    if (blockUsers != null && blockUsers.documents.isEmpty) {
      return null;
    }

    var orgUsers = await Future.wait(
        blockUsers.documents.map((e) async => _blockUserSideJoin(e)).toList());

    var users = List<User>.from(orgUsers);
    // statusがrejectのものを外す
    users.removeWhere((element) =>
        element.status.value == UserStatusSituation.reject ||
        element.status.value == UserStatusSituation.delete);

    final startAfterTimestamp = blockUsers.documents?.last
        ?.data()[BlockUserField.createdAt] as Timestamp;

    final startAfterDate = startAfterTimestamp?.toDate();

    return BlockUserFetch(users: users, startAfter: startAfterDate);
  }

  Future<User> _blockUserSideJoin(DocumentSnapshot e) async {
    final userRef = e.data()[BlockUserField.userRef] != null
        ? e.data()[BlockUserField.userRef] as DocumentReference
        : null;

    if (userRef != null) {
      final event = await Firestore.instance.document(userRef.path).get();
      if (event != null) {
        return User.fromMap(documentId: event.id, map: event.data());
      }
    }
    return null;
  }
}
