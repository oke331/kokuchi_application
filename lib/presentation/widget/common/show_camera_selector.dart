import 'package:flutter_neumorphic/flutter_neumorphic.dart';

Future<void> showCameraSelector({
  @required BuildContext context,
  @required VoidCallback onTapGallery,
  @required VoidCallback onTapCamera,
  @required VoidCallback onTapDelete,
  @required bool isDeleteShow,
}) =>
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            leading: const Icon(Icons.photo_library),
            title: const Text('ギャラリーから選択'),
            onTap: onTapGallery,
            contentPadding: const EdgeInsets.only(left: 10),
          ),
          ListTile(
            leading: const Icon(Icons.camera_alt),
            title: const Text('カメラで撮影'),
            onTap: onTapCamera,
            contentPadding: isDeleteShow
                ? const EdgeInsets.only(left: 10)
                : const EdgeInsets.only(left: 10, bottom: 15),
          ),
          isDeleteShow
              ? ListTile(
                  leading: const Icon(Icons.delete),
                  title: const Text('画像を取り消し'),
                  onTap: onTapDelete,
                  contentPadding: const EdgeInsets.only(left: 10, bottom: 15),
                )
              : const SizedBox.shrink(),
        ],
      ),
    );
