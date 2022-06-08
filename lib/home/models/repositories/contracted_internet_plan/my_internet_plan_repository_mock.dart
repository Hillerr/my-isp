import 'dart:async';
import 'package:my_isp/home/models/contracted_internet_plan.dart';
import 'package:my_isp/home/models/internet_plan.dart';
import 'package:my_isp/home/models/repositories/contracted_internet_plan/my_internet_plan_repository.dart';

class MyInternetPlanRepositoryMock implements MyInternetPlanRepository {
  static final _internetPlan = InternetPlan(
    name: "Plano 1",
    uploadSpeed: 50,
    downloadSpeed: 100,
    price: 200,
  );

  static final _myInternetPlan = MyInternetPlan(
    internetPlan: _internetPlan,
    contractedAt: DateTime.now(),
    equipment: "Intelbras ONT Wi-Fiber",
    equipmentImage:
        'https://backend.intelbras.com/sites/default/files/styles/medium/public/2021-02/Perspectiva_esq_1_0.png',
  );

  static MultiStreamController<MyInternetPlan>? _controller;
  static final _myInternetPlanStream =
      Stream<MyInternetPlan>.multi((controller) {
    _controller = controller;
    _controller?.add(_myInternetPlan);
  });

  @override
  Future<MyInternetPlan> load() async {
    return await _myInternetPlanStream.first;
  }
}
