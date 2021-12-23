import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:kokuchi_event/presentation/widget/event_detail/app_bar/sliver_app_bar.dart';
import 'package:kokuchi_event/presentation/widget/event_detail/sliver_list.dart';

class EventDetailBody extends StatelessWidget {
  const EventDetailBody();

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: <Widget>[
        EventDetailSliverAppBar(),
        EventDetailSliverList(),
      ],
    );
  }
}
