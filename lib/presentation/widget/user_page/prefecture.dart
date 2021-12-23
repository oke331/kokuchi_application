import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class UserPagePrefecture extends StatelessWidget {
  const UserPagePrefecture(String val) : _val = val;

  final String _val;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const Icon(Icons.room, color: Colors.black54),
        Text(
          _val,
          style: const TextStyle(color: Colors.black54),
        ),
      ],
    );
  }
}
