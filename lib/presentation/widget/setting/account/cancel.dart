import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:kokuchi_event/common/exception.dart';
import 'package:kokuchi_event/common/string.dart';
import 'package:kokuchi_event/domain/event/event_repository_base.dart';
import 'package:kokuchi_event/domain/user/user_repository_base.dart';
import 'package:kokuchi_event/main.dart';
import 'package:kokuchi_event/presentation/notifier/auth/auth_state.dart';
import 'package:kokuchi_event/presentation/notifier/event/lets_go/lets_go_state.dart';
import 'package:kokuchi_event/presentation/notifier/user/user/user_state.dart';
import 'package:kokuchi_event/presentation/widget/common/report/awesome_dialog_button.dart';
import 'package:kokuchi_event/presentation/widget/common/toast.dart';
import 'package:kokuchi_event/presentation/widget/setting/item_text.dart';
import 'package:kokuchi_event/restart_widget.dart';
import 'package:provider/provider.dart';

class AccountInfoCancel extends StatelessWidget {
  const AccountInfoCancel();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Row(
        children: const [
          SettingItemText(text: '退会する', icon: Icons.cancel),
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
        Icons.cancel,
        size: 70,
        style: NeumorphicStyle(color: Colors.red[300], depth: 10),
      ),
      animType: AnimType.BOTTOMSLIDE,
      title: '退会する',
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: const [
            Text('本当に退会しますか？'),
            SizedBox(height: 10),
            Text(
                '追加してほしい機能や改善すべき箇所がございましたら、\n設定の「要望・不具合報告」からご連絡いただければ全力で対応致します。'),
            SizedBox(height: 15),
            Text('注意 <必ず読んでください>', style: TextStyle(color: Colors.red)),
            SizedBox(height: 5),
            Text('退会すると現在投稿している全てのデータの閲覧、編集等ができなくなります。',
                style: TextStyle(color: Colors.red)),
            SizedBox(height: 5),
            Text('退会処理中は途中でアプリを終了しないでください。',
                style: TextStyle(color: Colors.red)),
          ],
        ),
      ),
      btnCancel: AwesomeDialogButton(
        text: 'キャンセル',
        function: () => Navigator.pop(context),
      ),
      btnOk: AwesomeDialogButton(
        text: '退会',
        textColor: Colors.white,
        color: Colors.red,
        function: () async => _cancel(context),
      ),
    ).show();
  }

  Future<void> _cancel(BuildContext context) async {
    try {
      Navigator.pop(context);
      final userState = context.read<UserState>();
      final userRepository = context.read<UserRepositoryBase>();
      final eventRepository = context.read<EventRepositoryBase>();

      await context.read<AuthStateNotifier>().cancelMember(
          userState: userState,
          eventRepository: eventRepository,
          userRepository: userRepository);
      await context
          .read<LetsGoStateNotifier>()
          .deleteAllLetsGoPrefAndNotification();

      // 全てのデータ削除に時間がかかるため、念のため5秒待つ
      await Future<void>.delayed(const Duration(seconds: 5));

      context.read<AuthStateNotifier>().cancelLoadingChange(val: false);
      await commonToast(msg: 'ご利用いただき、誠にありがとうございました！！');
      RestartWidget.restartApp(context);
    } on GenericException catch (e, s) {
      await commonToast(msg: e.message);
      await FirebaseCrashlytics.instance.recordError(e, s);
      context.read<AuthStateNotifier>().cancelLoadingChange(val: false);
    } on Exception catch (e, s) {
      logger.d(e.toString());

      await commonToast(msg: CommonString.exceptionError);
      await FirebaseCrashlytics.instance.recordError(e, s);

      context.read<AuthStateNotifier>().cancelLoadingChange(val: false);
    }
  }
}
