enum IlimitedInternetStatus {
  WAITING,
  CONFIRMED,
  CANCELLED,
  FINISHED,
}

class IlimitedInternet {
  String id;
  DateTime dateTime;
  Duration duration;
  double pricePerHour;
  late double _totalPrice;
  IlimitedInternetStatus status = IlimitedInternetStatus.WAITING;

  IlimitedInternet({
    required this.id,
    required this.dateTime,
    required this.duration,
    required this.pricePerHour,
  }) {
    _totalPrice = pricePerHour * duration.inHours;
  }

  double get totalPrice => _totalPrice;
}
