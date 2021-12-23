import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class OtherUserPageBlockUserText extends StatelessWidget {
  const OtherUserPageBlockUserText({@required String text}) : _text = text;

  final String _text;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Text(
          _text,
          style: const TextStyle(color: Colors.green),
        ));
  }
}
