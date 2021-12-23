import 'dart:io';

import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter_absolute_path/flutter_absolute_path.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kokuchi_event/common/string.dart';
import 'package:kokuchi_event/main.dart';
import 'package:kokuchi_event/presentation/notifier/event/my_event_edit/my_event_edit_state.dart';
import 'package:kokuchi_event/presentation/widget/common/event_image/image_edit.dart';
import 'package:kokuchi_event/presentation/widget/common/show_camera_selector.dart';
import 'package:kokuchi_event/presentation/widget/common/toast.dart';
import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:provider/provider.dart';

class PostMainImage extends StatelessWidget {
  const PostMainImage();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final url =
        context.select((MyEventEditState value) => value.beforeMainImageUrl);
    final file =
        context.select((MyEventEditState value) => value.mainImageFile);
    final isTrash =
        context.select((MyEventEditState value) => value.trashBeforeMainImage);

    return Center(
      child: SizedBox(
        width: width - 100,
        height: (width - 100) / 2,
        child: CommonImageEdit(
          onTap: () => _onTap(context),
          imageFile: file,
          imageUrl: url,
          imageFit: BoxFit.fitWidth,
          isTrash: isTrash,
        ),
      ),
    );
  }

  Future<void> _onTap(BuildContext context) async {
    final file = context.read<MyEventEditState>().mainImageFile;
    final url = context.read<MyEventEditState>().beforeMainImageUrl;

    await showCameraSelector(
        context: context,
        onTapGallery: () => _onTapGallery(context),
        onTapDelete: () => _onTapDelete(context),
        onTapCamera: () => _onTapCamera(context),
        isDeleteShow: file != null || (url != null && url.isNotEmpty));
  }

  Future<void> _onTapGallery(BuildContext context) async {
    Navigator.pop(context);
    try {
      if (Platform.isIOS) {
        final image = await MultiImagePicker.pickImages(maxImages: 1);
        if (image != null && image.isNotEmpty) {
          final path =
              await FlutterAbsolutePath.getAbsolutePath(image[0].identifier);
          final file = File(path);
          if (file.lengthSync() > 30 * 1024 * 1024) {
            await commonToast(msg: 'ファイル容量は30MB以下でお願いします！');
            return;
          }
          context.read<MyEventEditStateNotifier>().changeMainImageFile(file);
        }
      } else {
        final pickedFile =
            await ImagePicker().getImage(source: ImageSource.gallery);
        if (pickedFile != null) {
          final file = File(pickedFile.path);
          if (file.lengthSync() > 30 * 1024 * 1024) {
            await commonToast(msg: 'ファイル容量は30MB以下でお願いします！');
            return;
          }
          context.read<MyEventEditStateNotifier>().changeMainImageFile(file);
        }
      }
    } on NoImagesSelectedException catch (e) {
      logger.d(e.toString());
    } on Exception catch (e, s) {
      logger.d(e.toString());
      await commonToast(msg: CommonString.exceptionError);
      await FirebaseCrashlytics.instance.recordError(e, s);
    }
  }

  Future<void> _onTapCamera(BuildContext context) async {
    Navigator.pop(context);
    final pickedFile = await ImagePicker().getImage(source: ImageSource.camera);
    if (pickedFile != null) {
      final file = File(pickedFile.path);
      if (file.lengthSync() > 30 * 1024 * 1024) {
        await commonToast(msg: 'ファイル容量は30MB以下でお願いします！');
        return;
      }
      context.read<MyEventEditStateNotifier>().changeMainImageFile(file);
    }
  }

  void _onTapDelete(BuildContext context) {
    context.read<MyEventEditStateNotifier>().changeMainImageFile(null);
    Navigator.pop(context);
  }
}
