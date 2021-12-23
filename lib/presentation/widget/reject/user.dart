import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:kokuchi_event/presentation/notifier/auth/auth_state.dart';
import 'package:kokuchi_event/presentation/notifier/user/user/user_state.dart';
import 'package:provider/provider.dart';

class RejectUser extends StatelessWidget {
  const RejectUser();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _willPopCallback,
      child: Scaffold(
        appBar: NeumorphicAppBar(
          leading: const SizedBox.shrink(),
          title: const Text(
            'アカウントのリジェクト',
            style: TextStyle(fontSize: 18),
          ),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            children: [
              const SizedBox(height: 30),
              const Text(
                '''ご利用ありがとうございます。\n
大変申し訳ありませんが、
このアカウントは通報数が一定数に達したか、
不適切な内容な内容が含まれると判断されたため、
アカウントがリジェクトされました。\n
投稿されたイベントも全てリジェクトされ非表示となっております。\n
また、現在このアカウントはログインできなくなっております。\n
再度ログインを希望する場合は、お手数ですが下記メールアドレスまでご連絡をお願いします。\n
アカウントの復帰が適当だと判断された場合、再度ログインできるようになる可能性があります。\n\n
メールアドレス：flyingo0ostrich@gmail.com''',
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              NeumorphicButton(
                child: const Text('ログイン画面に戻る'),
                onPressed: () => _onPressed(context),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _onPressed(BuildContext context) async {
    await context.read<AuthStateNotifier>().logout();
    context.read<UserStateNotifier>().stateLogin();
  }

  Future<bool> _willPopCallback() async {
    return false;
  }
}
