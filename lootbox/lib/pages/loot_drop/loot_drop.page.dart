import 'package:flutter/material.dart';
import 'package:gamepower_wallet/common/components/PageBase.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:gamepower_wallet/state/app.dart';
import 'package:gamepower_wallet/state/keyring.dart';
import 'package:provider/provider.dart';

class LootDropPage extends StatefulWidget {
  @override
  LootDropPageState createState() => LootDropPageState();
}

class LootDropPageState extends State<LootDropPage> {
  Widget build(BuildContext context) {
    AppState appState = Provider.of<AppState>(context);
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
        ],
      ),
    );
  }
}
