import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Webviepayment extends StatelessWidget {
  String path;
   Webviepayment({Key? key, required this.path}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child:WebView(
          key: UniqueKey(), // Use a UniqueKey here
          javascriptMode: JavascriptMode.unrestricted, // Enable JavaScript
          initialUrl: path, // Your URL logic here
        ),
      ),
    );
  }
}

