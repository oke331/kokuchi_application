import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class CommonHeadLineAndRefresh extends StatelessWidget {
  const CommonHeadLineAndRefresh(
      {@required String text,
      @required VoidCallback onTap,
      @required bool loading})
      : _text = text,
        _onTap = onTap,
        _loading = loading;

  final String _text;
  final VoidCallback _onTap;
  final bool _loading;

  @override
  Widget build(BuildContext context) {
    final backgroundColor = Theme.of(context).scaffoldBackgroundColor;

    return Container(
      color: backgroundColor,
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            _text,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            textAlign: TextAlign.left,
          ),
          const SizedBox(width: 2),
          _loading
              ? const Icon(
                  Icons.refresh,
                  color: Colors.green,
                )
              : InkWell(
                  child: const Icon(
                    Icons.refresh,
                    color: Colors.grey,
                  ),
                  onTap: _onTap,
                )
        ],
      ),
    );
  }
}
