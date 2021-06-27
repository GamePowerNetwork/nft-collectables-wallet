import 'package:flutter/material.dart';
import 'package:gamepower_wallet/common/components/MainAppBar.dart';

class LootDropPage extends StatefulWidget {
  @override
  LootDropPageState createState() => LootDropPageState();
}

class LootDropPageState extends State<LootDropPage> {
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: CustomScrollView(slivers: <Widget>[
          MainAppBar(
            context: this.context,
            title: 'Loot Drops',
            expandedHeight: 300.0,
            color: Colors.deepOrange,
            icon: Icons.stars,
          ),
        ]),
      ),
    );
  }
}
