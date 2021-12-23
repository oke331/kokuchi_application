import 'package:characters/characters.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:kokuchi_event/main.dart';

class Validate {
  ///
  ///  User
  ///
  static String userName(String val) {
    if (val == null || val.isEmpty) {
      return '　※必須入力です';
    }
    if (val.characters.length > 20) {
      return '　※20文字以内で入力してください';
    }
    return null;
  }

  static String userText(String val) {
    if (val != null && val.characters.length > 100) {
      return '　※100文字以内で入力してください';
    }
    return null;
  }

  ///
  ///  Event
  ///
  static String eventTitle(String val) {
    if (val == null || val.isEmpty) {
      return ' ※必須入力です';
    }

    if (val.characters.length > 30) {
      return ' ※30文字以内で入力してください';
    }

    return null;
  }

  static String eventText(String val) {
    if (val != null && val.characters.length > 500) {
      return ' ※500文字以内で入力してください';
    }
    return null;
  }

  static String eventStartDate(DateTime val) {
    if (val == null) {
      return ' ※必須入力です';
    }

    return null;
  }

  static String eventEndDate(DateTime val) {
    if (val == null) {
      return ' ※必須入力です';
    }

    return null;
  }

  static String eventVenue(String val) {
    if (val == null || val.isEmpty) {
      return ' ※必須入力です';
    }
    if (val.characters.length > 100) {
      return ' ※100文字以内で入力してください';
    }
    return null;
  }

  static String eventTool(String val) {
    if (val != null && val.characters.length > 50) {
      return ' ※50文字以内で入力してください';
    }
    return null;
  }

  static String eventJoinUrl(String val) {
    try {
      if (val != null &&
          val.isNotEmpty &&
          !RegExp(r"^https?://[\w!\?/\+\-_~=;\.,\*&@#\$%\(\)'\[\]]+$")
              .hasMatch(val)) {
        return ' ※URLを入力してください';
      }
    } on Exception catch (e, s) {
      logger.d(e.toString());
      FirebaseCrashlytics.instance.recordError(e, s);
    }

    if (val != null && val.characters.length > 10000) {
      return ' ※10000文字以内で入力してください';
    }
    return null;
  }

  static String eventOfficialPageUrl(String val) {
    try {
      if (val != null &&
          val.isNotEmpty &&
          !RegExp(r"^https?://[\w!\?/\+\-_~=;\.,\*&@#\$%\(\)'\[\]]+$")
              .hasMatch(val)) {
        return ' ※URLを入力してください';
      }
    } on Exception catch (e, s) {
      logger.d(e.toString());
      FirebaseCrashlytics.instance.recordError(e, s);
    }

    if (val != null && val.characters.length > 10000) {
      return ' ※10000文字以内で入力してください';
    }
    return null;
  }

  static String eventEmail(String val) {
    if (val != null &&
        val.isNotEmpty &&
        !RegExp(r"^[a-zA-Z0-9.!#$%&'*+\/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$")
            .hasMatch(val)) {
      return ' ※メールアドレスを入力してください';
    }

    if (val != null && val.isNotEmpty && val.characters.length > 1000) {
      return ' ※1000文字以内で入力してください';
    }
    return null;
  }

  static String eventPhoneNumber(String val) {
    if (val != null && val.isNotEmpty && !RegExp(r'^[0-9]+$').hasMatch(val)) {
      return ' ※電話番号を入力してください';
    }
    if (val != null && val.characters.length > 15) {
      return ' ※15文字以内で入力してください';
    }
    return null;
  }
}
