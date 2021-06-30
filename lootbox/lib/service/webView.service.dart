import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:gamepower_wallet/data/model/Channel.dart';
import 'package:jaguar/jaguar.dart';
import 'package:jaguar_flutter_asset/jaguar_flutter_asset.dart';

class WebViewService {
  HeadlessInAppWebView? _web;
  Map<String, List<Channel>> channelSubscriptions = new Map<String, List<Channel>>();

  Future<void> init() async {
    if (_web == null) {
      await _startServer();

      _web = new HeadlessInAppWebView(
        initialOptions:
            InAppWebViewGroupOptions(crossPlatform: InAppWebViewOptions()),
        onWebViewCreated: (controller) =>
            _createChannelHandlers(),
        onConsoleMessage: (controller, consoleMessage) {
          print("WebView CONSOLE MESSAGE: " + consoleMessage.message);
        },
        onLoadStop: (controller, url) {
          print('webview loaded');
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

  void subscribeToChannel(Channel channel) {
    if(channelSubscriptions[channel.name] == null) {
      channelSubscriptions[channel.name] = <Channel>[channel];
    } else {
      channelSubscriptions[channel.name]?.add(channel);
    }
  }

  Future<void> _startServer() async {
    final server = Jaguar();
    server.addRoute(serveFlutterAssets());
    await server.serve(logRequests: false);
  }

  void _createChannelHandlers() {
    _web?.webViewController.addJavaScriptHandler(handlerName: "onChannelMessage", callback: _onChannelMessage);
  }

  dynamic _onChannelMessage(args) {
    List<Channel> channels = channelSubscriptions[args[0]['channel'].toString()]!;
    channels.forEach((channel) {
      channel.callback(args[0]['data']);
    });
    return "Hello from Flutter";
  }
}
