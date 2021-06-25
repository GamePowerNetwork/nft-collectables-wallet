import 'package:flutter/material.dart';
import './common/constants.dart';
import './pages/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LootBox Wallet',
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
      theme: ThemeData(
        brightness: Brightness.light,
        accentColor: Colors.orange[400],
        visualDensity: VisualDensity.adaptivePlatformDensity,
        floatingActionButtonTheme: 
          FloatingActionButtonThemeData(
            backgroundColor: Colors.orange[400],
            foregroundColor: const Color(0xFF242430),
          ),
      ),
      home: HomeScreen(),
    );
  }
}