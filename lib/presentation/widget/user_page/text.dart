import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class UserPageText extends StatelessWidget {
  const UserPageText(String val) : _val = val;

  final String _val;

  @override
  Widget build(BuildContext context) {
    return _val != null && _val.isNotEmpty
        ? Text(_val,
            style: const TextStyle(
                color: Color.fromARGB(255, 120, 120, 120), fontSize: 17))
        : const SizedBox.shrink();
  }
}
