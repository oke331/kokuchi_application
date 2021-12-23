import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:kokuchi_event/application/dto/user_dto.dart';
import 'package:kokuchi_event/domain/user/user_factory_base.dart';
import 'package:kokuchi_event/domain/user/user_repository_base.dart';
import 'package:kokuchi_event/domain/user/value/user_icon_url.dart';
import 'package:kokuchi_event/domain/user/value/user_id.dart';
import 'package:kokuchi_event/domain/user/value/user_name.dart';
import 'package:kokuchi_event/domain/user/value/user_prefecture.dart';
import 'package:kokuchi_event/domain/user/value/user_prefecture_status.dart';
import 'package:kokuchi_event/domain/user/value/user_status.dart';
import 'package:kokuchi_event/domain/user/value/user_text.dart';
import 'package:kokuchi_event/domain/user_report/user_report_factory_base.dart';

class UserAppService {
  UserAppService({
    @required UserFactoryBase factory,
    @required UserRepositoryBase repository,
  })  : _factory = factory,
        _repository = repository;

  final UserFactoryBase _factory;
  final UserRepositoryBase _repository;

  Future<UserDto> findById({@required String id}) async {
    final user = await _repository.findById(UserId(id));
    return UserDto(user);
  }

  Future<void> save(
      {@required bool tutorial,
      @required String id,
      @required String name,
      @required String prefecture,
      @required bool prefectureStatus,
      @required File iconFile,
      @required String status,
      String beforeIconUrl,
      @required bool trashBeforeIconUrl,
      String text}) async {
    User user;

    if (iconFile == null) {
      String uploadUrl;
      if (trashBeforeIconUrl) {
        if (beforeIconUrl != null && beforeIconUrl.isNotEmpty) {
          await _repository.deleteImage(beforeIconUrl);
        }

        uploadUrl = null;
      } else if (trashBeforeIconUrl) {
        uploadUrl = null;
      } else {
        uploadUrl = beforeIconUrl;
      }
      user = _factory.create(
        id: UserId(id),
        name: UserName(name),
        iconUrl: UserIconUrl(uploadUrl),
        prefecture: UserPrefecture(prefecture),
        prefectureStatus: UserPrefectureStatus(prefectureStatus),
        text: UserText(text),
//        followCategories: [],
        status: UserStatus(status),
      );
    } else {
      final uploadIconUrl = await _repository.uploadImage(UserId(id), iconFile);
      if (beforeIconUrl != null && beforeIconUrl != '') {
        await _repository.deleteImage(beforeIconUrl);
      }

      user = _factory.create(
        id: UserId(id),
        name: UserName(name),
        iconUrl: UserIconUrl(uploadIconUrl),
        prefecture: UserPrefecture(prefecture),
        prefectureStatus: UserPrefectureStatus(prefectureStatus),
        text: UserText(text),
//        followCategories: [],
        status: UserStatus(status),
      );
    }

    if (tutorial != null && tutorial) {
      await _repository.saveTutorial(user);
    } else {
      await _repository.save(user);
    }
  }

  Future<void> addBlockUser(
      {@required String myId, @required String otherId}) async {
    await _repository.addBlockUser(
        myId: UserId(myId), otherId: UserId(otherId));
  }

  Future<void> deleteBlockUser(
      {@required String myId, @required String otherId}) async {
    await _repository.deleteBlockUser(
        userId: UserId(myId), otherId: UserId(otherId));
  }

  Future<List<UserDto>> fetchBlockUsers({
    @required String myId,
  }) async {
    final blockUserFetch =
        await _repository.fetchBlockUsers(myId: UserId(myId));

    final userDtos = blockUserFetch?.users?.map((e) => UserDto(e))?.toList();

    return userDtos;
  }

  Future<List<UserDto>> fetchIsBlockedUsers({
    @required String myId,
  }) async {
    final blockUserFetch =
        await _repository.fetchIsBlockedUsers(myId: UserId(myId));

    final userDtos = blockUserFetch?.users?.map((e) => UserDto(e))?.toList();

    return userDtos;
  }
}

class BlockUserDtoFetch {
  BlockUserDtoFetch({this.userDtos, this.startAfter});

  final List<UserDto> userDtos;
  final DateTime startAfter;
}
