import 'package:flutter/material.dart';
import 'package:gamepower_wallet/common/components/PageBase.dart';
import 'package:gamepower_wallet/common/constants/constants.dart';
import 'package:gamepower_wallet/state/app.dart';
import 'package:provider/provider.dart';

class MarketPage extends StatefulWidget {
  @override
  MarketPageState createState() => MarketPageState();
}

class MarketPageState extends State<MarketPage> {
  late AppState appState;

  Widget build(BuildContext context) {
    appState = Provider.of<AppState>(context);

    return PageBase(
      pageOptions: PageBaseOptions(
        title: "Market",
        headerIcon: Icons.shopping_basket_rounded,
        pageColor: appState.pageColor,
      ),
      child: Container()
      );
  }
}