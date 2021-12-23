import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class EventDetailNeumoHeadline extends StatelessWidget {
  const EventDetailNeumoHeadline({@required String text}) : _text = text;

  final String _text;
  @override
  Widget build(BuildContext context) {
    return Text(
      _text,
      style: TextStyle(
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.italic,
          color: Colors.black54,
          fontSize: 22),
    );
  }
}
