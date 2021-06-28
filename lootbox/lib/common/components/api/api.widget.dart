import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gamepower_wallet/common/components/api/api.notification.dart';
import 'package:gamepower_wallet/common/components/api/api.provider.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class ApiWidget extends StatefulWidget {
  final Widget child;

  ApiWidget({required this.child});
  @override
  _ApiWidgetState createState() => _ApiWidgetState();
}

class _ApiWidgetState extends State<ApiWidget> {
  late WebViewController _controller;

  void initState() {
    super.initState();

    () async {
      await Future.delayed(Duration.zero);
      
    }();
  }

  Widget build(BuildContext context) {
    return NotificationListener<ApiRequestNotification>(
      onNotification: (ApiRequestNotification notification) {
        _callApi(notification.request.toString());
        return true;
      },
      child: Column(
        children: [_buildWebView(), Flexible(child: widget.child)],
      ),
    );
  }

  Widget _buildWebView() {
    return Visibility(
      visible: false,
      maintainState: true,
      child: SizedBox(
        height: 1,
        child: WebView(
          initialUrl: "about:blank",
          onWebViewCreated: (WebViewController controller) {
            _controller = controller;
            context.read<ApiProvider>().apiLoading();
            _loadLocalHtmlFile();
          },
          onPageFinished: (String url) {
            print('Page finished loading: $url');
          },
          javascriptMode: JavascriptMode.unrestricted,
          javascriptChannels: <JavascriptChannel>[
            _apiReadyChannel(context),
            _apiResultChannel(context),
          ].toSet(),
        ),
      ),
    );
  }

  JavascriptChannel _apiReadyChannel(BuildContext context) {
    return JavascriptChannel(
        name: 'ApiReady',
        onMessageReceived: (JavascriptMessage msg) async {
          context.read<ApiProvider>().apiConnected();
        });
  }

  JavascriptChannel _apiResultChannel(BuildContext context) {
    return JavascriptChannel(
        name: 'ApiResult',
        onMessageReceived: (JavascriptMessage msg) async {
          context.read<ApiProvider>().setResponse(msg.message);
        });
  }

  _loadLocalHtmlFile() async {
    String fileText = await rootBundle.loadString('assets/web/api.html');
    _controller.loadUrl(Uri.dataFromString(fileText,
            mimeType: 'text/html', encoding: Encoding.getByName('utf-8'))
        .toString());
  }

  _callApi(String method) async {
    await _controller.evaluateJavascript(method);
  }
}
