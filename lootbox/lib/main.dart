import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:lootbox_wallet/lootbox_app.dart';
import 'package:lootbox_wallet/providers/collectibles_provider.dart';
import 'package:lootbox_wallet/providers/collections_provider.dart';
import 'package:lootbox_wallet/providers/network_provider.dart';
import 'package:lootbox_wallet/service/auth.service.dart';
import 'package:lootbox_wallet/service/provider.service.dart';
import 'package:lootbox_wallet/service/storage.service.dart';
import 'package:lootbox_wallet/service/wallet.service.dart';
import 'package:lootbox_wallet/service/web_view.service.dart';
import 'package:lootbox_wallet/state/app.dart';
import 'package:lootbox_wallet/state/keyring.dart';
import 'package:lootbox_wallet/state/wallet.dart';
import 'package:provider/provider.dart';

void main(){ 
  // Bindings
  WidgetsFlutterBinding.ensureInitialized();

  // Locator
  GetIt.I.registerSingleton<WebViewService>(WebViewService());
  GetIt.I.registerSingleton<WalletService>(WalletService());
  GetIt.I.registerSingleton<StorageService>(StorageService());
  GetIt.I.registerSingleton<AuthService>(AuthService());
  GetIt.I.registerSingleton<ProviderService>(ProviderService());

  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider<NetworkProvider>(
            create: (_) => NetworkProvider()),
        ChangeNotifierProvider<Collections>(create: (_) => Collections()),
        ChangeNotifierProvider<Collectibles>(create: (_) => Collectibles()),
        Provider<AppState>(create: (_) => AppState()),
        Provider<Keyring>(create: (_) => Keyring()),
        Provider<WalletState>(create: (_) => WalletState()),
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
