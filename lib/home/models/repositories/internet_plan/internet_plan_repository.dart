import 'package:my_isp/home/models/internet_plan.dart';
import 'package:my_isp/home/models/repositories/internet_plan/internet_plan_repository_firebase.dart';

abstract class InternetPlanRepository {
  Future<List<InternetPlan>> load();

  factory InternetPlanRepository() {
    return InternetPlanRepositoryFirebase();
  }
}
