import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class UserPageName extends StatelessWidget {
  const UserPageName(String val) : _val = val;

  final String _val;

  @override
  Widget build(BuildContext context) {
    final _headline6 = Theme.of(context).textTheme.headline6.fontSize;

    return Flexible(
      child: Text(
        _val ?? '',
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: _headline6),
        textAlign: TextAlign.center,
      ),
    );
  }
}
