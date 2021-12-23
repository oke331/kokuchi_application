import 'dart:io';

import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:kokuchi_event/main.dart';

class NetworkCheck {
  static Future<bool> isConnect() async {
    try {
      final result = await InternetAddress.lookup('google.com')
          .timeout(const Duration(seconds: 8));
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return true;
      }
      return false;
    } on SocketException catch (e, s) {
      return false;
    } on Exception catch (e, s) {
      await FirebaseCrashlytics.instance.recordError(e, s);
      logger.d(e.toString());
      return false;
    }
  }
}
