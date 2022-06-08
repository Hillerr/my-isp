import 'dart:async';

import 'package:my_isp/home/models/internet_plan.dart';
import 'package:my_isp/home/models/repositories/internet_plan/internet_plan_repository.dart';

class InternetPlanRepositoryMock implements InternetPlanRepository {
  static final List<InternetPlan> _internetPlans = [
    InternetPlan(
        name: "Plano 1", uploadSpeed: 250, downloadSpeed: 500, price: 250),
    InternetPlan(
        name: "Plano 2", uploadSpeed: 100, downloadSpeed: 250, price: 200),
    InternetPlan(
        name: "Plano 3", uploadSpeed: 50, downloadSpeed: 100, price: 150),
    InternetPlan(
        name: "Plano 4", uploadSpeed: 25, downloadSpeed: 50, price: 100),
  ];

  static MultiStreamController<List<InternetPlan>>? _controller;
  static final Stream<List<InternetPlan>> _internetPlanStream =
      Stream<List<InternetPlan>>.multi((controller) {
    _controller = controller;
    _controller?.add(_internetPlans);
  });

  @override
  Future<List<InternetPlan>> load() async {
    return _internetPlanStream.first;
  }
}
