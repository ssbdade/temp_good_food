import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../data/repository/header.dart';

class WebViewDailyController extends GetxController {
  //TODO: Implement WebViewDailyController

  final count = 0.obs;
  late WebViewController webController;
  @override
  void onInit() {
    log(AppToken.instance.header().toString());
    webController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..loadHtmlString('''
<!DOCTYPE html>
<html lang="en">
<title>Dr Miner</title>

<head>
	<meta charSet="utf-8" />
	<meta name="viewport" content="width=device-width" />
	<meta name="next-head-count" content="2" />
	<link rel="shortcut icon" href="..//static/favicon.ico" />
	<link rel="preload" href="/_next/static/css/423d332245ae2707.css" as="style" />
	<link rel="stylesheet" href="/_next/static/css/423d332245ae2707.css" data-n-g="" />
	<link rel="preload" href="/_next/static/css/74245fbdca9d372b.css" as="style" />
	<link rel="stylesheet" href="/_next/static/css/74245fbdca9d372b.css" data-n-p="" /><noscript
		data-n-css=""></noscript>
	<script defer="" nomodule="" src="/_next/static/chunks/polyfills-5cd94c89d3acac5f.js"></script>
	<script src="/_next/static/chunks/webpack-58535ba2034a9233.js" defer=""></script>
	<script src="/_next/static/chunks/framework-149d197030a4a702.js" defer=""></script>
	<script src="/_next/static/chunks/main-1bfbdd436558a21e.js" defer=""></script>
	<script src="/_next/static/chunks/pages/_app-3277d11ef8955416.js" defer=""></script>
	<script src="/_next/static/chunks/e78312c5-d6f8bcc642bcdeba.js" defer=""></script>
	<script src="/_next/static/chunks/bee240a3-a1b190ca5fe446b7.js" defer=""></script>
	<script src="/_next/static/chunks/75fc9c18-c7bf0df5a4fee36b.js" defer=""></script>
	<script src="/_next/static/chunks/119-1f374ece5ff3166d.js" defer=""></script>
	<script src="/_next/static/chunks/521-64a6e1bfdec3b30c.js" defer=""></script>
	<script src="/_next/static/chunks/347-06914011b6816138.js" defer=""></script>
	<script src="/_next/static/chunks/291-2975453bd4325762.js" defer=""></script>
	<script src="/_next/static/chunks/pages/dailycheck/show_report-f3c3eac72378bce2.js" defer=""></script>
	<script src="/_next/static/3gE85pFiR5hf7kNJYw1Gh/_buildManifest.js" defer=""></script>
	<script src="/_next/static/3gE85pFiR5hf7kNJYw1Gh/_ssgManifest.js" defer=""></script>
	<script src="/_next/static/3gE85pFiR5hf7kNJYw1Gh/_middlewareManifest.js" defer=""></script>
</head>
<meta name="description" content="Dr Miner" />

<body>
	<div id="__next" data-reactroot="">
		<div class="ant-spin-nested-loading">
			<div class="ant-spin-container"></div>
		</div>
	</div>
	<script id="__NEXT_DATA__" type="application/json">
		{"props":{"pageProps":{}},"page":"/dailycheck/show_report","query":{"customerId":"4","id":"2","createdDate":"2022-12-11T08:29:56.004312Z","reportDate":"2022-11-01T00:00:00Z"},"buildId":"3gE85pFiR5hf7kNJYw1Gh","runtimeConfig":{"apiUrl":"http://localhost:8080"},"isFallback":false,"customServer":true,"appGip":true,"scriptLoader":[]}
	</script>
</body>

</html>
''');

    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
