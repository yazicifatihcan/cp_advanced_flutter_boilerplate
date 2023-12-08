import 'dart:async';
import 'package:firebase_messaging/firebase_messaging.dart';

///
class FirebaseMessagingService {

  FirebaseMessagingService._init();
  
  late final FirebaseMessaging messaging;

  late final Function(String?,String?) onShowNotication;

    static final FirebaseMessagingService _instance = FirebaseMessagingService._init();

    static FirebaseMessagingService get instance => _instance;

    static Future<void> messagingInit({required Function(String?,String?) showNotification}) async {
      instance.messaging = FirebaseMessaging.instance;
      instance.onShowNotication=showNotification;
    }


  Future<void> listenToNotification() async {
    await messaging.requestPermission();
    FirebaseMessaging.onMessage.listen((message)=>instance.onShowNotication(message.notification!.title!,message.notification!.body!));
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage event) {});
    FirebaseMessaging.onBackgroundMessage((message)=>instance.onShowNotication(message.notification!.title!,message.notification!.body!));
  }


  Future<String?> getToken ()async{
    try {
      final String? token = await messaging.getToken();
      return token;
    } catch (e) {
      return null;
    }
  }
}
