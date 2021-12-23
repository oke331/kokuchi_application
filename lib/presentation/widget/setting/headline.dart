import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class SettingHeadline extends StatelessWidget {
  const SettingHeadline({@required String text}) : _text = text;

  final String _text;

  @override
  Widget build(BuildContext context) {
    final textSize = Theme.of(context).textTheme.headline6.fontSize;

    return Text(
      _text,
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: textSize),
    );
  }
}
