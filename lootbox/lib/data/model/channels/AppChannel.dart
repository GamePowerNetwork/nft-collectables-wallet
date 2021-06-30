import 'package:gamepower_wallet/data/model/channels/Channel.dart';

class AppChannel extends Channel {
  @override
  final String name = "App";

  AppChannel(dynamic _data) {
    data = _data;
  }
}