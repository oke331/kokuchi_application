import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:kokuchi_event/application/dto/user_dto.dart';
import 'package:kokuchi_event/presentation/notifier/block_user/block_user_state.dart';
import 'package:kokuchi_event/presentation/widget/common/icon/icon_show.dart';
import 'package:provider/provider.dart';

class BlockUserTile extends StatelessWidget {
  const BlockUserTile();

  @override
  Widget build(BuildContext context) {
    final userDto = context.select((UserDto value) => value);

    return ListTile(
      contentPadding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      leading: SizedBox(
        width: 60,
        child: CommonIconShow(
          iconUrl: userDto.iconUrl,
          size: 40,
        ),
      ),
      title: Text(
        userDto.name,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
      trailing: NeumorphicButton(
        child: const Text(
          '解除',
          style: TextStyle(color: Colors.white, fontSize: 13),
        ),
        onPressed: () => _onPressed(context),
        style: const NeumorphicStyle(
          color: Colors.green,
        ),
      ),
    );
  }

  Future<void> _onPressed(BuildContext context) async {
    final otherId = context.read<UserDto>().id;
    await context
        .read<BlockUserStateNotifier>()
        .deleteBlockUser(otherId: otherId);
  }
}
