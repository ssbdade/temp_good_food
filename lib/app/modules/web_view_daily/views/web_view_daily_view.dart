import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../controllers/web_view_daily_controller.dart';

class WebViewDailyView extends GetView<WebViewDailyController> {
  const WebViewDailyView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('WebViewDailyView'),
        centerTitle: true,
      ),
      body: WebViewWidget(
        controller: controller.webController,
      ),
    );
  }
}
