import 'package:firebase_core/firebase_core.dart';
import 'MyFirebaseMessagingService.dart';
import 'firebase_options.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Request permission for notifications
  await FirebaseMessaging.instance.requestPermission();

  // Retrieve the registration token
  String? token = await FirebaseMessaging.instance.getToken();

  // Print the token to the console
  print('Registration token: $token');

  runApp(RedirectApp());

  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    // Handle the received message when the app is in the foreground
    // You can display a notification or update UI based on the message
    print('Received message in foreground: ${message.notification?.title}');
  });

  FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
    // Handle the received message when the app is opened from a terminated state
    // You can navigate to a specific screen or perform any desired action
    print('Opened app from terminated state: ${message.notification?.title}');
  });
}

//void main() {
//runApp(RedirectApp());
//}

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
  // You can show notifications or perform other background tasks
  print('Received message in background: ${message.notification?.title}');
}
