import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:kokuchi_event/presentation/notifier/setting/setting_state.dart';
import 'package:notification_permissions/notification_permissions.dart';
import 'package:provider/provider.dart';

class SettingNoticeSettingON extends StatelessWidget {
  const SettingNoticeSettingON();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        InkWell(
          child: const Icon(
            Icons.refresh,
            size: 19,
            color: Colors.green,
          ),
          onTap: () => _onTap(context),
        ),
        const SizedBox(width: 4),
        InkWell(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: const [
              Text(
                '設定から通知をONにしてください',
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                    decoration: TextDecoration.underline),
              ),
              Icon(Icons.keyboard_arrow_right)
            ],
          ),
          onTap: _settingTap,
        ),
      ],
    );
  }

  Future<void> _onTap(BuildContext context) async {
    await context.read<SettingStateNotifier>().getCheckNotificationPermStatus();
  }

  Future<void> _settingTap() async {
    await NotificationPermissions.requestNotificationPermissions(
        iosSettings: const NotificationSettingsIos(
            sound: true, alert: true, badge: true));
  }
}
