import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_isp/home/models/ilimited_internet.dart';
import 'package:my_isp/home/models/repositories/ilimited_internet/ilimited_internet_repository.dart';
import 'package:my_isp/home/views/ilimited_internet_form.dart';
import 'package:my_isp/utils/routes.dart';

class IlimitedInternetController with ChangeNotifier {
  static List<IlimitedInternet> _ilimitedInternetList = [];
  final repository = IlimitedInternetRepository();

  List<IlimitedInternet> get ilimitedInternet => [..._ilimitedInternetList];

  String dateTime(IlimitedInternet ilimitedInternet) {
    final item = _ilimitedInternetList
        .where((element) => element.id == ilimitedInternet.id)
        .first;

    return "${item.dateTime.day}/${item.dateTime.month}/${item.dateTime.year} ${item.dateTime.hour}:${item.dateTime.minute}";
  }

  int get itemsCount => _ilimitedInternetList.length;

  Future<List<IlimitedInternet>> load() async {
    _ilimitedInternetList = await repository.loadIlimitedInternet();
    return ilimitedInternet;
  }

  String getStatus(IlimitedInternet ilimtedInternet) {
    switch (ilimtedInternet.status) {
      case IlimitedInternetStatus.CANCELLED:
        return "CANCELADO";
      case IlimitedInternetStatus.CONFIRMED:
        return "CONFIRMADO";
      case IlimitedInternetStatus.FINISHED:
        return "FINALIZADO";
      default:
        return "EM ANÁLISE";
    }
  }

  Future<void> add(
    DateTime dateTime,
    Duration duration,
  ) async {
    final ilimitedInternet = IlimitedInternet(
      id: Random().nextDouble().toString(),
      dateTime: dateTime,
      duration: duration,
      pricePerHour: 50,
    );
    _ilimitedInternetList.add(ilimitedInternet);
    await repository.addIlimitedInternet(ilimitedInternet);
    notifyListeners();
  }

  Future<void> remove(IlimitedInternet ilimitedInternet) async {
    await repository.cancel(ilimitedInternet);
    _ilimitedInternetList = await repository.loadIlimitedInternet();
    notifyListeners();
  }

  Future<void> openForm(BuildContext context) async {
    Navigator.of(context).pop();
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (BuildContext context) => IlimitedInternetForm(
          onAdd: (formdata) {
            final ilimitedInternet = IlimitedInternet(
                id: Random().nextDouble().toString(),
                dateTime: formdata.initialDateTime!,
                duration: Duration(hours: 3),
                pricePerHour: 50);
            repository.addIlimitedInternet(ilimitedInternet);
          },
        ),
      ),
    );
  }

  Future<void> closeForm(BuildContext context) async {
    Navigator.of(context).pop();
    Navigator.of(context).pushNamed(AppRoutes.ILIMITED_INTERNET);
  }
}
