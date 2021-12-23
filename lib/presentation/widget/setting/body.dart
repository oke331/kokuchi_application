import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:kokuchi_event/presentation/widget/setting/account/account.dart';
import 'package:kokuchi_event/presentation/widget/setting/developer/developer.dart';
import 'package:kokuchi_event/presentation/widget/setting/notice/notice.dart';
import 'package:kokuchi_event/presentation/widget/setting/privacy_policy_button.dart';
import 'package:kokuchi_event/presentation/widget/setting/term_button.dart';

class SettingBody extends StatelessWidget {
  const SettingBody();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
        children: const <Widget>[
          SettingNotice(),
          SizedBox(height: 40),
          SettingDeveloper(),
          SizedBox(height: 40),
          SettingAccount(),
          SizedBox(height: 40),
          SettingTermButton(),
          SizedBox(height: 30),
          SettingPrivacyPolicyButton(),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
