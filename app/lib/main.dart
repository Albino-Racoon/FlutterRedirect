import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

void main() {
  runApp(RedirectApp());
}

class RedirectApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Redirect App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: RedirectPage(),
    );
  }
}

class RedirectPage extends StatelessWidget {
  final String redirectUrl = 'https://unikatko.si/';

  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      appBar: AppBar(
        title: Text('Redirect Page'),
      ),
      url: redirectUrl,
    );
  }
}
