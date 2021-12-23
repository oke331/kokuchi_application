import 'dart:io';

import 'package:flutter/material.dart';
import 'package:kokuchi_event/application/dto/event/event_dto.dart';
import 'package:kokuchi_event/application/dto/user_dto.dart';
import 'package:kokuchi_event/presentation/notifier/event/event_detail/event_detail_state.dart';
import 'package:kokuchi_event/presentation/notifier/event/my_event_edit/my_event_edit_state.dart';
import 'package:kokuchi_event/presentation/page/home.dart';
import 'package:kokuchi_event/presentation/page/login.dart';
import 'package:kokuchi_event/presentation/page/my_page.dart';
import 'package:kokuchi_event/presentation/page/my_page_edit.dart';
import 'package:kokuchi_event/presentation/page/other_user_page.dart';
import 'package:kokuchi_event/presentation/page/post.dart';
import 'package:kokuchi_event/presentation/page/post_edit.dart';
import 'package:kokuchi_event/presentation/page/search_result.dart';
import 'package:kokuchi_event/presentation/page/setting.dart';
import 'package:kokuchi_event/presentation/route/route_name.dart';
import 'package:kokuchi_event/presentation/widget/common/event_image/image_show.dart';
import 'package:kokuchi_event/presentation/widget/common/fixed_text_scale_factor.dart';
import 'package:kokuchi_event/presentation/widget/event_detail/event_detail.dart';
import 'package:kokuchi_event/presentation/widget/login_check.dart';
import 'package:kokuchi_event/presentation/widget/navigation.dart';
import 'package:kokuchi_event/presentation/widget/post/confirm/confirm.dart';
import 'package:kokuchi_event/presentation/widget/privacy_policy.dart';
import 'package:kokuchi_event/presentation/widget/setting/account/account_info.dart';
import 'package:kokuchi_event/presentation/widget/setting/account/block_user/block_user_info.dart';
import 'package:kokuchi_event/presentation/widget/setting/developer/request.dart';
import 'package:kokuchi_event/presentation/widget/terms_of_service.dart';
import 'package:kokuchi_event/presentation/widget/tutorial/user_icon.dart';
import 'package:kokuchi_event/presentation/widget/tutorial/user_info.dart';

class AppRouter {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.loginCheck:
        return MaterialPageRoute<Route>(
            builder: (_) => const FixedTextScaleFactor(child: LoginCheck()));
      case RouteName.login:
        return MaterialPageRoute<Route>(
            builder: (_) => const FixedTextScaleFactor(child: Login()));
      case RouteName.tutorialUserInfo:
        return MaterialPageRoute<Route>(
            builder: (_) => FixedTextScaleFactor(child: TutorialUserInfo()));
      case RouteName.tutorialUserIcon:
        return MaterialPageRoute<Route>(
            builder: (_) =>
                const FixedTextScaleFactor(child: TutorialUserIcon()));
      case RouteName.navigation:
        return MaterialPageRoute<Route>(
            builder: (_) => const FixedTextScaleFactor(child: Navigation()));
      case RouteName.home:
        return MaterialPageRoute<Route>(
            builder: (_) => const FixedTextScaleFactor(child: Home()));
      case RouteName.post:
        return MaterialPageRoute<Route>(
            builder: (_) => const FixedTextScaleFactor(child: Post()));
      case RouteName.postConfirm:
        final postConfirmArg = settings.arguments as List<dynamic>;
        return MaterialPageRoute<Route>(
            builder: (_) => FixedTextScaleFactor(
                    child: PostConfirm(
                  state: postConfirmArg[0] as MyEventEditState,
                  stateNotifier: postConfirmArg[1] as MyEventEditStateNotifier,
                )));
      case RouteName.myPage:
        return MaterialPageRoute<Route>(
            builder: (_) => const FixedTextScaleFactor(child: MyPage()));
      case RouteName.myPageEdit:
        return MaterialPageRoute<Route>(
            builder: (_) => FixedTextScaleFactor(child: MyPageEdit()));
      case RouteName.setting:
        return MaterialPageRoute<Route>(
            builder: (_) => FixedTextScaleFactor(child: Setting()));
      case RouteName.settingDeveloperRequest:
        return MaterialPageRoute<Route>(
            builder: (_) =>
                FixedTextScaleFactor(child: SettingDeveloperRequest()));
      case RouteName.term:
        return MaterialPageRoute<Route>(
            builder: (_) =>
                const FixedTextScaleFactor(child: TermsOfService()));
      case RouteName.privacyPolicy:
        return MaterialPageRoute<Route>(
            builder: (_) => const FixedTextScaleFactor(child: PrivacyPolicy()));
      case RouteName.accountInfo:
        return MaterialPageRoute<Route>(
            builder: (_) => const FixedTextScaleFactor(child: AccountInfo()));
      case RouteName.settingBlockUser:
        return MaterialPageRoute<Route>(
            builder: (_) => FixedTextScaleFactor(child: BlockUserInfo()));
      case RouteName.searchResult:
        return MaterialPageRoute<Route>(
            builder: (_) => const FixedTextScaleFactor(child: SearchResult()));
      case RouteName.imageShow:
        final imageShowArg = settings.arguments as List;
        return MaterialPageRoute<Route>(
            builder: (_) => FixedTextScaleFactor(
                    child: ImageShow(
                  imageUrl: imageShowArg[0] as String,
                  imageFile: imageShowArg[1] as File,
                )));
      case RouteName.eventDetail:
        final eventDetailArg = settings.arguments as EventDto;
        return MaterialPageRoute<bool>(
            builder: (_) => FixedTextScaleFactor(
                child: EventDetail(eventDto: eventDetailArg)));
      case RouteName.otherUserPage:
        final otherUserPageArg = settings.arguments as UserDto;
        return MaterialPageRoute<bool>(
            builder: (_) => FixedTextScaleFactor(
                child: OtherUserPage(userDto: otherUserPageArg)));
      case RouteName.postEdit:
        final postEditArg = settings.arguments as EventDetailState;
        return MaterialPageRoute<Route>(
            builder: (_) => FixedTextScaleFactor(
                child: PostEdit(eventDetailData: postEditArg)));
      default:
        return MaterialPageRoute<Route>(
            builder: (_) =>
                const FixedTextScaleFactor(child: SizedBox.shrink()));
    }
  }
}
