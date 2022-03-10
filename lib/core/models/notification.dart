class NotificationMsg {
  String id;
  DateTime receivedAt;
  String msg;
  bool newMsg;

  NotificationMsg({
    required this.id,
    required this.receivedAt,
    required this.msg,
    required this.newMsg,
  });
}
