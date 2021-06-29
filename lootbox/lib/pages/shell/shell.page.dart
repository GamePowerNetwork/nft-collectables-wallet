import 'package:flutter/material.dart';
import 'package:gamepower_wallet/common/components/api/api.widget.dart';
import 'package:gamepower_wallet/common/models/Collection.dart';
import 'package:gamepower_wallet/common/models/Network.dart';
import 'package:gamepower_wallet/pages/loot_drop/loot_drop.page.dart';
import 'package:gamepower_wallet/pages/market/market.page.dart';
import 'package:gamepower_wallet/pages/settings/settings.page.dart';
import 'package:gamepower_wallet/providers/collections_provider.dart';
import 'package:gamepower_wallet/providers/network_provider.dart';
import 'package:gamepower_wallet/state/api.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:provider/provider.dart';
import 'package:gamepower_wallet/pages/collectibles/collections.page.dart';
import 'package:loader_overlay/loader_overlay.dart';

class ShellPage extends StatefulWidget {
  @override
  ShellPageState createState() => ShellPageState();
}

class ShellPageState extends State<ShellPage> {
  void initState() {
    super.initState();
    () async {
      await Future.delayed(Duration.zero);
      context.read<NetworkProvider>().selectNetwork(selectedNetwork);
      context.read<Collections>().setCollections(collections);
    }();
  }

  List<PersistentBottomNavBarItem> _navBarsItems(BuildContext context) {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(Icons.stars),
        activeColorPrimary: Colors.red,
        inactiveColorPrimary: Colors.grey,
        iconSize: 40,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.collections_sharp),
        activeColorPrimary:
            context.watch<NetworkProvider>().selected?.color ?? Colors.blue,
        inactiveColorPrimary: Colors.grey,
        inactiveColorSecondary: Colors.purple,
        iconSize: 40,
      ),
      PersistentBottomNavBarItem(
        title: ("Scanner"),
        icon: Icon(Icons.qr_code),
        activeColorPrimary:
            context.watch<NetworkProvider>().selected?.color ?? Colors.blue,
        activeColorSecondary: Colors.white,
        inactiveColorPrimary:
            context.watch<NetworkProvider>().selected?.color ?? Colors.blue,
        iconSize: 30,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.shopping_basket_rounded),
        activeColorPrimary: Colors.teal,
        inactiveColorPrimary: Colors.grey,
        iconSize: 40,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.settings),
        activeColorPrimary: Colors.indigo,
        inactiveColorPrimary: Colors.grey,
        iconSize: 40,
      ),
    ];
  }

  Widget _buildTabView(BuildContext context) {
    return PersistentTabView(context,
        screens: [
          LootDropPage(),
          CollectionsPage(),
          Container(),
          MarketPage(),
          SettingsPage(),
        ],
        items: _navBarsItems(context),
        confineInSafeArea: true,
        backgroundColor: Colors.grey[200]!,
        handleAndroidBackButtonPress: true,
        resizeToAvoidBottomInset: true,
        stateManagement: true,
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

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<ApiStore>(context);
    return ApiWidget(child: Observer(builder: (_) {
      switch (store.state) {
        case ApiStoreState.initial:
        case ApiStoreState.loading:
          context.loaderOverlay.show();
          return _buildTabView(context);
        case ApiStoreState.loaded:
          context.loaderOverlay.hide();
          return _buildTabView(context);
      }
    }));
  }
}
