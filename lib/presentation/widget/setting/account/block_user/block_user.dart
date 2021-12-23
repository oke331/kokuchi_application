import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:kokuchi_event/presentation/route/route_name.dart';
import 'package:kokuchi_event/presentation/widget/setting/item_text.dart';

class SettingBlockUser extends StatelessWidget {
  const SettingBlockUser();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Row(
        children: const <Widget>[
          SettingItemText(text: 'ブロックしたユーザー', icon: Icons.block),
          Icon(Icons.keyboard_arrow_right)
        ],
      ),
      onTap: () => Navigator.of(context, rootNavigator: true)
          .pushNamed(RouteName.settingBlockUser),
    );
  }
}
