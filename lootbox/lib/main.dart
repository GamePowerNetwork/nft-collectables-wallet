import 'package:flutter/material.dart';
import 'package:lootbox_wallet/lootbox_app.dart';
import 'package:lootbox_wallet/providers/collectibles_provider.dart';
import 'package:lootbox_wallet/providers/collections_provider.dart';
import 'package:lootbox_wallet/providers/network_provider.dart';
import 'package:lootbox_wallet/state/app.dart';
import 'package:lootbox_wallet/state/keyring.dart';
import 'package:lootbox_wallet/state/phrase.dart';
import 'package:provider/provider.dart';

void main(){ 
  // Bindings
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider<NetworkProvider>(
            create: (_) => NetworkProvider()),
        ChangeNotifierProvider<Collections>(create: (_) => Collections()),
        ChangeNotifierProvider<Collectibles>(create: (_) => Collectibles()),
        Provider<AppState>(create: (_) => AppState()),
        Provider<Keyring>(create: (_) => Keyring()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LootBoxApp();
  }
}
