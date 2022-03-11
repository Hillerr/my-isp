import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:my_isp/core/models/internet_plan.dart';
import 'package:my_isp/utils/urls.dart';

class InternetPlanList with ChangeNotifier {
  List<InternetPlan> _internetPlanList = [];
  MyInternetPlan? _myInternetPlan;
  final String _token;
  final String _uid;

  InternetPlanList(this._token, this._uid, this._internetPlanList);

  List<InternetPlan> get items {
    return [..._internetPlanList];
  }

  int get itemsCount {
    return _internetPlanList.length;
  }

  MyInternetPlan? get myInternetPlan {
    return _myInternetPlan;
  }

  int get contractedUpload {
    if (myInternetPlan == null) {
      return 0;
    } else {
      return myInternetPlan!.internetPlan.uploadSpeed;
    }
  }

  int get contractedDownload {
    if (myInternetPlan == null) {
      return 0;
    } else {
      return myInternetPlan!.internetPlan.downloadSpeed;
    }
  }

  Future<MyInternetPlan?> loadContractedPlan() async {
    if (_internetPlanList.isEmpty) await loadPlans();

    final response = await http.get(
      Uri.parse("${Urls.contractedPlan}/$_uid.json?auth=$_token"),
    );

    if (response.body == 'null') return null;

    Map<String, dynamic> data = jsonDecode(response.body);

    _myInternetPlan = MyInternetPlan(
      contractedAt: DateFormat("dd/MM/yyyy").parse(data['contractedAt']),
      equipment: data['equipment'],
      equipmentImage: data['equipmentImage'],
      internetPlan: _internetPlanList
          .where((internetPlan) => internetPlan.name == data['name'])
          .first,
    );

    return _myInternetPlan;
  }

  Future<void> loadPlans() async {
    List<InternetPlan> internetPlans = [];
    final response = await http.get(
      Uri.parse("${Urls.plans}.json?auth=$_token"),
    );

    if (response.body == 'null') return;

    try {
      Map<String, dynamic> data = jsonDecode(response.body);

      data.forEach(
        (key, internetPlanData) {
          if (internetPlanData != null) {
            internetPlans.add(
              InternetPlan(
                name: key,
                uploadSpeed: internetPlanData['uploadSpeed'],
                downloadSpeed: internetPlanData['downloadSpeed'],
                price: internetPlanData['price'],
              ),
            );
          }
        },
      );
    } catch (e) {}

    _internetPlanList = internetPlans.reversed.toList();
    notifyListeners();
  }
}
