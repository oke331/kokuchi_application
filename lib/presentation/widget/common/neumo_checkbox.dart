import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class NeumoCheckbox extends StatelessWidget {
  const NeumoCheckbox(
      {EdgeInsets padding,
      EdgeInsets margin,
      @required VoidCallback onPressed,
      @required bool boolState})
      : _margin = margin,
        _padding = padding,
        _onPressed = onPressed,
        _boolState = boolState;

  final EdgeInsets _padding;
  final EdgeInsets _margin;
  final VoidCallback _onPressed;
  final bool _boolState;

  @override
  Widget build(BuildContext context) {
    return NeumorphicButton(
      padding: _padding,
      margin: _margin,
      style: _boolState
          ? NeumorphicStyle(
              depth: NeumorphicTheme.embossDepth(context), color: Colors.green)
          : const NeumorphicStyle(),
      onPressed: _onPressed,
      child: _boolState
          ? const Icon(
              Icons.check,
              color: Colors.white,
            )
          : const Icon(
              Icons.close,
              color: Colors.grey,
            ),
    );
  }
}
