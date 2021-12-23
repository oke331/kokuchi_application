import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:kokuchi_event/presentation/notifier/event/my_event_edit/my_event_edit_state.dart';
import 'package:kokuchi_event/presentation/widget/post/create/sub_image.dart';
import 'package:provider/provider.dart';

class PostSubImages extends StatelessWidget {
  const PostSubImages();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        PostSubImage(
          splitCount: 3,
          subImageUrl: context
              .select((MyEventEditState value) => value.beforeSubImagesUrl[0]),
          subImageFile:
              context.select((MyEventEditState value) => value.subImageFile1),
          isTrash: context.select(
              (MyEventEditState value) => value.trashBeforeSubImages[0]),
          index: 1,
        ),
        PostSubImage(
          splitCount: 3,
          subImageUrl: context
              .select((MyEventEditState value) => value.beforeSubImagesUrl[1]),
          subImageFile:
              context.select((MyEventEditState value) => value.subImageFile2),
          index: 2,
          isTrash: context.select(
              (MyEventEditState value) => value.trashBeforeSubImages[1]),
        ),
        PostSubImage(
          splitCount: 3,
          subImageUrl: context
              .select((MyEventEditState value) => value.beforeSubImagesUrl[2]),
          subImageFile:
              context.select((MyEventEditState value) => value.subImageFile3),
          index: 3,
          isTrash: context.select(
              (MyEventEditState value) => value.trashBeforeSubImages[2]),
        ),
      ],
    );
  }
}
