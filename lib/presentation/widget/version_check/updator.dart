import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:kokuchi_event/presentation/share/launch_url.dart';
import 'package:kokuchi_event/presentation/share/sns_share_dynamic_link.dart';
import 'package:kokuchi_event/presentation/widget/version_check/version_check_service.dart';
import 'package:kokuchi_event/run.dart';

/// 強制アップデートダイアログを出す為のダミーに近いStatefulWidget
class Updater extends StatefulWidget {
  const Updater({Key key}) : super(key: key);

  @override
  State<Updater> createState() => _UpdaterState();
}

class _UpdaterState extends State<Updater> {
  @override
  void initState() {
    final checker = getItLocator<VersionCheckService>();
    checker.versionCheck().then((needUpdate) {
      _showUpdateDialog(needUpdate);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const SizedBox.shrink();
  }

  // FIXME ストアにアプリを登録したらurlが入れられる
  static const APP_STORE_URL =
      'https://apps.apple.com/jp/app/$APP_STORE_ID?mt=8';

  // FIXME ストアにアプリを登録したらurlが入れられる
  static const PLAY_STORE_URL =
      'https://play.google.com/store/apps/details?id=$ANDROID_PACKAGE_NAME';

  /// 更新版案内ダイアログを表示
  void _showUpdateDialog(bool needUpdate) {
    if (!needUpdate) return;

    showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        const title = 'バージョン更新のお知らせ';
        const message = '新しいバージョンのアプリが利用可能です。ストアより更新版を入手して、ご利用下さい。';
        const btnLabel = '今すぐ更新';
        return Platform.isIOS
            ? WillPopScope(
                onWillPop: () async => false,
                child: CupertinoAlertDialog(
                  title: Text(title),
                  content: Text(message),
                  actions: <Widget>[
                    FlatButton(
                      child: const Text(
                        btnLabel,
                        style: TextStyle(color: Colors.red),
                      ),
                      onPressed: () => launchURL(APP_STORE_URL),
                    ),
                  ],
                ),
              )
            : WillPopScope(
                onWillPop: () async => false,
                child: AlertDialog(
                  title: const Text(title),
                  content: const Text(message),
                  actions: <Widget>[
                    FlatButton(
                      child: const Text(
                        btnLabel,
                        style: TextStyle(color: Colors.red),
                      ),
                      onPressed: () => launchURL(PLAY_STORE_URL),
                    ),
                  ],
                ),
              );
      },
    );
  }
}
