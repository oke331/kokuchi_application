import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:kokuchi_event/presentation/notifier/auth/auth_state.dart';
import 'package:kokuchi_event/presentation/widget/setting/item_text.dart';
import 'package:provider/provider.dart';

class AccountInfoLoginMail extends StatelessWidget {
  const AccountInfoLoginMail();

  @override
  Widget build(BuildContext context) {
    final mail = context.select((AuthState value) => value.firebaseUser)?.email;
    return Column(
      children: [
        SettingItemText(
          text: 'ログインアカウント\n$mail',
          icon: Icons.mail,
        ),
        if (mail.contains('privaterelay.appleid.com'))
          Column(
            children: const [
              SizedBox(height: 5),
              Text(
                '※アドレスが非公開の設定となっている可能性があります。',
                style: TextStyle(fontSize: 10),
              ),
            ],
          ),
      ],
    );
  }
}
