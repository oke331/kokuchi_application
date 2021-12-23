import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:kokuchi_event/presentation/widget/login/body.dart';

class Login extends StatelessWidget {
  const Login();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
          WillPopScope(onWillPop: () async => false, child: const LoginBody()),
    );
  }
}
