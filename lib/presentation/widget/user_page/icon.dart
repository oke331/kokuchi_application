import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:kokuchi_event/presentation/widget/common/icon/icon_show.dart';

class UserPageIcon extends StatelessWidget {
  const UserPageIcon(String val) : _val = val;

  final String _val;

  @override
  Widget build(BuildContext context) {
    return CommonIconShow(
      size: 120,
      iconUrl: _val,
    );
  }
}
