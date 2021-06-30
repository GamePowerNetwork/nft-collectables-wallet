import 'package:gamepower_wallet/data/model/Channel.dart';

class AppChannel extends Channel {
  @override
  final String name = "App";

  AppChannel(dynamic _data) {
    data = _data;
  }
}