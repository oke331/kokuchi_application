import 'package:kokuchi_event/presentation/widget/common/toast.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> launchURL(String url, {String secondUrl}) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else if (secondUrl != null && await canLaunch(secondUrl)) {
    await launch(secondUrl);
  } else {
    await commonToast(msg: '開けませんでした');
  }
}
