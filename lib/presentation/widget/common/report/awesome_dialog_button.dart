import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class AwesomeDialogButton extends StatelessWidget {
  const AwesomeDialogButton(
      {@required VoidCallback function,
      @required String text,
      Color color,
      Color textColor})
      : _function = function,
        _text = text,
        _color = color,
        _textColor = textColor;

  final VoidCallback _function;
  final String _text;
  final Color _color;
  final Color _textColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: SizedBox(
        width: 200,
        child: NeumorphicButton(
          style: NeumorphicStyle(
              color: _color,
              boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(5))),
          onPressed: _function,
          child: Text(
            _text,
            style: TextStyle(color: _textColor, fontSize: 13),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
