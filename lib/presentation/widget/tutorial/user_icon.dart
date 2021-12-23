import 'dart:io';

import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter_absolute_path/flutter_absolute_path.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kokuchi_event/common/string.dart';
import 'package:kokuchi_event/main.dart';
import 'package:kokuchi_event/presentation/notifier/user/user/user_state.dart';
import 'package:kokuchi_event/presentation/widget/common/center_loading.dart';
import 'package:kokuchi_event/presentation/widget/common/icon/icon_edit.dart';
import 'package:kokuchi_event/presentation/widget/common/show_camera_selector.dart';
import 'package:kokuchi_event/presentation/widget/common/toast.dart';
import 'package:kokuchi_event/presentation/widget/tutorial/finish_button.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:provider/provider.dart';

class TutorialUserIcon extends StatelessWidget {
  const TutorialUserIcon();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => !context.read<UserState>().isLoading,
      child: ModalProgressHUD(
        child: Scaffold(
          appBar: NeumorphicAppBar(
            title: const Text('ユーザーアイコン画像'),
            centerTitle: true,
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const SizedBox(height: 40),
                  CommonIconEdit(
                      iconFile:
                          context.select((UserState value) => value.iconFile),
                      isTrash: context.select(
                          (UserState value) => value.trashBeforeIconUrl),
                      onTap: () => _onTap(context)),
                  const SizedBox(height: 50),
                  const Text('アイコン画像は後で変更可能です。'),
                  const SizedBox(height: 40),
                  const TutorialFinishButton(),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ),
        progressIndicator: const CenterLoading(),
        inAsyncCall: context.select((UserState value) => value.isLoading),
      ),
    );
  }

  Future<void> _onTap(BuildContext context) async {
    final file = context.read<UserState>().iconFile;

    await showCameraSelector(
        context: context,
        onTapGallery: () => _onTapGallery(context),
        onTapCamera: () => _onTapCamera(context),
        onTapDelete: () => _onTapDelete(context),
        isDeleteShow: file != null);
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
          context.read<UserStateNotifier>().changeIcon(file);
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
          context.read<UserStateNotifier>().changeIcon(file);
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
      context.read<UserStateNotifier>().changeIcon(file);
    }
  }

  void _onTapDelete(BuildContext context) {
    context.read<UserStateNotifier>().changeIcon(null);
    Navigator.pop(context);
  }
}
