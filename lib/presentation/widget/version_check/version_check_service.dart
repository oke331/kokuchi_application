import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:kokuchi_event/main.dart';
import 'package:package_info/package_info.dart';

class VersionCheckService {
  static const CONFIG_NAME = 'force_update_app_version';

  /// バージョンチェック関数
  Future<bool> versionCheck() async {
    // versionCode(buildNumber)取得
    final info = await PackageInfo.fromPlatform();
    final currentVersion = int.parse(info.buildNumber);

    // remote config
    final remoteConfig = await RemoteConfig.instance;

    try {
      // 常にサーバーから取得するようにするため期限を最小限にセット
      await remoteConfig.fetch(expiration: const Duration(seconds: 0));
      await remoteConfig.activateFetched();
      final newVersion = remoteConfig.getInt(CONFIG_NAME);
      if (newVersion > currentVersion) {
        return true;
      }
    } on FetchThrottledException catch (exception) {
      // Fetch throttled.
      logger.d(exception);
    } on Exception catch (e, s) {
      logger
          .d('Unable to fetch remote config. Cached or default values will be '
              'used:$e');
      await FirebaseCrashlytics.instance.recordError(e, s);
    }
    return false;
  }
}
