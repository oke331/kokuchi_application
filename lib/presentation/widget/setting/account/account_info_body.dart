import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:kokuchi_event/presentation/notifier/auth/auth_state.dart';
import 'package:kokuchi_event/presentation/widget/setting/account/cancel.dart';
import 'package:kokuchi_event/presentation/widget/setting/account/login_mail.dart';
import 'package:kokuchi_event/presentation/widget/setting/account/logout.dart';
import 'package:provider/provider.dart';

class AccountInfoBody extends StatelessWidget {
  const AccountInfoBody();

  @override
  Widget build(BuildContext context) {
    final mail = context.select((AuthState value) => value.firebaseUser)?.email;

    return Padding(
      padding: const EdgeInsets.only(left: 40, top: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (mail != null && mail.isNotEmpty) const AccountInfoLoginMail(),
          if (mail != null && mail.isNotEmpty) const SizedBox(height: 40),
          const AccountInfoLogout(),
          const SizedBox(height: 40),
          const AccountInfoCancel(),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
