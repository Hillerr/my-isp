class MyInternetPlan {
  InternetPlan internetPlan;
  DateTime contractedAt;
  String equipment;
  String equipmentImage;

  MyInternetPlan({
    required this.internetPlan,
    required this.contractedAt,
    required this.equipment,
    required this.equipmentImage,
  });
}

class InternetPlan {
  String name;
  int uploadSpeed;
  int downloadSpeed;
  int price;

  InternetPlan({
    required this.name,
    required this.uploadSpeed,
    required this.downloadSpeed,
    required this.price,
  });
}
