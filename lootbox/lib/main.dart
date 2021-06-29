import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:gamepower_wallet/common/components/api/api.provider.dart';
import 'package:gamepower_wallet/pages/onboarding/onboarding.page.dart';
import 'package:gamepower_wallet/providers/collectibles_provider.dart';
import 'package:gamepower_wallet/providers/collections_provider.dart';
import 'package:gamepower_wallet/providers/network_provider.dart';
import 'package:gamepower_wallet/state/api.dart';
import 'package:provider/provider.dart';
import 'package:loader_overlay/loader_overlay.dart';

void main() => runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider<NetworkProvider>(
            create: (_) => NetworkProvider()),
        ChangeNotifierProvider<Collections>(create: (_) => Collections()),
        ChangeNotifierProvider<Collectibles>(create: (_) => Collectibles()),
        ChangeNotifierProvider<ApiProvider>(create: (_) => ApiProvider()),
        Provider<ApiStore>(create: (_) => ApiStore()),
      ],
      child: MyApp(),
    ));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GlobalLoaderOverlay(
      useDefaultLoading: false,
      overlayWidget: Center(
        child: SpinKitCubeGrid(
          color: Colors.red,
          size: 70.0,
        ),
      ),
      overlayColor: Colors.black,
      overlayOpacity: 0.8,
      child: MaterialApp(
        title: 'LootBox Wallet',
        debugShowCheckedModeBanner: false,
        darkTheme: ThemeData(
          brightness: Brightness.dark,
          backgroundColor: Colors.grey[900],
        ),
        theme: ThemeData(
          primarySwatch: Colors.red,
          primaryColor: Colors.deepPurple[800],
          accentColor: Colors.purple[400],
          scaffoldBackgroundColor: Color(0xFFF3F5F7),
          visualDensity: VisualDensity.adaptivePlatformDensity,
          floatingActionButtonTheme: FloatingActionButtonThemeData(),
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => OnBoardingPage(),
        },
      ),
    );
  }
}
