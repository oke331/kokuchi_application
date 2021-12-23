import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class ReportButton extends StatelessWidget {
  const ReportButton({@required VoidCallback function, @required String text})
      : _function = function,
        _text = text;

  final VoidCallback _function;
  final String _text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: SizedBox(
        width: 200,
        child: NeumorphicButton(
          style: NeumorphicStyle(color: Colors.red[100]),
          onPressed: _function,
          child: Text(
            _text,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 13),
          ),
        ),
      ),
    );
  }
}
