import 'package:flutter/material.dart';
import 'package:gamepower_wallet/common/components/PageBase.dart';

class SettingsPage extends StatefulWidget {
  @override
  SettingsPageState createState() => SettingsPageState();
}

class SettingsPageState extends State<SettingsPage> {
  Widget build(BuildContext context) {
    return PageBase(
      pageOptions: PageBaseOptions(
        title: "Settings",
        headerIcon: Icons.settings,
        headerColor: Colors.indigo,
      ),
      child: Container()
      );
  }
}