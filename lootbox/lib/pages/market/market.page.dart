import 'package:flutter/material.dart';
import 'package:gamepower_wallet/common/components/PageBase.dart';

class MarketPage extends StatefulWidget {
  @override
  MarketPageState createState() => MarketPageState();
}

class MarketPageState extends State<MarketPage> {
  Widget build(BuildContext context) {
    return PageBase(
      pageOptions: PageBaseOptions(
        title: "Market",
        headerIcon: Icons.shopping_basket_rounded,
        headerColor: Colors.teal,
      ),
      child: Container()
      );
  }
}