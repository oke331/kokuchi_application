import 'package:flutter/cupertino.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:kokuchi_event/presentation/notifier/event/home_network/home_network_state.dart';
import 'package:provider/provider.dart';

class HomeNoInternet extends StatelessWidget {
  const HomeNoInternet();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        const SizedBox(height: 20),
        const Text('ネットワーク接続を確認してください！'),
        GestureDetector(
          child: const Icon(
            Icons.refresh,
            color: Colors.grey,
          ),
          onTap: () => _onTap(context),
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  Future<void> _onTap(BuildContext context) async {
    await context.read<HomeNetworkStateNotifier>().networkStateCheck();
  }
}
