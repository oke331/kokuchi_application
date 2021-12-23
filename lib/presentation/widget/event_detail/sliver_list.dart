import 'dart:io';

import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:kokuchi_event/presentation/notifier/event/event_detail/event_detail_state.dart';
import 'package:kokuchi_event/presentation/widget/event_detail/contact/contact_neumo.dart';
import 'package:kokuchi_event/presentation/widget/event_detail/contents/text_neumo.dart';
import 'package:kokuchi_event/presentation/widget/event_detail/info/info_neumo.dart';
import 'package:kokuchi_event/presentation/widget/event_detail/sub_images/sub_images_neumo.dart';
import 'package:kokuchi_event/presentation/widget/event_detail/title/title_neumo.dart';
import 'package:kokuchi_event/presentation/widget/event_detail/under_button/remove.dart';
import 'package:kokuchi_event/presentation/widget/event_detail/under_button/report.dart';
import 'package:provider/provider.dart';

class EventDetailSliverList extends StatelessWidget {
  const EventDetailSliverList();

  @override
  Widget build(BuildContext context) {
    final text = context.select((EventDetailState value) => value.text);
    final subFile1 =
        context.select((EventDetailState value) => value.subImageFile1);
    final subFile2 =
        context.select((EventDetailState value) => value.subImageFile2);
    final subFile3 =
        context.select((EventDetailState value) => value.subImageFile3);
    final subUrl =
        context.select((EventDetailState value) => value.subImagesUrl);

    return SliverList(
      delegate: SliverChildListDelegate(
        <Widget>[
          const EventDetailTitleNeumo(),
          const EventDetailInfoNeumo(),
          if (text != null && text.isNotEmpty) const EventDetailTextNeumo(),
          if (isExistSubImage(subFile1, subFile2, subFile3, subUrl))
            const EventDetailSubImagesNeumo(),
          const EventDetailContactNeumo(),
          const SizedBox(height: 20),
          context.select((EventDetailState value) => value.isMyEventEdit) &&
                  !context
                      .select((EventDetailState value) => value.isPostConfirm)
              ? const EventDetailRemove()
              : const SizedBox.shrink(),
          context.select((EventDetailState value) => value.userDto) != null
              ? const EventDetailReport()
              : const SizedBox.shrink(),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  bool isExistSubImage(File sub1, File sub2, File sub3, List<String> urls) {
    var result = false;
    if (sub1 != null || sub2 != null || sub3 != null) {
      result = true;
    } else if (urls != null) {
      urls.forEach((element) {
        if (element != null && element.isNotEmpty) {
          result = true;
        }
      });
    }

    return result;
  }
}
