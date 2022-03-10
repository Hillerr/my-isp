import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:my_isp/core/models/notification.dart';
import 'package:my_isp/utils/urls.dart';

class NotificationList with ChangeNotifier {
  List<NotificationMsg> _notificationList = [];
  final String _token;
  final String _uid;

  NotificationList(this._token, this._uid, this._notificationList);

  List<NotificationMsg> get items {
    return [..._notificationList];
  }

  int get itemsCount {
    return _notificationList.length;
  }

  Future<void> loadNotifications() async {
    List<NotificationMsg> notifications = [];
    final response = await http.get(
      Uri.parse('${Urls.notifications}/$_uid.json?auth=$_token'),
    );

    if (response.body == 'null') return;

    List<dynamic> data = jsonDecode(response.body);

    for (var notificationData in data) {
      if (notificationData != null) {
        notifications.add(NotificationMsg(
          id: '1',
          receivedAt:
              DateFormat("dd/MM/yyyy").parse(notificationData['receivedAt']),
          msg: notificationData['msg'],
          newMsg: notificationData['newMsg'],
        ));
      }
    }

    _notificationList = notifications.reversed.toList();
    notifyListeners();
  }

  void toggleReadMsgs() {
    _notificationList.forEach((element) {
      if (element.newMsg) element.newMsg = false;
    });
  }
}
