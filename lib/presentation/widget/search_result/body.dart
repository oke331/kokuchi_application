import 'package:flutter/cupertino.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:kokuchi_event/presentation/notifier/search_result_state/search_result_state.dart';
import 'package:kokuchi_event/presentation/share/filter_block_user.dart';
import 'package:kokuchi_event/presentation/widget/common/center_loading.dart';
import 'package:kokuchi_event/presentation/widget/common/toast.dart';
import 'package:kokuchi_event/presentation/widget/event_list/card.dart';
import 'package:kokuchi_event/presentation/widget/event_list/list/vertical_list.dart';
import 'package:kokuchi_event/presentation/widget/search_result/app_bar/sliver_app_bar.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:provider/provider.dart';

class SearchResultBody extends StatelessWidget {
  SearchResultBody();

  final _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    // スクロールしたことを検知
    _scrollController.addListener(() async {
      await _scrollListener(context);
    });

    return ModalProgressHUD(
      progressIndicator: const CenterLoading(),
      inAsyncCall: !context.select((SearchResultState value) => value.init),
      child: SafeArea(
        child: CustomScrollView(
          controller: _scrollController,
          slivers: <Widget>[
            const SearchResultSliverAppBar(),
            _searchResultEventList(context)
          ],
        ),
      ),
    );
  }

  Widget _searchResultEventList(BuildContext context) {
    final init = context.select((SearchResultState value) => value.init);

    if (!init) {
      return SliverList(
        delegate: SliverChildListDelegate(
          <Widget>[
            const SizedBox.shrink(),
          ],
        ),
      );
    }

    final events = FilterBlockUser.filterBlockUserFromEventDtos(
        context, context.select((SearchResultState value) => value.eventDtos));
    if (events == null || events.isEmpty) {
      commonToast(msg: '検索結果がありませんでした');
      WidgetsBinding.instance
          .addPostFrameCallback((_) => Navigator.pop(context));
      return SliverList(
        delegate: SliverChildListDelegate(
          <Widget>[
            const SizedBox.shrink(),
          ],
        ),
      );
    }

    return SliverList(
      delegate: SliverChildListDelegate(
        <Widget>[
          Stack(
            alignment: Alignment.center,
            children: <Widget>[
              EventVerticalList(
                events: events,
                eventEditPop: EventEditPop.searchResult,
              ),
              context.select((SearchResultState value) => value.isLoading)
                  ? const Positioned(
                      bottom: 20,
                      child: CenterLoading(),
                    )
                  : const SizedBox.shrink(),
            ],
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Future<void> _scrollListener(BuildContext context) async {
    if (_scrollController.offset >=
            _scrollController.position.maxScrollExtent &&
        !_scrollController.position.outOfRange) {
      await context.read<SearchResultStateNotifier>().fetch();
    }
  }
}
