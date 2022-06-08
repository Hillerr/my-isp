import 'dart:math';

import 'package:my_isp/home/models/ilimited_internet.dart';
import 'package:my_isp/home/models/repositories/ilimited_internet/ilimited_internet_repository.dart';

class IlimitedInternetRepositoryMock implements IlimitedInternetRepository {
  static final List<IlimitedInternet> _ilimitedInternet = [
    IlimitedInternet(
      id: Random().nextDouble().toString(),
      dateTime: DateTime.now(),
      duration: const Duration(hours: 6),
      pricePerHour: 0.5,
    )
  ];

  @override
  Future<List<IlimitedInternet>> loadIlimitedInternet() async {
    await Future.delayed(const Duration(seconds: 2));
    print(_ilimitedInternet);
    return [..._ilimitedInternet];
  }

  @override
  Future<int> loadPrice() async {
    await Future.delayed(const Duration(seconds: 2));
    return 50;
  }

  @override
  Future<IlimitedInternetStatus?> loadStatus(
      IlimitedInternet ilimitedInternet) async {
    await Future.delayed(const Duration(seconds: 2));
    return _ilimitedInternet
        .where(
          (element) => element.id == ilimitedInternet.id,
        )
        .first
        .status;
  }

  @override
  Future<int> addIlimitedInternet(IlimitedInternet ilimitedInternet) async {
    _ilimitedInternet.add(ilimitedInternet);
    await Future.delayed(const Duration(seconds: 2));
    return 200;
  }

  @override
  Future<int> cancel(IlimitedInternet ilimitedInternet) async {
    _ilimitedInternet.remove(ilimitedInternet);
    await Future.delayed(const Duration(seconds: 2));
    return 200;
  }
}
