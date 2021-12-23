import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class SettingItemText extends StatelessWidget {
  const SettingItemText({@required String text, @required IconData icon})
      : _icon = icon,
        _text = text;

  final String _text;
  final IconData _icon;

  @override
  Widget build(BuildContext context) {
    final textSize = Theme.of(context).textTheme.bodyText1.fontSize;

    return Row(
      children: <Widget>[
        Icon(_icon, color: Colors.green),
        const SizedBox(width: 12),
        Text(
          _text,
          textAlign: TextAlign.left,
          style: TextStyle(fontSize: textSize),
          overflow: TextOverflow.fade,
        ),
      ],
    );
  }
}
