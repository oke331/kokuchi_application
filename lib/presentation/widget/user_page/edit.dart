import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:kokuchi_event/presentation/route/route_name.dart';

class UserPageEdit extends StatelessWidget {
  const UserPageEdit();

  @override
  Widget build(BuildContext context) {
    return NeumorphicButton(
      onPressed: () => Navigator.of(context, rootNavigator: true)
          .pushNamed(RouteName.myPageEdit),
      style: const NeumorphicStyle(
        surfaceIntensity: 0.15,
        boxShape: NeumorphicBoxShape.circle(),
        shape: NeumorphicShape.concave,
      ),
      child: const Icon(
        Icons.edit,
        size: 15,
      ),
    );
  }
}
