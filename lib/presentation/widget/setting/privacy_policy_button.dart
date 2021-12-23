import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:kokuchi_event/presentation/route/route_name.dart';

class SettingPrivacyPolicyButton extends StatelessWidget {
  const SettingPrivacyPolicyButton();

  @override
  Widget build(BuildContext context) {
    final mediaWidth = MediaQuery.of(context).size.width;
    final width = mediaWidth / 6.5;

    return NeumorphicButton(
      child: const Text(
        'プライバシーポリシー',
        textAlign: TextAlign.center,
      ),
      onPressed: () => Navigator.of(context, rootNavigator: true)
          .pushNamed(RouteName.privacyPolicy),
      margin: EdgeInsets.symmetric(horizontal: width),
    );
  }
}
