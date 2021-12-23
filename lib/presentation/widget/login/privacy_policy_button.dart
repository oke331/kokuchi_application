import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:kokuchi_event/presentation/route/route_name.dart';

class LoginPrivacyPolicyButton extends StatelessWidget {
  const LoginPrivacyPolicyButton();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: const Text(
        'プライバシーポリシー',
        textAlign: TextAlign.center,
        style: TextStyle(decoration: TextDecoration.underline),
      ),
      onTap: () => Navigator.of(context, rootNavigator: true)
          .pushNamed(RouteName.privacyPolicy),
    );
  }
}
