import 'package:flutter/material.dart';
import 'package:gamepower_wallet/common/components/PageBase.dart';

class LootDropPage extends StatefulWidget {
  @override
  LootDropPageState createState() => LootDropPageState();
}

class LootDropPageState extends State<LootDropPage> {
  Widget build(BuildContext context) {
    return PageBase(
      pageOptions: PageBaseOptions(
        title: "Loot Drops",
        headerIcon: Icons.stars,
        headerColor: Colors.red,
      ),
      child: Container(),
    );
  }
}
