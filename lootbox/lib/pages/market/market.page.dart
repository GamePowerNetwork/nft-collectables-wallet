import 'package:flutter/material.dart';
import 'package:gamepower_wallet/common/components/MainAppBar.dart';

class MarketPage extends StatefulWidget {
  @override
  MarketPageState createState() => MarketPageState();
}

class MarketPageState extends State<MarketPage> {
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: CustomScrollView(slivers: <Widget>[
          MainAppBar(
            context: this.context,
            title: 'Market',
            expandedHeight: 300.0,
            color: Colors.teal,
            icon: Icons.shopping_basket_rounded,
          ),
        ]),
      ),
    );
  }
}