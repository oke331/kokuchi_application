import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:kokuchi_event/presentation/widget/common/icon/icon_show.dart';

class EventDetailUserTile extends StatelessWidget {
  const EventDetailUserTile({@required String name, @required String iconUrl})
      : _name = name,
        _iconUrl = iconUrl;

  final String _name;
  final String _iconUrl;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        CommonIconShow(
          size: 40,
          iconUrl: _iconUrl,
        ),
        const SizedBox(width: 8),
        Flexible(
          child: Text(
            _name,
            style: const TextStyle(fontSize: 18),
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
          ),
        ),
      ],
    );
  }
}
