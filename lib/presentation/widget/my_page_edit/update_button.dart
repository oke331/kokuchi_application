import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:kokuchi_event/common/exception.dart';
import 'package:kokuchi_event/common/string.dart';
import 'package:kokuchi_event/main.dart';
import 'package:kokuchi_event/presentation/notifier/user/my_page_edit/my_page_edit_state.dart';
import 'package:kokuchi_event/presentation/notifier/user/user/user_state.dart';
import 'package:kokuchi_event/presentation/widget/common/toast.dart';
import 'package:provider/provider.dart';

class MyPageEditUpdateButton extends StatelessWidget {
  const MyPageEditUpdateButton({@required GlobalKey<FormState> formKey})
      : _formKey = formKey;

  final GlobalKey<FormState> _formKey;

  @override
  Widget build(BuildContext context) {
    return NeumorphicButton(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
      onPressed: () async => _updatePressed(context),
      child: const Text(
        '更新',
      ),
    );
  }

  Future<void> _updatePressed(BuildContext context) async {
    try {
      if (_formKey.currentState.validate()) {
        if (context.read<MyPageEditState>().isLoading) return;
        context.read<MyPageEditStateNotifier>().changeIsLoading(val: true);
        await context.read<MyPageEditStateNotifier>().save();
        await context.read<UserStateNotifier>().fetch();
        await commonToast(msg: 'ユーザー情報を更新しました');
        Navigator.of(context).pop();
        context.read<MyPageEditStateNotifier>().changeIsLoading(val: false);
      }
    } on GenericException catch (e, s) {
      await commonToast(msg: e.message);
      await FirebaseCrashlytics.instance.recordError(e, s);
      context.read<MyPageEditStateNotifier>().changeIsLoading(val: false);
    } on Exception catch (e, s) {
      logger.d(e.toString());
      await commonToast(msg: CommonString.exceptionError);
      await FirebaseCrashlytics.instance.recordError(e, s);

      context.read<MyPageEditStateNotifier>().changeIsLoading(val: false);
    }
  }
}
