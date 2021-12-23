import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:kokuchi_event/presentation/widget/common/leading.dart';

class SearchResultSliverAppBar extends StatelessWidget {
  const SearchResultSliverAppBar();

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Theme.of(context).backgroundColor,
      leading: const SliverAppBarBackLeading(),
      title: const Text('検索結果'),
      centerTitle: true,
      pinned: true,
    );
  }
}
