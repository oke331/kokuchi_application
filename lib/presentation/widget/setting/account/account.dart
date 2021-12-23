import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:kokuchi_event/presentation/route/route_name.dart';
import 'package:kokuchi_event/presentation/widget/setting/account/block_user/block_user.dart';
import 'package:kokuchi_event/presentation/widget/setting/headline.dart';
import 'package:kokuchi_event/presentation/widget/setting/item_text.dart';

class SettingAccount extends StatelessWidget {
  const SettingAccount();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const SettingHeadline(text: 'アカウント'),
        const SizedBox(height: 30),
        InkWell(
          child: Row(
            children: const <Widget>[
              SettingItemText(text: 'アカウント管理', icon: Icons.account_box),
              Icon(Icons.keyboard_arrow_right)
            ],
          ),
          onTap: () => Navigator.of(context, rootNavigator: true)
              .pushNamed(RouteName.accountInfo),
        ),
        const SizedBox(height: 30),
        const SettingBlockUser(),
      ],
    );
  }
}
