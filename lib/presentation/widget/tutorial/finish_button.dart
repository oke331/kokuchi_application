import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:kokuchi_event/common/exception.dart';
import 'package:kokuchi_event/common/string.dart';
import 'package:kokuchi_event/presentation/notifier/user/user/user_state.dart';
import 'package:kokuchi_event/presentation/widget/common/toast.dart';
import 'package:provider/provider.dart';

class TutorialFinishButton extends StatelessWidget {
  const TutorialFinishButton();

  @override
  Widget build(BuildContext context) {
    return NeumorphicButton(
      onPressed: () => context.read<UserState>().isLoading
          ? null
          : _finishPagePressed(context),
      child: const Text('さあ、はじめよう！'),
    );
  }

  Future<void> _finishPagePressed(BuildContext context) async {
    try {
      context.read<UserStateNotifier>().loadingChange(val: true);
      await context.read<UserStateNotifier>().saveTutorial();
      context.read<UserStateNotifier>().loadingChange(val: false);
      await commonToast(msg: 'Kokuchiへようこそ！！');
      Navigator.pop(context);
    } on GenericException catch (e, s) {
      context.read<UserStateNotifier>().loadingChange(val: false);
      await commonToast(msg: e.message);
      await FirebaseCrashlytics.instance.recordError(e, s);
    } on Exception catch (e, s) {
      context.read<UserStateNotifier>().loadingChange(val: false);
      await commonToast(msg: CommonString.exceptionError);
      await FirebaseCrashlytics.instance.recordError(e, s);
    }
  }
}
