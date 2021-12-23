import 'package:flutter/cupertino.dart';
import 'package:kokuchi_event/common/string.dart';

class GenericException implements Exception {
  GenericException(
      {this.code = ExceptionCode.unknown,
      this.code2 = ExceptionCode.unknown,
      this.info});

  final ExceptionCode code;
  final ExceptionCode code2;
  final dynamic info;

  @override
  String toString() {
    return '$runtimeType: ${code.value}';
  }

  String get message {
    switch (runtimeType) {
      case NotFoundException:
        return '${code.value}: $info\nが見つかりません';
      case NotUniqueException:
        return '${code.value}: $info\nは既に存在しています';
      case NullEmptyException:
        return '${code.value}\nは必須です';
      case TwoNullEmptyException:
        return '${code.value}と${code2.value}\nは必須です';
      case LengthException:
        return '${code.value}は$info文字以内で入力してください';
      case ListLengthException:
        return '${code.value}は$infoつ以内まで登録できます';
      case ContainException:
        return '${code.value}で正しくない文字が入力されました';
      case NoAuthException:
        return '認証に失敗しました';
      case AuthCancelException:
        return 'キャンセルしました';
      case DBConnectionException:
        return 'データベースにてエラーが発生しました';
      case StringException:
        return '${code.value}に誤りがあります';
      case FileUploadException:
        return 'ファイルアップロード中にエラーが発生しました';
      case DateException:
        return '日時が正しくありません';
      case NumberException:
        return '${code.value}は数値を入力してください';
      case InternetException:
        return CommonString.noNetworkError;
      default:
        return 'Unknown error occurred.';
    }
  }
}

class NotFoundException extends GenericException {
  NotFoundException({@required ExceptionCode code, @required String target})
      : assert(code != null),
        assert(target != null && target.isNotEmpty),
        super(code: code, info: target);
}

class NotUniqueException extends GenericException {
  NotUniqueException({@required ExceptionCode code, @required String value})
      : assert(code != null),
        assert(value != null && value.isNotEmpty),
        super(code: code, info: value);
}

class NullEmptyException extends GenericException {
  NullEmptyException({@required ExceptionCode code})
      : assert(code != null),
        super(code: code);
}

class TwoNullEmptyException extends GenericException {
  TwoNullEmptyException(
      {@required ExceptionCode code, @required ExceptionCode code2})
      : assert(code != null, code2 != null),
        super(code: code, code2: code2);
}

class LengthException extends GenericException {
  LengthException({@required ExceptionCode code, @required int max})
      : assert(code != null),
        assert(max != null && max > 0),
        super(code: code, info: max);
}

class ListLengthException extends GenericException {
  ListLengthException({@required ExceptionCode code, @required int max})
      : assert(code != null),
        assert(max != null && max > 0),
        super(code: code, info: max);
}

class ContainException extends GenericException {
  ContainException({@required ExceptionCode code})
      : assert(code != null),
        super(code: code);
}

class NoAuthException extends GenericException {
  NoAuthException() : super();
}

class AuthCancelException extends GenericException {
  AuthCancelException() : super();
}

class DBConnectionException extends GenericException {
  DBConnectionException() : super();
}

class StringException extends GenericException {
  StringException({@required ExceptionCode code})
      : assert(code != null),
        super(code: code);
}

class FileUploadException extends GenericException {
  FileUploadException() : super();
}

class DateException extends GenericException {
  DateException() : super();
}

class NumberException extends GenericException {
  NumberException({@required ExceptionCode code})
      : assert(code != null),
        super(code: code);
}

class InternetException extends GenericException {
  InternetException() : super();
}

enum ExceptionCode {
  unknown,
  user,
  userId,
  userName,
  userText,
  userPrefecture,
  userFollowCategory,
  userIconUrl,
  userPrefectureStatus,
  userStatus,
  auth,
  eventId,
  eventTitle,
  eventVenue,
  eventText,
  eventStartDate,
  eventEndDate,
  eventSubImage,
  eventMainImage,
  eventOffcialPageUrl,
  eventCategory,
  eventStatus,
  eventJoinUrl,
  eventOnline,
  eventTool,
  eventPhoneNumber,
  eventEmail,
}

extension ExceptionCodeValue on ExceptionCode {
  String get value {
    switch (this) {
      case ExceptionCode.user:
        return 'ユーザー';
      case ExceptionCode.userId:
      case ExceptionCode.auth:
        return 'ユーザーID';
      case ExceptionCode.userName:
        return 'ユーザー名';
      case ExceptionCode.userText:
        return '自己紹介';
      case ExceptionCode.userPrefecture:
        return '地域';
      case ExceptionCode.userPrefectureStatus:
        return '地域公開状態';
      case ExceptionCode.userIconUrl:
        return 'アイコンURL';
      case ExceptionCode.userStatus:
        return 'ユーザーステータス';
      case ExceptionCode.eventCategory:
        return 'カテゴリー';
      case ExceptionCode.eventId:
        return 'イベントID';
      case ExceptionCode.eventStartDate:
        return '開催日時';
      case ExceptionCode.eventEndDate:
        return '終了日時';
      case ExceptionCode.eventText:
        return '内容';
      case ExceptionCode.eventTitle:
        return 'タイトル';
      case ExceptionCode.eventVenue:
        return '開催住所';
      case ExceptionCode.eventStatus:
        return 'イベントステータス';
      case ExceptionCode.eventSubImage:
        return 'サブ画像URL';
      case ExceptionCode.eventMainImage:
        return 'メイン画像URL';
      case ExceptionCode.eventOffcialPageUrl:
        return 'イベント公式ページ URL';
      case ExceptionCode.eventTool:
        return 'ツール';
      case ExceptionCode.eventJoinUrl:
        return '参加URL';
      case ExceptionCode.eventOnline:
        return 'オンライン';
      case ExceptionCode.eventPhoneNumber:
        return '電話番号';
      case ExceptionCode.eventEmail:
        return 'メールアドレス';

      default:
        return 'Unknown';
    }
  }
}
