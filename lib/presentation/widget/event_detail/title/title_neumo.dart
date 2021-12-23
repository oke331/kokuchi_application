import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:kokuchi_event/presentation/notifier/event/event_detail/event_detail_state.dart';
import 'package:kokuchi_event/presentation/widget/event_detail/title/category.dart';
import 'package:kokuchi_event/presentation/widget/event_detail/title/lets_go.dart';
import 'package:kokuchi_event/presentation/widget/event_detail/title/online.dart';
import 'package:kokuchi_event/presentation/widget/event_detail/title/share.dart';
import 'package:kokuchi_event/presentation/widget/event_detail/title/title.dart';
import 'package:provider/provider.dart';

class EventDetailTitleNeumo extends StatelessWidget {
  const EventDetailTitleNeumo();

  @override
  Widget build(BuildContext context) {
    return Neumorphic(
      margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      style: NeumorphicStyle(
        boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
      ),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const EventDetailTitle(),
              if (!context
                  .select((EventDetailState value) => value.isPostConfirm))
                const SizedBox(width: 8),
              if (!context
                  .select((EventDetailState value) => value.isPostConfirm))
                const EventDetailShare(),
            ],
          ),
          const SizedBox(height: 5),
          const EventDetailCategory(),
          context.select((EventDetailState value) => value.online)
              ? const SizedBox(height: 5)
              : const SizedBox.shrink(),
          context.select((EventDetailState value) => value.online)
              ? const EventDetailOnline()
              : const SizedBox.shrink(),
          if (!context.select((EventDetailState value) => value.isPostConfirm))
            Column(
              children: const [
                SizedBox(height: 10),
                EventDetailLetsGo(),
              ],
            )
        ],
      ),
    );
  }
}
