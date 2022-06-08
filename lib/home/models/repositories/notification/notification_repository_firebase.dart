import 'dart:io';
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:my_isp/home/models/notification.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class NotificationRepositoryFirebase with ChangeNotifier {
  List<NotificationMsg> _notifications = [];

  List<NotificationMsg> get items {
    return [..._notifications];
  }

  int get itemsCount {
    return _notifications.length;
  }

  void add(NotificationMsg notification) {
    _notifications.add(notification);
    notifyListeners();
  }

  void removeAt(int index) {
    _notifications.removeAt(index);
    notifyListeners();
  }

  // Push notifications
  Future<void> init() async {
    await _configureForeground();
    await _configureBackground();
    await _configureTermited();
  }

  Future<bool> get _isAuthorized async {
    final messaging = FirebaseMessaging.instance;
    final settings = await messaging.requestPermission();
    return settings.authorizationStatus == AuthorizationStatus.authorized;
  }

  void _messageHandler(RemoteMessage? msg) {
    if (msg == null || msg.notification == null) return;

    add(
      NotificationMsg(
          id: Random().nextDouble().toString(),
          receivedAt: DateTime.now(),
          title: msg.notification!.title ?? "Não informado",
          msg: msg.notification!.body ?? "Não informado"),
    );
  }

  Future<void> _configureForeground() async {
    if (await _isAuthorized) {
      FirebaseMessaging.onMessage.listen(_messageHandler);
    }
  }

  Future<void> _configureBackground() async {
    if (await _isAuthorized) {
      FirebaseMessaging.onMessageOpenedApp.listen(_messageHandler);
    }
  }

  Future<void> _configureTermited() async {
    if (await _isAuthorized) {
      RemoteMessage? initialMsg =
          await FirebaseMessaging.instance.getInitialMessage();
      _messageHandler(initialMsg);
    }
  }
}
