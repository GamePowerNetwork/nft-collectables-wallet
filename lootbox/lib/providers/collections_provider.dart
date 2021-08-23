import 'package:flutter/material.dart';
import 'package:lootbox_wallet/common/models/collection.dart';

class Collections extends ChangeNotifier {
  List<Collection> _collections = [];
  List<Collection> get collections => _collections;

  void setCollections(List<Collection> collections) {
    _collections = collections;
    notifyListeners();
  }
}