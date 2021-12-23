import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:kokuchi_event/run.dart';

const APP_STORE_ID = '1528841192';
const ANDROID_PACKAGE_NAME = 'com.application.kokuchi_event';
const IOS_PACKAGE_NAME = 'com.application.kokuchiEvent';

class SnsShareDynamicLink {
  static const queryEventId = 'eventId';

  static Future<Uri> shortUriFromEventId(String eventId, Flavor flavor) async {
    final proParameters = DynamicLinkParameters(
      uriPrefix: 'https://kokuchi.page.link',
      link: Uri.parse('https://kokuchi.page.link/event?$queryEventId=$eventId'),
      androidParameters: AndroidParameters(
        packageName: ANDROID_PACKAGE_NAME,
        minimumVersion: 0,
      ),
      iosParameters: IosParameters(
        bundleId: IOS_PACKAGE_NAME,
        minimumVersion: '0',
        appStoreId: APP_STORE_ID,
      ),
    );

    final staParameters = DynamicLinkParameters(
      uriPrefix: 'https://kokuchistaging.page.link',
      link: Uri.parse(
          'https://kokuchistaging.page.link/event/?$queryEventId=$eventId'),
      androidParameters: AndroidParameters(
        packageName: 'com.application.kokuchi_event.staging',
        minimumVersion: 0,
      ),
      iosParameters: IosParameters(
        bundleId: 'com.application.kokuchiEvent.staging',
        minimumVersion: '0',
        appStoreId: APP_STORE_ID,
      ),
    );

    final devParameters = DynamicLinkParameters(
      uriPrefix: 'https://kokuchidevelopment.page.link',
      link: Uri.parse(
          'https://kokuchidevelopment.page.link/event?$queryEventId=$eventId'),
      androidParameters: AndroidParameters(
        packageName: 'com.application.kokuchi_event.development',
        minimumVersion: 0,
      ),
      iosParameters: IosParameters(
        bundleId: 'com.application.kokuchiEvent.development',
        minimumVersion: '0',
        appStoreId: APP_STORE_ID,
      ),
    );

    ShortDynamicLink shortDynamicLink;
    switch (flavor) {
      case Flavor.development:
        shortDynamicLink = await devParameters.buildShortLink();
        break;
      case Flavor.staging:
        shortDynamicLink = await staParameters.buildShortLink();
        break;
      case Flavor.production:
        shortDynamicLink = await proParameters.buildShortLink();
        break;
      default:
        shortDynamicLink = await proParameters.buildShortLink();
        break;
    }

    return shortDynamicLink.shortUrl;
  }
}
