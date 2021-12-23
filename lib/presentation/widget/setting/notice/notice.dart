import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:kokuchi_event/presentation/notifier/setting/setting_state.dart';
import 'package:kokuchi_event/presentation/widget/setting/headline.dart';
import 'package:kokuchi_event/presentation/widget/setting/notice/notice_setting_on.dart';
import 'package:kokuchi_event/presentation/widget/setting/notice/notification_reminder.dart';
import 'package:notification_permissions/notification_permissions.dart';
import 'package:provider/provider.dart';

class SettingNotice extends StatelessWidget {
  const SettingNotice();

  static const double radioSize = 11;

  @override
  Widget build(BuildContext context) {
    final settingNoticeState =
        context.select((SettingState value) => value.settingNoticeState);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const SettingHeadline(text: '通知設定'),
        if (settingNoticeState != PermissionStatus.granted)
          const SizedBox(height: 5),
        if (settingNoticeState != PermissionStatus.granted)
          const SettingNoticeSettingON(),
        const SizedBox(height: 20),
        const SettingNotificationReminder(),
      ],
    );
  }
}
