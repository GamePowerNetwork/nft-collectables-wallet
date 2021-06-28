import 'package:flutter/material.dart';
import 'package:gamepower_wallet/common/models/Network.dart';

class NetworkProvider extends ChangeNotifier {
  Network? _selected;

  Network? get selected => _selected;

  void selectNetwork(Network network) {
    _selected = network;
    notifyListeners();
  }

  void connectNetwork(Network network) {

  }
}