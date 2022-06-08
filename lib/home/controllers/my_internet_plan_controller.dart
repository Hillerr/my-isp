import 'package:my_isp/home/models/contracted_internet_plan.dart';
import 'package:my_isp/home/models/repositories/contracted_internet_plan/my_internet_plan_repository.dart';
import 'package:my_isp/home/models/repositories/contracted_internet_plan/my_internet_plan_repository_mock.dart';

class MyInternetPlanController {
  MyInternetPlan? _myInternetPlan;
  MyInternetPlanRepository _repository = MyInternetPlanRepository();

  Future<MyInternetPlan> load() async {
    _myInternetPlan ??= await _repository.load();
    return _myInternetPlan!;
  }

  MyInternetPlan? get myInternetPlan => _myInternetPlan;
}
