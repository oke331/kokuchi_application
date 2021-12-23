import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:kokuchi_event/common/exception.dart';
import 'package:kokuchi_event/common/string.dart';
import 'package:kokuchi_event/presentation/notifier/auth/auth_state.dart';
import 'package:kokuchi_event/presentation/widget/common/report/awesome_dialog_button.dart';
import 'package:kokuchi_event/presentation/widget/common/toast.dart';
import 'package:kokuchi_event/presentation/widget/setting/item_text.dart';
import 'package:kokuchi_event/restart_widget.dart';
import 'package:provider/provider.dart';

class AccountInfoLogout extends StatelessWidget {
  const AccountInfoLogout();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Row(
        children: const [
          SettingItemText(text: 'ログアウト', icon: Icons.exit_to_app),
          Icon(Icons.keyboard_arrow_right)
        ],
      ),
      onTap: () => _popup(context),
    );
  }

  Future<void> _popup(BuildContext context) async {
    await AwesomeDialog(
      context: context,
      headerAnimationLoop: false,
      customHeader: NeumorphicIcon(
        Icons.exit_to_app,
        size: 70,
        style: NeumorphicStyle(color: Colors.green, depth: 10),
      ),
      animType: AnimType.BOTTOMSLIDE,
      title: 'ログアウト',
      desc: 'ログイン画面に戻ります。',
      btnCancel: AwesomeDialogButton(
        text: 'キャンセル',
        function: () => Navigator.pop(context),
      ),
      btnOk: AwesomeDialogButton(
        text: 'ログアウト',
        color: Colors.green,
        textColor: Colors.white,
        function: () async => _logout(context),
      ),
    ).show();
  }

  Future<void> _logout(BuildContext context) async {
    try {
      await context.read<AuthStateNotifier>().logout();
      RestartWidget.restartApp(context);
    } on GenericException catch (e, s) {
      await commonToast(msg: e.message);
      await FirebaseCrashlytics.instance.recordError(e, s);
    } on Exception catch (e, s) {
      await commonToast(msg: CommonString.exceptionError);
      await FirebaseCrashlytics.instance.recordError(e, s);
    }
  }
}
