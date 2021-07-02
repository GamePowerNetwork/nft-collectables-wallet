import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:lootbox_wallet/pages/shell/shell.page.dart';
import 'package:loader_overlay/loader_overlay.dart';

class LootBoxApp extends StatefulWidget {
  LootBoxApp({Key? key}) : super(key: key);

  @override
  _LootBoxAppState createState() => _LootBoxAppState();
}

class _LootBoxAppState extends State<LootBoxApp> {

  static FirebaseAnalytics analytics = FirebaseAnalytics();
  static FirebaseAnalyticsObserver observer =
      FirebaseAnalyticsObserver(analytics: analytics);

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
      overlayColor: Colors.red,
      overlayOpacity: 0.4,
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
        navigatorObservers: [observer],
        initialRoute: '/',
        routes: {
          '/': (context) => ShellPage(),
        },
      ),
    );
  }
}
