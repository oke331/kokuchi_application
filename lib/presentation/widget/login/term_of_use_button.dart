import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:kokuchi_event/presentation/route/route_name.dart';

class LoginTermOfUseButton extends StatelessWidget {
  const LoginTermOfUseButton();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Text(
        '利用規約',
        textAlign: TextAlign.center,
        style: TextStyle(decoration: TextDecoration.underline),
      ),
      onTap: () =>
          Navigator.of(context, rootNavigator: true).pushNamed(RouteName.term),
    );
  }
}
