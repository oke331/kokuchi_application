import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/services.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:kokuchi_event/common/color.dart';
import 'package:kokuchi_event/common/exception.dart';
import 'package:kokuchi_event/common/string.dart';
import 'package:kokuchi_event/common/user_status_situation.dart';
import 'package:kokuchi_event/main.dart';
import 'package:kokuchi_event/presentation/notifier/user/user/user_state.dart';
import 'package:kokuchi_event/presentation/page/login.dart';
import 'package:kokuchi_event/presentation/share/lets_go_notification.dart';
import 'package:kokuchi_event/presentation/widget/common/toast.dart';
import 'package:kokuchi_event/presentation/widget/navigation.dart';
import 'package:kokuchi_event/presentation/widget/reject/user.dart';
import 'package:kokuchi_event/presentation/widget/tutorial/user_info.dart';
import 'package:kokuchi_event/restart_widget.dart';
import 'package:provider/provider.dart';

class LoginCheck extends StatelessWidget {
  const LoginCheck();

  @override
  Widget build(BuildContext context) {
    // onResumeを受け取る
    SystemChannels.lifecycle.setMessageHandler((msg) async {
      if (msg == 'AppLifecycleState.resumed') {
        try {
          // rejectかどうかチェックする
          if (await context.read<UserStateNotifier>().rejectCheck()) {
            RestartWidget.restartApp(context);
          }
        } on GenericException catch (e, s) {
          await commonToast(msg: e.message);
          await FirebaseCrashlytics.instance.recordError(e, s);
        } on Exception catch (e, s) {
          logger.d(e.toString());
          await commonToast(msg: CommonString.exceptionError);
          await FirebaseCrashlytics.instance.recordError(e, s);
        }
      }
      return null;
    });

    final init = context.select((UserState value) => value.init);
    if (init == null || !init) {
      return const Scaffold(
        body: SizedBox.shrink(),
      );
    }

    final status = context.select((UserState value) => value.status);

    // キーボードを開いた時に別の色になるため、Containerを挟む
    return Container(
      color: CommonColor.backLightColor,
      child: Builder(
        builder: (context) {
          if (status == UserStatusSituation.public) {
            final userId = context.select((UserState value) => value.id);
            LetsGoNotification().init(context, userId);
            return const Navigation();
          } else if (status == UserStatusSituation.progress) {
            return TutorialUserInfo();
          } else if (status == UserStatusSituation.reject) {
            return const RejectUser();
          } else {
            return const Login();
          }
        },
      ),
    );
  }
}
