class NotificationMsg {
  String id;
  DateTime receivedAt;
  String msg;
  String title;
  bool newMsg;
  bool read;

  NotificationMsg({
    required this.id,
    required this.receivedAt,
    required this.title,
    required this.msg,
    this.newMsg = true,
    this.read = false,
  });
}
