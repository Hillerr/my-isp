import 'package:my_isp/home/models/contracted_internet_plan.dart';
import 'package:my_isp/home/models/repositories/contracted_internet_plan/my_internet_plan_repository_firebase.dart';
import 'package:my_isp/home/models/repositories/contracted_internet_plan/my_internet_plan_repository_mock.dart';

abstract class MyInternetPlanRepository {
  Future<MyInternetPlan> load();

  factory MyInternetPlanRepository() {
    // return MyInternetPlanRepositoryMock();
    return MyInternetPlanRepositoryFirebase();
  }
}
