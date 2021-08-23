import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:lootbox_wallet/pages/auth/auth.page.dart';
import 'package:lootbox_wallet/pages/onboarding/onboarding.page.dart';
import 'package:lootbox_wallet/common/models/collection.dart';
import 'package:lootbox_wallet/common/models/network.dart';
import 'package:lootbox_wallet/pages/shell/components/tab_view.dart';
import 'package:lootbox_wallet/providers/collections_provider.dart';
import 'package:lootbox_wallet/providers/network_provider.dart';
import 'package:mobx/mobx.dart';
import 'package:lootbox_wallet/state/app.dart';
import 'package:provider/provider.dart';
import 'package:loader_overlay/loader_overlay.dart';

class ShellPage extends StatefulWidget {
  @override
  ShellPageState createState() => ShellPageState();
}

class ShellPageState extends State<ShellPage> {
  late AppState appState;
  late ReactionDisposer _appStateDisposer;

  @override
  void initState() {
    super.initState();
    () async {
      await Future.delayed(Duration.zero);

      if (appState.state == AppCurrentState.initial) {
        appState.initApp();
      }

      context.read<NetworkProvider>().selectNetwork(selectedNetwork);
      context.read<Collections>().setCollections(collections);
    }();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    appState = Provider.of<AppState>(context);
    _appStateDisposer = autorun(
      (_) {
        switch(appState.state) {
          case AppCurrentState.loading:
          case AppCurrentState.initial:
            context.loaderOverlay.show();
            break;
          case AppCurrentState.ready:
            context.loaderOverlay.hide();
        }
      }
    );
  }

  @override 
  void dispose() {
    _appStateDisposer();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Observer(
      builder: (_) {

        print("Login State: ${appState.loginState}");
        print("App State: ${appState.state}");

        if(appState.state != AppCurrentState.ready)
          return Container(color: Colors.black,);
        
        if(appState.loginState == AppLoginState.loggedIn)
          return TabView();

        if(appState.isOnboarding == true)
          return OnBoardingPage();

        return AuthPage();
      }
    );
  }
}