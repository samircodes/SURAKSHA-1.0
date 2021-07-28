import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class More extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(

        body: WebView(
          initialUrl: 'https://www.udemy.com',
          javascriptMode: JavascriptMode.unrestricted,
        )
      ),
    );
  }
}