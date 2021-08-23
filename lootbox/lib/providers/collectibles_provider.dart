import 'package:flutter/material.dart';
import 'package:lootbox_wallet/common/models/collectible.dart';

class Collectibles extends ChangeNotifier {
  List<Collectible> _collectibles = [];
  List<Collectible> get collectibles => _collectibles;

  void setCollectibles(List<Collectible> collectibles) {
    _collectibles = collectibles;
    notifyListeners();
  }
}