import 'dart:io';

import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter_absolute_path/flutter_absolute_path.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kokuchi_event/common/string.dart';
import 'package:kokuchi_event/main.dart';
import 'package:kokuchi_event/presentation/notifier/user/my_page_edit/my_page_edit_state.dart';
import 'package:kokuchi_event/presentation/widget/common/icon/icon_edit.dart';
import 'package:kokuchi_event/presentation/widget/common/show_camera_selector.dart';
import 'package:kokuchi_event/presentation/widget/common/toast.dart';
import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:provider/provider.dart';

class MyPageEditIcon extends StatelessWidget {
  const MyPageEditIcon();

  @override
  Widget build(BuildContext context) {
    final url = context.select((MyPageEditState value) => value.iconUrl);
    final file = context.select((MyPageEditState value) => value.iconFile);
    final isTrash =
        context.select((MyPageEditState value) => value.trashBeforeIconUrl);

    return CommonIconEdit(
      iconUrl: url,
      iconFile: file,
      onTap: () => _onTap(context),
      isTrash: isTrash,
    );
  }

  Future<void> _onTap(BuildContext context) async {
    final file = context.read<MyPageEditState>().iconFile;
    final url = context.read<MyPageEditState>().iconUrl;

    await showCameraSelector(
        context: context,
        onTapGallery: () => _onTapGallery(context),
        onTapCamera: () => _onTapCamera(context),
        onTapDelete: () => _onTapDelete(context),
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
          context.read<MyPageEditStateNotifier>().changeIcon(file);
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
          context.read<MyPageEditStateNotifier>().changeIcon(file);
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
      context.read<MyPageEditStateNotifier>().changeIcon(file);
    }
  }

  void _onTapDelete(BuildContext context) {
    context.read<MyPageEditStateNotifier>().changeIcon(null);
    Navigator.pop(context);
  }
}
