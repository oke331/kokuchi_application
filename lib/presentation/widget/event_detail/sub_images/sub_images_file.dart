import 'dart:io';

import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:kokuchi_event/presentation/notifier/event/event_detail/event_detail_state.dart';
import 'package:kokuchi_event/presentation/widget/event_detail/sub_images/sub_image.dart';
import 'package:provider/provider.dart';

class EventDetailSubImages extends StatelessWidget {
  const EventDetailSubImages();

  @override
  Widget build(BuildContext context) {
    final subFile1 =
        context.select((EventDetailState value) => value.subImageFile1);
    final subFile2 =
        context.select((EventDetailState value) => value.subImageFile2);
    final subFile3 =
        context.select((EventDetailState value) => value.subImageFile3);
    final subUrl =
        context.select((EventDetailState value) => value.subImagesUrl);

    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    double widthSplit;
    if (width <= height) {
      widthSplit = width - width / 2.5;
    } else {
      widthSplit = height - height / 2.5;
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        if (subFile1 != null ||
            (subUrl != null && subUrl[0] != null && subUrl[0].isNotEmpty))
          EventDetailSubImage(
            subImageFile: subFile1,
            subImageUrl: subUrl != null ? subUrl[0] : null,
            widthSplit: widthSplit,
          ),
        if (subFile2 != null ||
            (subUrl != null && subUrl[1] != null && subUrl[1].isNotEmpty))
          EventDetailSubImage(
            subImageFile: subFile2,
            subImageUrl: subUrl != null ? subUrl[1] : null,
            widthSplit: widthSplit,
          ),
        if (subFile3 != null ||
            (subUrl != null && subUrl[2] != null && subUrl[2].isNotEmpty))
          EventDetailSubImage(
            subImageFile: subFile3,
            subImageUrl: subUrl != null ? subUrl[2] : null,
            widthSplit: widthSplit,
          ),
      ],
    );
  }

  int _splitCount(File sub1, File sub2, File sub3, List<String> subUrl) {
    int count = 0;
    if (sub1 != null ||
        (subUrl != null && subUrl[0] != null && subUrl[0].isNotEmpty)) count++;
    if (sub2 != null ||
        (subUrl != null && subUrl[1] != null && subUrl[1].isNotEmpty)) count++;
    if (sub3 != null ||
        (subUrl != null && subUrl[2] != null && subUrl[2].isNotEmpty)) count++;

    return count;
  }
}
