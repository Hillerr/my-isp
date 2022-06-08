import 'package:flutter/foundation.dart';
import 'package:my_isp/network/models/controlled_device.dart';

class ParentalControl with ChangeNotifier {
  List<ControlledDevice> _controlledDevices = [
    ControlledDevice("PC do Fulano", "5f-32-ff-34-ab"),
    ControlledDevice("PC do Ciclano", "5f-32-ff-34-ab"),
    ControlledDevice("PC do Filho", "5f-32-ff-34-ab"),
    ControlledDevice("PC do Neto", "5f-32-ff-34-ab"),
  ];

  void addDevice(String macAddress, String owner) {
    _controlledDevices.add(ControlledDevice(owner, macAddress));
    notifyListeners();
    print(_controlledDevices);
  }

  void removeDevice(String id) {
    _controlledDevices.removeWhere((element) => element.id == id);
    notifyListeners();
  }

  List<ControlledDevice> get controlledDevices => [..._controlledDevices];

  int get itemsCount => _controlledDevices.length;
}
