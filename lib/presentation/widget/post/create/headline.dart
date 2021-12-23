import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class PostHeadline extends StatelessWidget {
  const PostHeadline({@required String text}) : _text = text;

  final String _text;

  @override
  Widget build(BuildContext context) {
    return Text(_text);
  }
}
