import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:lootbox_wallet/common/components/page_base.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:lootbox_wallet/state/app.dart';
import 'package:lootbox_wallet/state/keyring.dart';
import 'package:provider/provider.dart';

class LootDropPage extends StatefulWidget {
  @override
  LootDropPageState createState() => LootDropPageState();
}

class LootDropPageState extends State<LootDropPage> {
  late AppState appState;

  @override
  void initState() {
    super.initState();
    () async {
      await Future.delayed(Duration.zero);

      appState.connect();
    }();
  }

  Widget build(BuildContext context) {
    appState = Provider.of<AppState>(context);
    Keyring keyring = Provider.of<Keyring>(context);

    return PageBase(
      pageOptions: PageBaseOptions(
        title: "Loot Drops",
        headerIcon: Icons.stars,
        pageColor: appState.pageColor,
      ),
      child: Column(
        children: [
          Container(
            child: ElevatedButton(
              child: Text("Send Request"),
              onPressed: () => keyring.requestPhrase(),
            ),
          ),
          Container(
            child: Observer(
              builder: (_) {
                return Text("${keyring.phrase}");
              },
            ),
          ),
          Container(
            child: Observer(
              builder: (_) {
                return Text("${appState.user.name}");
              },
            ),
          ),
        ],
      ),
    );
  }
}
