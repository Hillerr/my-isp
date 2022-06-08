import 'package:my_isp/home/models/internet_plan.dart';
import 'package:my_isp/home/models/repositories/internet_plan/internet_plan_repository.dart';

class InternetPlanController {
  List<InternetPlan> _internetPlans = [];

  List<InternetPlan> get items => [..._internetPlans];

  int get itemsCount => _internetPlans.length;

  Future<List<InternetPlan>> load() async {
    _internetPlans = await InternetPlanRepository().load();
    return items;
  }
}
