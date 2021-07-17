import 'package:flutter/material.dart';
import 'package:lootbox_wallet/common/constants/constants.dart';
import 'package:lootbox_wallet/pages/collectibles/collections.page.dart';
import 'package:lootbox_wallet/pages/loot_drop/loot_drop.page.dart';
import 'package:lootbox_wallet/pages/market/market.page.dart';
import 'package:lootbox_wallet/pages/settings/settings.page.dart';
import 'package:lootbox_wallet/providers/network_provider.dart';
import 'package:lootbox_wallet/state/app.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:provider/provider.dart';

class TabView extends StatefulWidget {
  TabView({Key? key}) : super(key: key);

  @override
  _TabViewState createState() => _TabViewState();
}

class _TabViewState extends State<TabView> {
  late AppState appState;

  List<PersistentBottomNavBarItem> _navBarsItems(
      BuildContext context, MaterialColor pageColor) {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(Icons.stars),
        activeColorPrimary: kLootPageColor,
        inactiveColorPrimary: Colors.grey,
        iconSize: 40,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.collections_sharp),
        activeColorPrimary: context.watch<NetworkProvider>().selected?.color ??
            kCollectionsPageColor,
        inactiveColorPrimary: Colors.grey,
        inactiveColorSecondary: Colors.purple,
        iconSize: 40,
      ),
      PersistentBottomNavBarItem(
        title: ("Scanner"),
        icon: Icon(Icons.qr_code),
        activeColorPrimary: pageColor,
        activeColorSecondary: Colors.white,
        inactiveColorPrimary: pageColor,
        iconSize: 40,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.shopping_basket_rounded),
        activeColorPrimary: kMarketPageColor,
        inactiveColorPrimary: Colors.grey,
        iconSize: 40,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.settings),
        activeColorPrimary: kSettingsPageColor,
        inactiveColorPrimary: Colors.grey,
        iconSize: 40,
      ),
    ];
  }
  
  @override
  Widget build(BuildContext context) {
    appState = Provider.of<AppState>(context);
    
    return PersistentTabView(context,
        screens: [
          LootDropPage(),
          CollectionsPage(),
          Container(),
          MarketPage(),
          SettingsPage(),
        ],
        items: _navBarsItems(context, appState.pageColor),
        confineInSafeArea: true,
        backgroundColor: Colors.grey[200]!,
        handleAndroidBackButtonPress: true,
        resizeToAvoidBottomInset: true,
        stateManagement: false,
        onItemSelected: (int index) {
          setState(() {});
          late MaterialColor color;
          switch(index) {
            case 0:
              color = kLootPageColor;
              break;
            case 1:
              color = kCollectionsPageColor;
              break;
            case 3:
              color = kMarketPageColor;
              break;
            case 4:
              color = kSettingsPageColor;
              break;
            default:
              color = kDefaultAppBarColor;

          }
          appState.pageColor = color;
        },
        navBarHeight: MediaQuery.of(context).viewInsets.bottom > 0
            ? 0.0
            : kBottomNavigationBarHeight,
        hideNavigationBarWhenKeyboardShows: true,
        decoration: NavBarDecoration(
          borderRadius: BorderRadius.circular(15.0),
          colorBehindNavBar: Colors.white,
        ),
        popAllScreensOnTapOfSelectedTab: true,
        popActionScreens: PopActionScreensType.all,
        itemAnimationProperties: ItemAnimationProperties(
          // Navigation Bar's items animation properties.
          duration: Duration(milliseconds: 200),
          curve: Curves.ease,
        ),
        navBarStyle: NavBarStyle.style16);
  }
}