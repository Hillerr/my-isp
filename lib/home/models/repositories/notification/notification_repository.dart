import 'dart:math';

import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:my_isp/home/models/notification.dart';

class NotificationService with ChangeNotifier {
  static final List<NotificationMsg> _notificationList = [
    NotificationMsg(
      id: Random().nextDouble().toString(),
      receivedAt: DateTime.now(),
      title: "Primeira notificação",
      msg: "Primeira notificação",
      newMsg: true,
    ),
    NotificationMsg(
      id: Random().nextDouble().toString(),
      receivedAt: DateTime.now(),
      title: "Segunda notificação",
      msg: "Segunda notificação",
      newMsg: true,
    ),
    NotificationMsg(
      id: Random().nextDouble().toString(),
      receivedAt: DateTime.now(),
      title: "Terceira notificação",
      msg: "Terceira notificação",
      newMsg: true,
    ),
  ];

  List<NotificationMsg> get items {
    return [..._notificationList];
  }

  int get itemsCount {
    return _notificationList.length;
  }

  void add(NotificationMsg notification) {
    _notificationList.add(notification);
    notifyListeners();
  }

  void removeAt(int index) {
    _notificationList.removeAt(index);
    notifyListeners();
  }

  void toggleReadMsgs() {
    for (var element in _notificationList) {
      if (element.read) element.newMsg = false;
      element.read = true;
    }
  }
}
