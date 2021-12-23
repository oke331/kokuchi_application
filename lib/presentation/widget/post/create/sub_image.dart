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

class PostSubImage extends StatelessWidget {
  const PostSubImage({
    @required int splitCount,
    @required File subImageFile,
    @required int index,
    String subImageUrl,
    @required bool isTrash,
  })  : _splitCount = splitCount,
        _subImageFile = subImageFile,
        _subImageUrl = subImageUrl,
        _index = index,
        _isTrash = isTrash;

  final int _splitCount;
  final File _subImageFile;
  final String _subImageUrl;
  final int _index;
  final bool _isTrash;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final widthSplit = (width - width / 4) / _splitCount;
    return SizedBox(
      width: widthSplit,
      height: widthSplit,
      child: CommonImageEdit(
        onTap: () => _onTap(context),
        imageFile: _subImageFile,
        imageUrl: _subImageUrl,
        imageFit: BoxFit.cover,
        isTrash: _isTrash,
      ),
    );
  }

  Future<void> _onTap(BuildContext context) async {
    await showCameraSelector(
        context: context,
        onTapGallery: () => _onTapGallery(context),
        onTapCamera: () => _onTapCamera(context),
        onTapDelete: () => _onTapDelete(context),
        isDeleteShow: (_subImageUrl != null && _subImageUrl.isNotEmpty) ||
            _subImageFile != null);
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
          _changeFileState(context, file);
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
          _changeFileState(context, file);
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
      _changeFileState(context, file);
    }
  }

  void _onTapDelete(BuildContext context) {
    _deleteFileState(context);
    Navigator.pop(context);
  }

  void _changeFileState(BuildContext context, File file) {
    switch (_index) {
      case 1:
        context.read<MyEventEditStateNotifier>().changeSubImageFile1(file);
        break;
      case 2:
        context.read<MyEventEditStateNotifier>().changeSubImageFile2(file);
        break;
      case 3:
        context.read<MyEventEditStateNotifier>().changeSubImageFile3(file);
        break;
      default:
        logger.d('subImage no index');
    }
  }

  void _deleteFileState(BuildContext context) {
    switch (_index) {
      case 1:
        context.read<MyEventEditStateNotifier>().changeSubImageFile1(null);
        break;
      case 2:
        context.read<MyEventEditStateNotifier>().changeSubImageFile2(null);
        break;
      case 3:
        context.read<MyEventEditStateNotifier>().changeSubImageFile3(null);
        break;
      default:
        logger.d('subImage no index');
    }
  }
}
