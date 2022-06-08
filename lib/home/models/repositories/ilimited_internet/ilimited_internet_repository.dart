import 'dart:io';

import 'package:my_isp/home/models/ilimited_internet.dart';
import 'package:my_isp/home/models/repositories/ilimited_internet/ilimited_internet_repository_mock.dart';

abstract class IlimitedInternetRepository {
  Future<List<IlimitedInternet>> loadIlimitedInternet();
  Future<int> loadPrice();
  Future<int> addIlimitedInternet(IlimitedInternet ilimitedInternet);
  Future<IlimitedInternetStatus?> loadStatus(IlimitedInternet ilimitedInternet);
  Future<int> cancel(IlimitedInternet ilimitedInternet);

  factory IlimitedInternetRepository() {
    return IlimitedInternetRepositoryMock();
  }
}
