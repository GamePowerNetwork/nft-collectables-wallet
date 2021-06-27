import 'package:flutter/material.dart';
import 'package:gamepower_wallet/providers/collectibles_provider.dart';
import 'package:gamepower_wallet/providers/collections_provider.dart';
import 'package:gamepower_wallet/providers/network_provider.dart';
import 'pages/home_page/home_page.dart';
import 'package:provider/provider.dart';

void main() => runApp(
  MultiProvider(
    providers: [
      ChangeNotifierProvider<NetworkProvider>(create: (_) => NetworkProvider()),
      ChangeNotifierProvider<Collections>(create: (_) => Collections()),
      ChangeNotifierProvider<Collectibles>(create: (_) => Collectibles()),
    ],
    child: MyApp(),
  )
);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LootBox Wallet',
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        backgroundColor: Colors.grey[900],
      ),
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.blue[800],
        accentColor: Colors.blue[400],
        scaffoldBackgroundColor: Color(0xFFF3F5F7),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        floatingActionButtonTheme: 
          FloatingActionButtonThemeData(),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
      },
    );
  }
}