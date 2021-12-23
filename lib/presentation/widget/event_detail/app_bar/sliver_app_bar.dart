import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:kokuchi_event/presentation/notifier/event/event_detail/event_detail_state.dart';
import 'package:kokuchi_event/presentation/widget/common/leading.dart';
import 'package:kokuchi_event/presentation/widget/event_detail/app_bar/action_edit.dart';
import 'package:kokuchi_event/presentation/widget/event_detail/app_bar/action_post.dart';
import 'package:kokuchi_event/presentation/widget/event_detail/app_bar/sliver_app_bar_flexible_space.dart';
import 'package:provider/provider.dart';

class EventDetailSliverAppBar extends StatelessWidget {
  const EventDetailSliverAppBar();

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      elevation: 10,
      backgroundColor: Theme.of(context).backgroundColor,
      actions: <Widget>[
        context.select((EventDetailState value) => value.isPostConfirm)
            ? const EventDetailActionPost()
            : context.select((EventDetailState value) => value.isMyEventEdit)
                ? const EventDetailActionEdit()
                : const SizedBox.shrink(),
      ],
      leading: const SliverAppBarBackLeading(),
      pinned: true,
      expandedHeight: 140,
      flexibleSpace: const EventDetailAppBarFlexibleSpace(),
      bottom: const PreferredSize(
        child: SizedBox.shrink(),
        preferredSize: Size.fromHeight(20),
      ),
    );
  }
}
