// // ignore_for_file: unnecessary_brace_in_string_interps

// import 'dart:io';

//  import 'package:flutter/material.dart';
// import 'package:shopy/constants.dart';
// import 'package:webview_flutter/webview_flutter.dart';

//  class WebViewExample extends StatefulWidget {
//   const WebViewExample({Key? key}) : super(key: key);

//    @override
//    WebViewExampleState createState() => WebViewExampleState();
//  }

//  class WebViewExampleState extends State<WebViewExample> {
//    @override
//    void initState() {
//      super.initState();
//      // Enable virtual display.
//      if (Platform.isAndroid) WebView.platform = AndroidWebView();
//    }

//    @override
//    Widget build(BuildContext context) {
//      return const WebView(
//        initialUrl: "${serverApi}/admin",
//      );
//    }
//  }