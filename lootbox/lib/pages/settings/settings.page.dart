import 'package:flutter/material.dart';
import 'package:gamepower_wallet/common/components/MainAppBar.dart';

class SettingsPage extends StatefulWidget {
  @override
  SettingsPageState createState() => SettingsPageState();
}

class SettingsPageState extends State<SettingsPage> {
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: CustomScrollView(slivers: <Widget>[
          MainAppBar(
            context: this.context,
            title: 'Settings',
            expandedHeight: 300.0,
            color: Colors.indigo,
            icon: Icons.settings,
          ),
        ]),
      ),
    );
  }
}