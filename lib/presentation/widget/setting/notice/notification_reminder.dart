import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:kokuchi_event/presentation/notifier/setting/setting_state.dart';
import 'package:kokuchi_event/presentation/widget/common/report/awesome_dialog_button.dart';
import 'package:kokuchi_event/presentation/widget/setting/item_text.dart';
import 'package:kokuchi_event/presentation/widget/setting/notice/notice.dart';
import 'package:kokuchi_event/presentation/widget/setting/notice/notice_radio.dart';
import 'package:provider/provider.dart';

class SettingNotificationReminder extends StatelessWidget {
  const SettingNotificationReminder();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SettingItemText(
              text: 'いきたいリマインダー',
              icon: Icons.event_note,
            ),
            const SizedBox(width: 3),
            InkWell(
                child: const Icon(
                  Icons.help_outline,
                  size: 20,
                  color: Colors.green,
                ),
                onTap: () => _helpTap(context)),
          ],
        ),
        const Expanded(child: SizedBox.shrink()),
        SettingNoticeRadio(
          groupValue:
              context.select((SettingState value) => value.letsGoReminder),
          radioSize: SettingNotice.radioSize,
        ),
      ],
    );
  }

  Future<void> _helpTap(BuildContext context) async {
    await AwesomeDialog(
            context: context,
            headerAnimationLoop: false,
            customHeader: NeumorphicIcon(
              Icons.info,
              size: 100,
              style: const NeumorphicStyle(color: Colors.green, depth: 10),
            ),
            animType: AnimType.BOTTOMSLIDE,
            btnCancel: AwesomeDialogButton(
              textColor: Colors.white,
              color: Colors.green,
              text: 'OK',
              function: () => Navigator.pop(context),
            ),
            title: 'いきたいリマインダーとは？',
            desc: '「いきたい！」を押したイベントが開催される1日前に通知でご連絡する機能です。')
        .show();
  }
}
