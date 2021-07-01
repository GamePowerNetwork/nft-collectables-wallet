import 'dart:convert';

import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:gamepower_wallet/data/model/channels/Channel.dart';
import 'package:jaguar/jaguar.dart';
import 'package:jaguar_flutter_asset/jaguar_flutter_asset.dart';

class WebViewService {
  HeadlessInAppWebView? _web;
  Map<String, List<Function>> channelSubscriptions = new Map<String, List<Function>>();

  Future<void> init() async {
    if (_web == null) {
      await _startServer();

      _web = new HeadlessInAppWebView(
        initialOptions:
            InAppWebViewGroupOptions(crossPlatform: InAppWebViewOptions()),
        onWebViewCreated: (controller) =>
            _createChannelHandlers(),
        onConsoleMessage: (controller, consoleMessage) {
          print("WebService Debug: " + consoleMessage.message);
          final jsonDecoder = JsonDecoder();
          final Map<String, dynamic> message = jsonDecoder.convert(consoleMessage.message);

          if(message['name'] != null) {
            _onChannelMessage(message);
          }
        },
        onLoadHttpError: (controller, url, statusCode, description) =>
            print(description),
        onLoadError: (controller, url, code, message) => print(message),
        onReceivedServerTrustAuthRequest: (controller, challenge) async {
          return ServerTrustAuthResponse(action: ServerTrustAuthResponseAction.PROCEED);
        }
      );

      await _web?.run();
      _web?.webViewController.loadUrl(
        urlRequest:
            URLRequest(url: Uri.parse("http://localhost:8080/api/")),
      );
    }
  }

  void subscribeToChannel(String name, Function callback) {
    if(channelSubscriptions[name] == null) {
      channelSubscriptions[name] = <Function>[callback];
    } else {
      channelSubscriptions[name]?.add(callback);
    }
  }

  Future<void> _startServer() async {
    final server = Jaguar();
    server.addRoute(serveFlutterAssets());
    await server.serve(logRequests: false);
  }

  void _createChannelHandlers() {
    //_web?.webViewController.addJavaScriptHandler(handlerName: "onChannelMessage", callback: _onChannelMessage);
  }

  void _onChannelMessage(Map<String, dynamic> message) {
    List<Function> callbacks = channelSubscriptions[message['name'].toString()]!;
    callbacks.forEach((callback) {
      callback(message);
    });
  }

  void request(Map<String, dynamic> json) {
    final jsonEncoder = JsonEncoder();
    final arguments = jsonEncoder.convert(json);
    _web?.webViewController.evaluateJavascript(source: 
    """
      api.request('${json['name']}', '${arguments}');
    """
    );
  }
}
