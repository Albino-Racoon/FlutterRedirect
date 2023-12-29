import 'package:firebase_messaging/firebase_messaging.dart';

mixin MyFirebaseMessagingService implements FirebaseMessaging {
  Future<void> onNewToken(String token) async {
    // Handle the new token
    // Send the token to your app server or perform any other necessary actions
    print('Refreshed token: $token');
  }

  Future<void> onMessage(RemoteMessage message) async {
    // Handle incoming messages when the app is in the foreground
    // You can show notifications or update UI based on the received message
    print('Received message: ${message.notification?.title}');
  }
}
