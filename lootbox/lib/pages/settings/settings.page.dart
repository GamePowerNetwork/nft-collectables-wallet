import 'package:flutter/material.dart';
import 'package:lootbox_wallet/common/components/PageBase.dart';
import 'package:lootbox_wallet/state/app.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatefulWidget {
  @override
  SettingsPageState createState() => SettingsPageState();
}

class SettingsPageState extends State<SettingsPage> {
  Widget build(BuildContext context) {
    AppState appState = Provider.of<AppState>(context);
    
    return PageBase(
      pageOptions: PageBaseOptions(
        title: "Settings",
        headerIcon: Icons.settings,
        pageColor: appState.pageColor,
      ),
      child: Column(
          children: [
            ElevatedButton(
              child: Text("Sign Out"),
              onPressed: () => appState.signOut(),
            ),
          ],
        )
      );
  }
}