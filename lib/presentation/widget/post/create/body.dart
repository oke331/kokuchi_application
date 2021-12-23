import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:kokuchi_event/application/event_app_service.dart';
import 'package:kokuchi_event/common/color.dart';
import 'package:kokuchi_event/domain/event/event_repository_base.dart';
import 'package:kokuchi_event/infrastructure/event/event_factory.dart';
import 'package:kokuchi_event/presentation/notifier/event/event_detail/event_detail_state.dart';
import 'package:kokuchi_event/presentation/notifier/event/my_event_edit/my_event_edit_state.dart';
import 'package:kokuchi_event/presentation/widget/common/leading.dart';
import 'package:kokuchi_event/presentation/widget/post/create/category.dart';
import 'package:kokuchi_event/presentation/widget/post/create/category_online.dart';
import 'package:kokuchi_event/presentation/widget/post/create/confirm_button.dart';
import 'package:kokuchi_event/presentation/widget/post/create/date_time.dart';
import 'package:kokuchi_event/presentation/widget/post/create/email.dart';
import 'package:kokuchi_event/presentation/widget/post/create/headline.dart';
import 'package:kokuchi_event/presentation/widget/post/create/join_url.dart';
import 'package:kokuchi_event/presentation/widget/post/create/main_image.dart';
import 'package:kokuchi_event/presentation/widget/post/create/official_page_url.dart';
import 'package:kokuchi_event/presentation/widget/post/create/phone_number.dart';
import 'package:kokuchi_event/presentation/widget/post/create/sub_images.dart';
import 'package:kokuchi_event/presentation/widget/post/create/text.dart';
import 'package:kokuchi_event/presentation/widget/post/create/title.dart';
import 'package:kokuchi_event/presentation/widget/post/create/tool.dart';
import 'package:kokuchi_event/presentation/widget/post/create/venue.dart';
import 'package:provider/provider.dart';

class PostBody extends StatelessWidget {
  const PostBody(
      {EventDetailState eventDetailData,
      @required GlobalKey<FormState> formKey})
      : _eventDetailData = eventDetailData,
        _formKey = formKey;

  final GlobalKey<FormState> _formKey;
  final EventDetailState _eventDetailData;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: StateNotifierProvider<MyEventEditStateNotifier, MyEventEditState>(
        create: (_) => MyEventEditStateNotifier(
          app: EventAppService(
            factory: const EventFactory(),
            repository: context.read<EventRepositoryBase>(),
          ),
          eventDetailData: _eventDetailData,
        ),
        builder: (context, child) {
          final online =
              context.select((MyEventEditState value) => value.online);

          final init = context.select((MyEventEditState value) => value.init);

          // 確認画面で投稿後、ビルドし直す
          final isClear =
              context.select((MyEventEditState value) => value.isClear);
          if (isClear) clearWidget(context);

          return NestedScrollView(
            headerSliverBuilder: (context, _) {
              final isEdit =
                  context.select((MyEventEditState value) => value.isEdit);

              return <Widget>[
                SliverAppBar(
                  title: isEdit ? const Text('イベント編集') : const Text('イベント投稿'),
                  centerTitle: true,
                  pinned: false,
                  leading: isEdit ? const SliverAppBarBackLeading() : null,
                  backgroundColor: CommonColor.backLightColor,
                )
              ];
            },
            body: (_eventDetailData != null && !init || isClear)
                ? const SizedBox.shrink()
                : Form(
                    key: _formKey,
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          const PostHeadline(text: '*イベントタイトル - 30文字以内'),
                          const SizedBox(height: 7),
                          const PostTitle(),
                          const SizedBox(height: 25),
                          const PostHeadline(text: '*カテゴリー'),
                          const SizedBox(height: 10),
                          const PostCategoryOnline(),
                          const SizedBox(height: 7),
                          const PostCategory(),
                          const SizedBox(height: 25),
                          const PostHeadline(text: '*開催期間'),
                          const SizedBox(height: 10),
                          const PostDateTime(),
                          if (!online) const SizedBox(height: 25),
                          if (!online) const PostHeadline(text: '*開催住所'),
                          if (!online) const SizedBox(height: 7),
                          if (!online) const PostVenue(),
                          if (online) const SizedBox(height: 25),
                          if (online) const PostHeadline(text: 'ツール - 50文字以内'),
                          if (online) const SizedBox(height: 7),
                          if (online) const PostTool(),
                          if (online) const SizedBox(height: 25),
                          if (online) const PostHeadline(text: '参加URL'),
                          if (online) const SizedBox(height: 7),
                          if (online) const PageJoinUrl(),
                          const SizedBox(height: 27),
                          const PostHeadline(text: 'オフィシャルページURL'),
                          const SizedBox(height: 10),
                          const PostOfficialPageUrl(),
                          const SizedBox(height: 27),
                          const PostHeadline(text: '連絡用 電話番号 -ハイフンなし'),
                          const SizedBox(height: 7),
                          const PostPhoneNumber(),
                          const SizedBox(height: 25),
                          const PostHeadline(text: '連絡用 メールアドレス'),
                          const SizedBox(height: 7),
                          const PostEmail(),
                          const SizedBox(height: 25),
                          const PostHeadline(text: 'イベント内容'),
                          const SizedBox(height: 7),
                          const PostText(),
                          const SizedBox(height: 25),
                          const PostHeadline(text: 'メイン画像'),
                          const SizedBox(height: 7),
                          const PostMainImage(),
                          const SizedBox(height: 25),
                          const PostHeadline(text: 'サブ画像 - 3枚まで'),
                          const SizedBox(height: 7),
                          const PostSubImages(),
                          const SizedBox(height: 30),
                          PostConfirmButton(_formKey),
                          const SizedBox(height: 45),
                        ],
                      ),
                    ),
                  ),
          );
        },
      ),
    );
  }

  void clearWidget(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback(
        (_) => context.read<MyEventEditStateNotifier>().isClearFalse());
  }
}
