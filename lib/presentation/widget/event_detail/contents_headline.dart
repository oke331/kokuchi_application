import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class EventDetailContentsHeadline extends StatelessWidget {
  const EventDetailContentsHeadline({@required String text}) : _text = text;

  final String _text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7),
      child: Text(
        '$_text',
        style: const TextStyle(color: Colors.black54, fontSize: 16),
      ),
    );
  }
}
