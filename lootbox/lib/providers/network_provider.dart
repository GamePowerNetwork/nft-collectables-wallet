import 'package:flutter/material.dart';
import 'package:gamepower_wallet/common/models/Network.dart';

class NetworkProvider extends ChangeNotifier {
  Network? selected;

  void selectNetwork(Network network) {
    selected = network;
    notifyListeners();
  }
}