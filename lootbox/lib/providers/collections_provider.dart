import 'package:flutter/material.dart';
import 'package:gamepower_wallet/models/Collection.dart';

class Collections extends ChangeNotifier {
  List<Collection> _collections = [];
  List<Collection> get collections => _collections;

  void setCollections(List<Collection> collections) {
    _collections = collections;
    notifyListeners();
  }
}