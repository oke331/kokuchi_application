import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class LetsGoNotification {
  // 通知
  static FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
  static NotificationDetails platformChannelSpecifics;
  static const String androidChannelId = 'letsGoNotice';
  static const String androidChannelName = 'いきたいイベント開催通知';
  static const String androidChannelDescription =
      '「いきたい」に登録されたイベントが開催される前に通知をします。';
  static BuildContext _context;

  void init(BuildContext context, String userId) {
    _context = context;

    // プラグインのインスタンス作成
    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

    // Androidのアイコンのdrawingフォルダを設定、初期化
    const initializationSettingsAndroid =
        AndroidInitializationSettings('app_icon');

    // iOSの初期化、アプリがフォアグラウンドの時の通知受け取りを設定
    const initializationSettingsIOS = IOSInitializationSettings();

    // AndroidとiOSの設定を反映
    const initializationSettings = InitializationSettings(
        initializationSettingsAndroid, initializationSettingsIOS);

    // 設定を元に初期化、通知をタップされた時の動作指定
    flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: onSelectNotification);

    // Androidの通知の詳細設定
    final androidPlatformChannelSpecifics = AndroidNotificationDetails(
      userId + androidChannelId,
      androidChannelName,
      androidChannelDescription,
      importance: Importance.Max,
      priority: Priority.High,
      playSound: true,
      color: const Color(0xFF58BB73),
    );

    // iOSの通知の詳細設定
    const iOSPlatformChannelSpecifics = IOSNotificationDetails();

    // 通知の詳細設定を反映
    platformChannelSpecifics = NotificationDetails(
        androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);
  }

  // 通知をタップした時の動作
  Future onSelectNotification(String payload) async {
//    await Navigator.(
//    context,
//    );
  }

  // iOS10以下の時のみ有効のためコメントアウト　iOSでフォアグラウンドの時に通知がきた場合
//  Future onDidReceiveLocationLocation(
//      int id, String title, String body, String payload) async {
//    await showDialog<dynamic>(
//      context: _context,
//      builder: (BuildContext context) {
//        return AlertDialog(
//          title: Text(title),
//          content: Text(body),
//          actions: <Widget>[
//            FlatButton(
//              child: Text(payload),
//              onPressed: () {
//                Navigator.of(context).pop();
//              },
//            ),
//          ],
//        );
//      },
//    );
//  }
}
