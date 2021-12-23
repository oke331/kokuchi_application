import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:kokuchi_event/presentation/route/route_name.dart';

class SettingTermButton extends StatelessWidget {
  const SettingTermButton();

  @override
  Widget build(BuildContext context) {
    final mediaWidth = MediaQuery.of(context).size.width;
    final width = mediaWidth / 4;

    return NeumorphicButton(
      child: const Text(
        '利用規約',
        textAlign: TextAlign.center,
      ),
      onPressed: () =>
          Navigator.of(context, rootNavigator: true).pushNamed(RouteName.term),
      margin: EdgeInsets.symmetric(horizontal: width),
    );
  }
}
