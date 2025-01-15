import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:permission_handler/permission_handler.dart'; // <-- Import the permission handler

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Subscribe all users to the 'global' topic
  await FirebaseMessaging.instance.subscribeToTopic('global');

  // Register the background message handler
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  // Request permission for notifications
  await FirebaseMessaging.instance.requestPermission();

  // Request storage permission <-- New addition
  await _requestStoragePermission();
// aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
  runApp(RedirectApp());

  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    // Handle the received message when the app is in the foreground
    print('Received message in foreground: ${message.notification?.title}');
  });

  FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
    // Handle the received message when the app is opened from a terminated state
    print('Opened app from terminated state: ${message.notification?.title}');
  });
}

Future<void> _requestStoragePermission() async {
  var status = await Permission.storage.status;
  if (!status.isGranted) {
    await Permission.storage.request();
  }
}

class RedirectApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Unikatko',
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
        title: Text('Unikatko'),
      ),
      url: redirectUrl,
    );
  }
}

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // Handle incoming messages when the app is in the background
  print('Received message in background: ${message.notification?.title}');
}
