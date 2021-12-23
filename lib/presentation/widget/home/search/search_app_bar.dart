import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:kokuchi_event/presentation/widget/home/search/search.dart';

class SearchAppBar extends StatelessWidget {
  const SearchAppBar();

  @override
  Widget build(BuildContext context) {
    final backgroundColor = Theme.of(context).scaffoldBackgroundColor;

    return SliverAppBar(
      bottom: const PreferredSize(
        preferredSize: Size.fromHeight(30), // Add this code
        child: SizedBox.shrink(),
      ),
      backgroundColor: backgroundColor,
      floating: true,
      snap: true,
      flexibleSpace: const FlexibleSpaceBar(
        title: Search(),
        centerTitle: true,
      ),
    );
  }
}
